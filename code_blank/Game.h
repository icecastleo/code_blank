#pragma once

#include <Tofu.h>
#include "Character.h"
#include "PController.h"
#include "Camera.h"
#include "Enemy.h"
#include "Utility.h"

using namespace tofu;

// Game: The main game loop.
// Runs all things game related.
class Game : public tofu::Module
{
public:
	virtual int32_t Init() override;

	virtual int32_t Shutdown() override;

	virtual int32_t Update() override;

	virtual int32_t FixedUpdate() override;

	virtual ~Game() override;

private:
	// Temp variables for testing
	tofu::TransformComponent tIntro;
	tofu::TransformComponent tCube;
	tofu::TransformComponent tBox;
	tofu::TransformComponent tBox2;
	tofu::TransformComponent tBox3;
	tofu::TransformComponent tBox4;
	tofu::TransformComponent tBox5;
	tofu::TransformComponent tBox6;
	tofu::TransformComponent tBox7;
	tofu::TransformComponent tGround;

	tofu::TransformComponent tStair;
	tofu::PhysicsComponent pStair;

	// Class variables
	//tofu::CameraComponent cam;
	Camera* cam;
	Player* player;
	Companion* comp;
	PController* pControl;

	std::vector<Character*>* enemyList;
	std::vector<PathNode*>* pathNodes;

	enum sceneType
	{
		intro = 0,
		menu = 1,
		options = 2,
		help = 3,
		loading = 4,
		tutorial = 5,
		level = 6,
		pause = 7,
		death = 8,
		levelEnd = 9,
		credits = 10,
	};

	tofu::SceneManager sceneMgr;
	sceneType currentScene;
	sceneType lastScene;
	sceneType levelToLoad;

	// Member Functions
	// These may be temporary or call the needed functions.
	// Will change int to file name later for JSON use.
	bool LoadScene(sceneType);
	bool UnloadScene(sceneType);
	bool LoadOnTop(sceneType);
	bool UnloadOffTop(sceneType);
	UIResult LoadUI(sceneType);

	//*********************************************************************************************
	//temp for test
	Enemy* enemy01;
	Enemy* enemy02;
	Enemy* enemy03;
	Enemy* enemy04;
	Enemy* enemy05;
	Enemy* enemy06;
	float timePassed;
	float startTime;
	bool loopStart;

	bool debugMode;

	Utility::GhostPlayer* DebugPlayer;

	tofu::AudioSource			gameplay{ "assets/sounds/Game_Play.wav" };
	tofu::AudioSource			jumpSfx{ "assets/sounds/Jump.wav" };

	//*********************************************************************************************

	// UI
	tofu::TextureHandle			uiBGTex_0;
	tofu::TextureHandle			uiButTex;
	tofu::TextureHandle			uiGamePadPC;
	tofu::Atlas					atlas;

	uint32_t					mainMenuSelectedItem;
	uint32_t					levelMenuSelectedItem;
	uint32_t					optionMenuSelectedItem;
	uint32_t					helpMenuSelectedItem;
	uint32_t					creditsMenuSelectedItem;
	uint32_t					endMenuSelectedItem;
	uint32_t					deathMenuSelectedItem;

	bool						mainMenuFocused;
	bool						levelMenuFocused;
	bool						optionMenuFocused;
	bool						helpMenuFocused;

	uint32_t					inverseCameraAxisX;
	uint32_t					inverseCameraAxisY;

	UIResult					uiResult;

	uint32_t					uiTimer;
};