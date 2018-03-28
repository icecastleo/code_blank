#include "Engine.h"

#include <cassert>

#include "NativeContext.h"

#include "RenderingSystem.h"
#include "PhysicsSystem.h"
#include "InputSystem.h"
#include "MemoryAllocator.h"

#include "AnimationComponent.h"
#include "CameraComponent.h"
#include "LightComponent.h"
#include "PhysicsComponent.h"
#include "RenderingComponent.h"
#include "TransformComponent.h"

namespace tofu
{
	float Time::TotalTime = 0.0f;
	float Time::DeltaTime = 0.0f;
	float Time::PhysicsTotalTime = 0.0f;
	float Time::FixedDeltaTime = kDefaultFixedDeltaTime;

	SINGLETON_IMPL(Engine);

	Engine::Engine()
		:
		nativeContext(nullptr),
		renderingSystem(nullptr),
		inputSystem(nullptr),
		userModules(),
		numUserModules(0),
		timeCounterFreq(0),
		startTimeCounter(0),
		lastTimeCounter(0),
		currentTimeCounter(0)
	{
		assert(nullptr == _instance);
		_instance = this;
	}

	int32_t Engine::AddModule(Module * module)
	{
		if (numUserModules >= kMaxUserModules)
			return kErrUnknown;

		userModules[numUserModules] = module;
		numUserModules++;

		return module->Init();
	}

	int32_t Engine::Init(const char* filename)
	{
		// Initialize Memory Management for Rendering
		CHECKED(MemoryAllocator::Allocators[kAllocGlobal].Init(
			kGlobalMemSize,
			kGlobalMemAlign));

		CHECKED(MemoryAllocator::Allocators[kAllocLevel].Init(
			kLevelMemSize,
			kLevelMemAlign));

		for (uint32_t i = kAllocFrame;
			i <= kAllocFrameEnd;
			++i)
		{
			CHECKED(MemoryAllocator::Allocators[i].Init(
				kFrameMemSize,
				kFrameMemAlign));
		}

		// init entity system
		Entity::RegisterComponent<AnimationComponent>();
		Entity::RegisterComponent<CameraComponent>();
		Entity::RegisterComponent<LightComponent>();
		Entity::RegisterComponent<PhysicsComponent>();
		Entity::RegisterComponent<RenderingComponent>();
		Entity::RegisterComponent<TransformComponent>();
		CHECKED(Entity::Init());

		// initialize native context
		nativeContext = NativeContext::Create();
		if (nullptr == nativeContext)
			return kErrUnknown;
		int32_t err = nativeContext->Init();
		CHECKED(err);

		// initialize rendering system
		renderingSystem = new RenderingSystem();
		CHECKED(renderingSystem->Init());

		// initialize physics system
		physicsSystem = new PhysicsSystem();
		CHECKED(physicsSystem->Init());

		// initialize input system
		inputSystem = new InputSystem();
		CHECKED(inputSystem->Init());

		Time::FixedDeltaTime = kDefaultFixedDeltaTime;

		return kOK;
	}

	int32_t Engine::Run()
	{
		// keep performance counter on start
		timeCounterFreq = nativeContext->GetTimeCounterFrequency();
		startTimeCounter = nativeContext->GetTimeCounter();
		currentTimeCounter = startTimeCounter;
		lastTimeCounter = currentTimeCounter;

		Time::TotalTime = 0.0f;
		Time::PhysicsTotalTime = 0.0f;

		// process native event and see if we need to quit
		while(nativeContext->ProcessEvent())
		{
			// update timing data
			currentTimeCounter = nativeContext->GetTimeCounter();

			int64_t deltaTimeCounter = (currentTimeCounter - lastTimeCounter) * 1000000;
			float deltaTime = (deltaTimeCounter / timeCounterFreq) / 1000000.0f;

			// lock to 60 fps
			if (deltaTime < 0.016f) continue;

			Time::DeltaTime = deltaTime;
			Time::TotalTime += Time::DeltaTime;

			lastTimeCounter = currentTimeCounter;

			// a new frame start

			CHECKED(renderingSystem->BeginFrame());

			CHECKED(inputSystem->Update());

			CHECKED(physicsSystem->PreUpdate());

			// TODO: we put the clean up here to
			// wait physics system delete rigibodies
			Entity::CleanupComponents();

			float phyTime = Time::PhysicsTotalTime;

			while (phyTime + Time::FixedDeltaTime <= Time::TotalTime)
			{
				CHECKED(physicsSystem->Update());
				phyTime += Time::FixedDeltaTime;
				Time::PhysicsTotalTime = phyTime;

				for (uint32_t i = 0; i < numUserModules; i++)
				{
					CHECKED(userModules[i]->FixedUpdate());
				}
			}

			CHECKED(physicsSystem->PostUpdate());

			for (uint32_t i = 0; i < numUserModules; i++)
			{
				CHECKED(userModules[i]->Update());
			}

			CHECKED(renderingSystem->Update());

			CHECKED(renderingSystem->EndFrame());

			// frame ends
		}

		CHECKED(Shutdown());
		return kOK;
	}

	int32_t Engine::Quit()
	{
		return nativeContext->QuitApplication();
	}

	int32_t Engine::UnloadLevel()
	{
		CHECKED(Entity::Reset());
		CHECKED(renderingSystem->CleanupLevelResources());
		MemoryAllocator::Allocators[kAllocLevel].Reset();
		return kOK;
	}

	int32_t Engine::Shutdown()
	{
		for (uint32_t i = 0; i < numUserModules; i++)
		{
			CHECKED(userModules[i]->Shutdown());
			delete userModules[i];
		}

		CHECKED(inputSystem->Shutdown());
		delete inputSystem;

		CHECKED(physicsSystem->Shutdown());
		delete physicsSystem;

		CHECKED(renderingSystem->Shutdown());
		delete renderingSystem;

		CHECKED(nativeContext->Shutdown());
		delete nativeContext;

		CHECKED(Entity::Shutdown());

		// shutdown memory allocators

		for (uint32_t i = kAllocFrame;
			i <= kAllocFrameEnd;
			++i)
		{
			CHECKED(MemoryAllocator::Allocators[i].Shutdown());
		}

		CHECKED(MemoryAllocator::Allocators[kAllocLevel].Shutdown());

		CHECKED(MemoryAllocator::Allocators[kAllocGlobal].Shutdown());

		return kOK;
	}

}
