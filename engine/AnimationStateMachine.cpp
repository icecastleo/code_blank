#include "Transform.h"
#include "AnimationStateMachine.h"
#include "MemoryAllocator.h"
#include "Engine.h"
#include "Model.h"
#include "Compression.h"
#include <assert.h>
#include <algorithm>
#include <string>

using namespace tofu::model;
using namespace tofu::math;
using namespace tofu::compression;

namespace tofu
{
	EvaluateContext::EvaluateContext(Model * model) :model(model)
	{
		results = new Transform[model->header->NumBones];
	}

	EvaluateContext::~EvaluateContext()
	{
		delete[] results;
	}

	void AnimationFrameCache::Reset()
	{
		// Assume channel numbers SQT = 3
		for (int i = 0; i < 3; i++) {
			indices[i][0] = SIZE_MAX;
			indices[i][1] = SIZE_MAX;
			indices[i][2] = SIZE_MAX;
			indices[i][3] = SIZE_MAX;
		}
	}

	void AnimationFrameCache::AddFrameIndex(model::ChannelType type, size_t index)
	{
		indices[type][0] = indices[type][1];
		indices[type][1] = indices[type][2];
		indices[type][2] = indices[type][3];
		indices[type][3] = index;
	}

	AnimNodeBase::AnimNodeBase(std::string name) : name(name)
	{
		
	}

	AnimationState::~AnimationState()
	{
		if(cache)
			delete cache;
	}

	void AnimationState::Enter(Model *model)
	{
		cache = new AnimationStateCache();
		cache->frameCaches.resize(model->header->NumBones);
	}

	void AnimationState::Exit()
	{
		delete cache;
		cache = nullptr;
	}

	void AnimationStateCache::Reset()
	{
		ticks = 0;
		cursor = 0;

		for (AnimationFrameCache &cache : frameCaches) {
			cache.Reset();
		}
	}

	void AnimationStateCache::Update(UpdateContext* context, ModelAnimation* animation)
	{
		// TODO: backward animation & update cache

		// prevent load-hit-store
		size_t tempCursor = cursor;

		while (tempCursor < animation->numFrames) {
			size_t frameIndex = tempCursor + animation->startFrames;
			ModelAnimFrame &frame = context->model->frames[frameIndex];

			if (frame.GetJointIndex() == kModelMaxJointIndex) {
				tempCursor++;
				continue;
			}

			AnimationFrameCache &cache = frameCaches[frame.GetJointIndex()];
			size_t cacheIndex = cache.indices[frame.GetChannelType()][2];

			if (cacheIndex != SIZE_MAX && context->model->frames[cacheIndex].time > ticks) {
				break;
			}

			cache.AddFrameIndex(frame.GetChannelType(), frameIndex);
			tempCursor++;
		}
		cursor = tempCursor;
	}

	void AnimationState::Update(UpdateContext& context)
	{
		model::ModelAnimation *anim = context.model->GetAnimation(animationName);

		// no animation for the state
		if (anim == nullptr)
			return;

		// convert time in seconds to ticks
		cache->ticks += Time::DeltaTime * playbackSpeed * anim->ticksPerSecond;

		// TODO: add exit time & transition
		if (cache->ticks > anim->tickCount) {
			if (isLoop) {
				cache->ticks = std::fmodf(cache->ticks, anim->tickCount);
				cache->Reset();
			}
			else {
				// end of animation
			}
		}

		cache->Update(&context, anim);
	}

