#include "ResourceManager.h"

#include "FileIO.h"
#include "RenderingSystem.h"
#include "MemoryAllocator.h"

using namespace rapidjson;

namespace tofu
{

	//SINGLETON_IMPL(ResourceManager);

	int32_t ResourceManager::Init()
	{
		CHECKED(LoadConfig());

		return kOK;
	}

	Material* ResourceManager::LoadMaterial(const char * name)
	{
		{
			auto iter = materials.find(name);
			if (iter != materials.end())
			{
				return iter->second;
			}
		}

		auto iter = matTable.find(name);
		if (iter == matTable.end())
		{
			return nullptr;
		}

		const Value& matConfig = config["materials"][(SizeType)iter->second];

		TextureHandle albedo = TextureHandle();
		const char* albedoTexPath = matConfig["AlbedoMap"].GetString();
		if (nullptr != albedoTexPath && albedoTexPath[0] != 0)
		{
			albedo = LoadTexture(albedoTexPath);
			if (!albedo)
			{
				return nullptr;
			}
		}

		TextureHandle normal = TextureHandle();
		const char* normalMapPath = matConfig["NormalMap"].GetString();
		if (nullptr != normalMapPath && normalMapPath[0] != 0)
		{
			normal = LoadTexture(normalMapPath);
			if (!normal)
			{
				return nullptr;
			}
		}

		TextureHandle metallicGloss = TextureHandle();
		const char* metallicMapPath = matConfig["MetallicGlossMap"].GetString();
		if (nullptr != metallicMapPath && metallicMapPath[0] != 0)
		{
			metallicGloss = LoadTexture(metallicMapPath);
			if (!metallicGloss)
			{
				return nullptr;
			}
		}

		TextureHandle occlusion = TextureHandle();
		const char* occlusionPath = matConfig["OcclusionMap"].GetString();
		if (nullptr != occlusionPath && occlusionPath[0] != 0)
		{
			occlusion = LoadTexture(occlusionPath);
			if (!occlusion)
			{
				return nullptr;
			}
		}

		Material* mat = RenderingSystem::instance()->CreateMaterial(kMaterialTypeOpaque);
		mat->SetTexture(albedo);
		mat->SetNormalMap(normal);
		mat->SetMetallicGlossMap(metallicGloss);
		mat->SetOcclusionMap(occlusion);

		materials.insert(std::pair<std::string, Material*>(name, mat));
		return mat;
	}

	TextureHandle ResourceManager::LoadTexture(const char* path)
	{
		auto iter = textures.find(path);
		if (iter != textures.end())
			return iter->second;

		char filename[1024] = "assets/";
		strcat_s(filename, path);
		strcat_s(filename, ".texture");

		TextureHandle handle = RenderingSystem::instance()->CreateTexture(filename);

		if (handle)
		{
			textures.insert(std::pair<std::string, TextureHandle>(path, handle));
		}

		return handle;
	}

	int32_t ResourceManager::LoadConfig()
	{
		char* json = nullptr;
		CHECKED(FileIO::ReadFile(
			"assets/res.json",
			true,
			4,
			kAllocLevelBasedMem,
			reinterpret_cast<void**>(&json),
			nullptr));

		config.Parse(json);

		// load material list
		if (!config.HasMember("materials"))
			return kErrUnknown;

		const Value& matList = config["materials"];

		matTable.clear();
		if (!matList.IsNull())
		{
			if (!matList.IsArray())
				return kErrUnknown;

			for (SizeType i = 0; i < matList.Size(); i++)
			{
				matTable.insert(std::pair<std::string, size_t>(
					matList[i]["Name"].GetString(),
					i
					));
			}
		}

		// load texture list
		if (!config.HasMember("textures"))
			return kErrUnknown;

		const Value& texList = config["textures"];

		texTable.clear();
		if (!texList.IsNull())
		{
			if (!texList.IsArray())
				return kErrUnknown;

			for (SizeType i = 0; i < texList.Size(); i++)
			{
				texTable.insert(std::pair<std::string, size_t>(
					texList[i]["Path"].GetString(),
					i
					));
			}
		}

		return kOK;
	}

}