	void AnimationState::Evaluate(EvaluateContext & context, float weight, AnimationEvaluationType type)
	{
		for (size_t i = 0; i < cache->frameCaches.size(); i++)
		{
			AnimationFrameCache &frameCache = cache->frameCaches[i];

			Model *model = context.model;

			Transform trans;

			size_t *indices = frameCache.indices[kChannelTranslation];

			if (indices[1] != SIZE_MAX)
			{
				if (model->frames[indices[2]].time <= cache->ticks) {
					trans.SetTranslation(CatmullRomIndex(model, indices[1], indices[2], indices[3], indices[3]));
				}
				else {
					trans.SetTranslation(CatmullRomIndex(model, indices[0] == SIZE_MAX ? indices[1] : indices[0], indices[1], indices[2], indices[3]));
				}
			}
			else if (indices[2] != SIZE_MAX) {
				trans.SetTranslation(LerpFromFrameIndex(model, indices[2], indices[3]));
			}
			else if (indices[3] != SIZE_MAX) {
				trans.SetTranslation(model->frames[indices[3]].value);
			}
			else {
				trans.SetTranslation(model->bones[i].transform.GetTranslation());
			}

			indices = frameCache.indices[kChannelRotation];

			if (indices[1] != SIZE_MAX)
			{
				if (model->frames[indices[2]].time <= cache->ticks) {
					trans.SetRotation(SquadIndex(model, indices[1], indices[2], indices[3], indices[3]));
				}
				else {
					trans.SetRotation(SquadIndex(model, indices[0] == SIZE_MAX ? indices[1] : indices[0], indices[1], indices[2], indices[3]));
				}
			}
			else if (indices[2] != SIZE_MAX) {
				trans.SetRotation(SlerpFromFrameIndex(model, indices[2], indices[3]));
			}
			else if (indices[3] != SIZE_MAX) {
				quat q;
				decompress(model->frames[indices[3]].value, q);
				trans.SetRotation(q);
			}
			else {
				trans.SetRotation(model->bones[i].transform.GetRotation());
			}

			indices = frameCache.indices[kChannelScale];

			if (indices[1] != SIZE_MAX)
			{
				if (model->frames[indices[2]].time <= cache->ticks) {
					trans.SetScale(CatmullRomIndex(model, indices[1], indices[2], indices[3], indices[3]));
				}
				else {
					trans.SetScale(CatmullRomIndex(model, indices[0] == SIZE_MAX ? indices[1] : indices[0], indices[1], indices[2], indices[3]));
				}
			}
			else if (indices[2] != SIZE_MAX) {
				trans.SetScale(LerpFromFrameIndex(model, indices[2], indices[3]));
			}
			else if (indices[3] != SIZE_MAX) {
				trans.SetScale(model->frames[indices[3]].value);
			}
			else {
				trans.SetScale(model->bones[i].transform.GetScale());
			}

			if (type == kAET_Blend) {
				context.results[i].Blend(trans, weight);
			}
			else if (type == kAET_Additive) {
				context.results[i].Additive(trans, weight);
			}
			else {
				assert(0);
			}
		}
	}

	float AnimationState::GetDurationInSecond(Model * model)
	{
		auto anim = model->GetAnimation(animationName);

		// state without animation
		if (anim == nullptr)
			return 0.f;

		return anim->tickCount / anim->ticksPerSecond;
	}

	math::float3 AnimationState::CatmullRomIndex(Model *model, size_t i1, size_t i2, size_t i3, size_t i4) const
	{
		ModelAnimFrame& f1 = model->frames[i1];
		ModelAnimFrame& f2 = model->frames[i2];
		ModelAnimFrame& f3 = model->frames[i3];
		ModelAnimFrame& f4 = model->frames[i4];

		float t = (cache->ticks - f2.time) / (f3.time - f2.time);
		assert(!std::isnan(t) && !std::isinf(t) && t >= 0.0f && t <= 1.0f);

		return catmullRom(f1.value, f2.value, f3.value, f4.value, t);
	}

	math::quat AnimationState::SquadIndex(Model *model, size_t i1, size_t i2, size_t i3, size_t i4) const
	{
		ModelAnimFrame& f1 = model->frames[i1];
		ModelAnimFrame& f2 = model->frames[i2];
		ModelAnimFrame& f3 = model->frames[i3];
		ModelAnimFrame& f4 = model->frames[i4];

		math::quat q1, q2, q3, q4;

		float t = (cache->ticks - f2.time) / (f3.time - f2.time);
		assert(!std::isnan(t) && !std::isinf(t) && t >= 0.0f && t <= 1.0f);

		decompress(f1.value, q1);
		decompress(f2.value, q2);
		decompress(f3.value, q3);
		decompress(f4.value, q4);

		// FIXME: change after cruve fitting
		return math::slerp(q2, q3, t);
		//return squad(q2, q3, intermediate(q1, q2, q3), intermediate(q2, q3, q4), t);
	}

	math::float3 AnimationState::LerpFromFrameIndex(Model *model, size_t lhs, size_t rhs) const
	{
		ModelAnimFrame& fa = model->frames[lhs];
		ModelAnimFrame& fb = model->frames[rhs];

		float t = (cache->ticks - fa.time) / (fb.time - fa.time);
		assert(!std::isnan(t) && !std::isinf(t) && t >= 0.0f && t <= 1.0f);

		return math::mix(fa.value, fb.value, t);
	}

	math::quat AnimationState::SlerpFromFrameIndex(Model *model, size_t lhs, size_t rhs) const
	{
		ModelAnimFrame& fa = model->frames[lhs];
		ModelAnimFrame& fb = model->frames[rhs];

		float t = (cache->ticks - fa.time) / (fb.time - fa.time);
		assert(!std::isnan(t) && !std::isinf(t) && t >= 0.0f && t <= 1.0f);

		math::quat a, b;

		decompress(fa.value, a);
		decompress(fb.value, b);

		return math::slerp(a, b, t);
	}

	AnimationStateMachine::AnimationStateMachine(std::string name) :
		AnimNodeBase(name)
	{
		states.push_back(new AnimNodeBase("entry"));
		current = states.back();
	}

	AnimationStateMachine::~AnimationStateMachine()
	{
		for (AnimNodeBase* node : states) {
			// FIXME: Chi
			//node->~AnimNodeBase();
			delete node;
		}
	}

	AnimationState* AnimationStateMachine::AddState(std::string name)
	{
		stateIndexTable[name] = static_cast<uint16_t>(states.size());

		//// TODO: allocator
		//AnimationState *state = static_cast<AnimationState *>(
		//	MemoryAllocator::Allocators[kAllocLevelBasedMem].Allocate(sizeof(AnimationState), alignof(AnimationState)));

		//states.push_back(new(state)AnimationState(name));

		//return state;

		states.push_back(new AnimationState(name));
		return static_cast<AnimationState*>(states.back());
	}

	void AnimationStateMachine::Play(std::string name)
	{
		transitions.push_front(AnimationTransitionEntry{ name, 0.0f });
	}

	void AnimationStateMachine::CrossFade(std::string name, float normalizedDuration)
	{
		transitions.push_front(AnimationTransitionEntry{ name, normalizedDuration });
	}

	void AnimationStateMachine::Enter(Model *model)
	{

	}

	void AnimationStateMachine::Exit()
	{
		if (previous) {
			previous->Exit();
		}

		current->Exit();
	}

	void AnimationStateMachine::Update(UpdateContext& context)
	{
		// check transition
		for (AnimationTransitionEntry &entry : transitions) {

			// same state
			if (entry.name.compare(current->name) == 0)
				continue;

			// TODO: also check state availability, abstract methond
			if (stateIndexTable.find(entry.name) != stateIndexTable.end()) {

				if (previous) {
					previous->Exit();
				}
				previous = current;

				current = states[stateIndexTable[entry.name]];
				current->Enter(context.model);

				elapsedTime = 0.f;

				transitionDuration = entry.normalizedDuration * current->GetDurationInSecond(context.model);
				break;
			}
		}

		// update current animation play back time
		elapsedTime += Time::DeltaTime;

		if (transitionDuration) {
			if (elapsedTime > transitionDuration) {
				transitionDuration = 0.f;
			}
			else {
				previous->Update(context);
			}
		}

		// TODO: better way to prevent passing previous transition?
		// only allow one transition?
		transitions.clear();

		current->Update(context);
	}

	void AnimationStateMachine::Evaluate(EvaluateContext & context, float weight, AnimationEvaluationType type)
	{
		if (transitionDuration) {
			float alpha = elapsedTime / transitionDuration;

			if (type == kAET_Blend) {
				for (auto i = 0; i < context.model->header->NumBones; i++) {
					context.results[i] *= 1.0f - weight;
				}
			}

			previous->Evaluate(context, (1.0f - alpha) * weight, kAET_Additive);
			current->Evaluate(context, alpha * weight, kAET_Additive);
		}
		else {
			current->Evaluate(context, weight, type);
		}
	}

	float AnimationStateMachine::GetDurationInSecond(Model * model)
	{
		return current->GetDurationInSecond(model);
	}

	AnimationLayer::AnimationLayer(std::string name, float weight, AnimationEvaluationType type)
		:name(name), weight(weight), type(type), stateMachine("default")
	{
	}

	void AnimationLayer::Update(Model *model)
	{ 
		// TODO: Add transition parameter
		UpdateContext context{ model };
		stateMachine.Update(context);
	}

	void AnimationLayer::Evaluate(EvaluateContext & context)
	{
		stateMachine.Evaluate(context, weight, type);
	}

	void swap(AnimNodeBase & lhs, AnimNodeBase & rhs) noexcept
	{
		using std::swap;
		swap(lhs.name, rhs.name);
	}

	void swap(AnimationState & lhs, AnimationState & rhs) noexcept
	{
		using std::swap;
		swap(lhs.name, rhs.name);
		swap(lhs.animationName, rhs.animationName);
		swap(lhs.cache, rhs.cache);
	}

	void swap(AnimationStateMachine & lhs, AnimationStateMachine & rhs) noexcept
	{
		using std::swap;
		swap(lhs.name, rhs.name);
		swap(lhs.previous, rhs.previous);
		swap(lhs.current, rhs.current);
		swap(lhs.transitions, rhs.transitions);
		swap(lhs.states, rhs.states);
		swap(lhs.stateIndexTable, rhs.stateIndexTable);
	}
}