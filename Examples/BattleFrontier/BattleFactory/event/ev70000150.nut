function CreateTeam2(players, difficulty) {
	local team = [];
	
    // Define weights
    local weights = {GK = 10, DF = 30, MF = 30, FW = 30};
	
	local index = 0;
	while (CMND_GET_PARTY_MEMBER_NUM() < 17) {
		// Generate random player
		getRandomPosition <- getRandomKeyWithWeights(weights);
		addPlayerToTeam(players, team, function(p) { return p.position == getRandomPosition; }, difficulty);
		
		// Recruit the newest player
		local newPlayer = CMND_ADD_PARTY(team[index].name);
		CMND_SET_LV(newPlayer, 99);
				
		for (local i = 0; i < team[index].hissatsus.len(); i++) {
			CMND_SET_SKILL(newPlayer, team[index].hissatsus[i].crc32, i);
		}
		
		index += 1;
	}
}

Event <- function ()
{	
	// Turn top screen to black
	StartBrightFade(SCREEN_A, -1.0, 30);
	
	// Init camera
	local hCam = CMND_GET_ACT_CAMERA();
	CamCtrlInit(hCam);
	
	// Prepare the new BGM
	local bgm = CMND_SND_OPEN_BGM("M_13");
	while (CMND_SND_IS_LOADING(bgm))
	{
		suspend();
	}	
	
	local randomNPCIndex = GetRandomNumberList(3, 563);

	// Create npc
	local factoryGuy = CreateEvLowMdlForCharaNo_NPCOnly("\x0082\x00d4\x0082\x00a9\x0082`L", 1080);
	local whyte = CreateEvLowMdlForNumber("\x0083g\x0083L\x0083IL", 201, 10, true, true);
	local npcRandom1 = CreateEvLowMdlForNumber("npcRandom1", randomNPCIndex[0] + 1001, 111, true, false);
	local npcRandom2 = CreateEvLowMdlForNumber("npcRandom2", randomNPCIndex[1] + 1001, 111, true, false);
	local npcRandom3 = CreateEvLowMdlForNumber("npcRandom3", randomNPCIndex[2] + 1001, 111, true, false);
	
	// Init position
	SetCharaPosAndMotName(factoryGuy, [-10, 0, -10, 0], "\x0097\x00a7\x0082\x00bf01");
	SetCharaPosAndMotName(whyte, [0, 0, 0, 0], "\x0097\x00a7\x0082\x00bf01");
	SetCharaPosAndMotName(npcRandom1, [0, 0, 20, 180], "\x0097\x00a7\x0082\x00bf01");
	SetCharaPosAndMotName(npcRandom2, [10, 0, 30, 180], "\x0097\x00a7\x0082\x00bf01");
	SetCharaPosAndMotName(npcRandom3, [-10, 0, 30, 180], "\x0097\x00a7\x0082\x00bf01");
	
	// Wait
	WaitLoading(factoryGuy);
	WaitLoading(whyte);
	WaitLoading(npcRandom1);
	WaitLoading(npcRandom2);
	WaitLoading(npcRandom3);

	CMND_SET_ENABLE(factoryGuy, true);
	CMND_SET_ENABLE(whyte, true);
	CMND_SET_ENABLE(npcRandom1, true);
	CMND_SET_ENABLE(npcRandom2, true);
	CMND_SET_ENABLE(npcRandom3, true);
	
	SetDrawAndPause(false);	
	
	CMND_SND_PLAY(bgm);
	
	StartBrightFade(SCREEN_AB, 0.0, EV_FADE_SLOW);
	
	CreateSpeech("ev100"); // random scout talk
	CreateSpeech("ev150"); // whyte talk
	CreateSpeech("ev200"); // random scout talk
	CreateSpeech("ev250"); // whyte talk
	CreateSpeech("ev300"); // random scout talk
	CreateSpeech("ev350"); // whyte talk
	CreateSpeech("ev400"); // random scout talk
	
	local npcRandom1Walk = function () : ( npcRandom1 )
	{
		WaitFrame(1);
		CMND_CHR_TURN_AUTO_TRG(npcRandom1, 0, 360, 1);
		
		CMND_CHR_POS_VAL_TRG(npcRandom1, [
			0,
			0,
			80
		], 999, 0, EV_MINI_CHARA_MOVE_SPEED_WALK);
						
		while (CMND_CHR_POS_VAL_IS_MOVING(npcRandom1))
		{
			suspend();
		}
	};
	local npcRandom2Walk = function () : ( npcRandom2 )
	{
		WaitFrame(1);
		CMND_CHR_TURN_AUTO_TRG(npcRandom2, 0, 360, 1);
		
		CMND_CHR_POS_VAL_TRG(npcRandom2, [
			10,
			0,
			80
		], 999, 0, EV_MINI_CHARA_MOVE_SPEED_WALK);
						
		while (CMND_CHR_POS_VAL_IS_MOVING(npcRandom2))
		{
			suspend();
		}
	};
	local npcRandom3Walk = function () : ( npcRandom3 )
	{
		WaitFrame(1);
		CMND_CHR_TURN_AUTO_TRG(npcRandom3, 0, 360, 1);
		
		CMND_CHR_POS_VAL_TRG(npcRandom3, [
			-10,
			0,
			80
		], 999, 0, EV_MINI_CHARA_MOVE_SPEED_WALK);
						
		while (CMND_CHR_POS_VAL_IS_MOVING(npcRandom3))
		{
			suspend();
		}
	};

	InitChildThread(3);
	AddChildThread(npcRandom1Walk);
	AddChildThread(npcRandom2Walk);
	AddChildThread(npcRandom3Walk);
	RunChildThread();
	
	CMND_DELETE_CHARA(npcRandom1);
	CMND_DELETE_CHARA(npcRandom2);
	CMND_DELETE_CHARA(npcRandom3);	
	
	QuickTurn(whyte, factoryGuy, true, true);
	CreateSpeech("ev450"); // factory guy talk
	
	if (CMND_RANDOM(100) < 50) 
	{
		// Grisley
		CreateSpeech("ev460"); // factory talk
		
		local grisley = CreateEvLowMdlForNumber("\x0082\x00c2\x0082\x00e9\x0082\x00acL", 216, 10, true, false);
		SetCharaPosAndMotName(grisley, [0, 0, 80, 180], "\x0097\x00a7\x0082\x00bf01");
		WaitLoading(grisley);
		
		local factoryTurn = function () : ( factoryGuy, grisley )
		{
			WaitFrame(1);
			QuickTurn(factoryGuy, grisley, true, true);
		};
		local whytetTurn = function () : ( whyte, grisley )
		{
			WaitFrame(1);
			QuickTurn(whyte, grisley, true, true);
		};

		InitChildThread(2);
		AddChildThread(factoryTurn);
		AddChildThread(whytetTurn);
		RunChildThread();		
		
		CMND_SET_ENABLE(grisley, true);
		CMND_CHR_POS_VAL_TRG(grisley, [
			0,
			0,
			20
		], 999, 0, EV_MINI_CHARA_MOVE_SPEED_RUN);
					
		while (CMND_CHR_POS_VAL_IS_MOVING(grisley))
		{
			suspend();
		}
		
		CMND_CHR_TURN_AUTO_TRG(grisley, 0, 180, 1);
		
		local whyteStandEvent = CreateEvHiMdlForNumber("\x0082\x00b5\x0082\x00eb\x0082\x00b3\x0082\x00abH", 201, 10, true, true);
		local grisleyStandEvent = CreateEvHiMdlForNumber("grisleyStandEvent", 216, 10, true, false);
		WaitLoading(whyteStandEvent);	
		WaitLoading(grisleyStandEvent);
				
		SetDrawAndPause(false);
		StartBrightFade(SCREEN_AB, 0.0, 60);
		CMND_RESET_TALK_CHARA();
		StartStandEvent();
		SetHiMdlPosAndMotID(whyteStandEvent, EV_CHARA_POS_LEFT, [
			61,
			6,
			1
		], "cp0201");
		SetHiMdlPosAndMotID(grisleyStandEvent, EV_CHARA_POS_RIGHT, [
			33,
			3,
			1
		], "cp0216");		
		StandEventCharaFadeWait([whyteStandEvent, grisleyStandEvent], 1.0);
		CMND_MESWIN_LOCK();
		CreateSpeech("ev461", 0, true); // Grisley Talk
		CreateSpeech("ev462"); // Whyte Talk
		EndStandEvent();
		CMND_MESWIN_UNLOCK();
		CMND_DELETE_CHARA(whyteStandEvent);
		CMND_DELETE_CHARA(grisleyStandEvent);

		EncountEffect();
		CMND_DELETE_CHARA(grisley);
		CMND_DELETE_CHARA(whyte);
	} else 
	{
		// Ascot
		CreateSpeech("ev470"); // whyte talk
		
		local ascot = CreateEvLowMdlForNumber("\x0082\x00a0\x0082\x00a8\x0082\x00e2\x0082\x00dcL", 133, 6, true, false);
		SetCharaPosAndMotName(ascot, [0, 0, 80, 180], "\x0097\x00a7\x0082\x00bf01");
		WaitLoading(ascot);
		
		local factoryTurn = function () : ( factoryGuy, ascot )
		{
			WaitFrame(1);
			QuickTurn(factoryGuy, ascot, true, true);
		};
		local whytetTurn = function () : ( whyte, ascot )
		{
			WaitFrame(1);
			QuickTurn(whyte, ascot, true, true);
		};

		InitChildThread(2);
		AddChildThread(factoryTurn);
		AddChildThread(whytetTurn);
		RunChildThread();			
		
		CMND_SET_ENABLE(ascot, true);
		CMND_CHR_POS_VAL_TRG(ascot, [
			0,
			0,
			20
		], 999, 0, EV_MINI_CHARA_MOVE_SPEED_WALK);
					
		while (CMND_CHR_POS_VAL_IS_MOVING(ascot))
		{
			suspend();
		}

		CMND_CHR_TURN_AUTO_TRG(ascot, 0, 180, 1);
		
		local whyteStandEvent = CreateEvHiMdlForNumber("\x0082\x00b5\x0082\x00eb\x0082\x00b3\x0082\x00abH", 201, 10, true, true);
		local ascotStandEvent = CreateEvHiMdlForNumber("ascotStandEvent", 133, 6, true, false);
		WaitLoading(whyteStandEvent);	
		WaitLoading(ascotStandEvent);
				
		SetDrawAndPause(false);
		StartBrightFade(SCREEN_AB, 0.0, 60);
		CMND_RESET_TALK_CHARA();
		StartStandEvent();
		SetHiMdlPosAndMotID(whyteStandEvent, EV_CHARA_POS_LEFT, [
			61,
			6,
			1
		], "cp0201");
		SetHiMdlPosAndMotID(ascotStandEvent, EV_CHARA_POS_RIGHT, [
			11,
			7,
			1
		], "cp0133");		
		StandEventCharaFadeWait([whyteStandEvent, ascotStandEvent], 1.0);
		CMND_MESWIN_LOCK();
		CreateSpeech("ev471", 0, true); // Ascot Talk
		CreateSpeech("ev472"); // Whyte Talk
		EndStandEvent();
		CMND_MESWIN_UNLOCK();
		CMND_DELETE_CHARA(whyteStandEvent);
		CMND_DELETE_CHARA(ascotStandEvent);		
		
		EncountEffect();
		CMND_DELETE_CHARA(ascot);
		CMND_DELETE_CHARA(whyte);
	}
	
	// Prepare the new BGM
	bgm = CMND_SND_OPEN_BGM("M_85");
	while (CMND_SND_IS_LOADING(bgm))
	{
		suspend();
	}		
	
	local whyte2 = CreateEvLowMdlForNumber("whyte", 201, 108, false, true);
	local grisley2 = CreateEvLowMdlForNumber("\x0082\x00c2\x0082\x00e9\x0082\x00acL", 216, 108, false, false);
	local ascot2 = CreateEvLowMdlForNumber("\x0082\x00a0\x0082\x00a8\x0082\x00e2\x0082\x00dcL", 133, 108, false, false);
	local arion2 = PlayerToTenmaBgn(902);
			
	WaitLoading(whyte2);
	WaitLoading(grisley2);
	WaitLoading(ascot2);
	WaitLoading(arion2);

	SetCharaPosAndMotName(whyte2, [
		0,
		0,
		20,
		180
	], "\x0097\x00a7\x0082\x00bf01");
	SetCharaPosAndMotName(grisley2, [
		10,
		0,
		20,
		210
	], "\x0097\x00a7\x0082\x00bf01");		
	SetCharaPosAndMotName(ascot2, [
		-10,
		0,
		20,
		150
	], "\x0097\x00a7\x0082\x00bf01");
	SetCharaPosAndMotName(arion2, [
		BattleFrontier.BattleFactoryPlayerLocation[0],
		BattleFrontier.BattleFactoryPlayerLocation[1],
		BattleFrontier.BattleFactoryPlayerLocation[2],
		BattleFrontier.BattleFactoryPlayerLocation[3]
	], "\x0097\x00a7\x0082\x00bf01");
	SetCharaPosAndMotName(factoryGuy, [
		0,
		0,
		0,
		0
	], "\x0097\x00a7\x0082\x00bf01");
	
	CMND_SET_ENABLE(whyte2, true);
	CMND_SET_ENABLE(grisley2, true);
	CMND_SET_ENABLE(ascot2, true);
	CMND_SET_ENABLE(arion2, true);
	
	StartBrightFade(SCREEN_AB, 0.0, 60);
	CMND_SND_PLAY(bgm);
	
	CreateSpeech("ev500"); // Arion talk
	CreateSpeech("ev510"); // Wolfe Whyte talk
	CreateSpeech("ev520"); // Grisley talk
	CreateSpeech("ev530"); // Arthur talk
	
	CreateTeam2(players, "legend");

	CMND_SET_SOCCER_POSITION_ALL([
		1,
		2,
		3,
		4,
		5,
		6,
		7,
		8,
		9,
		10,
		11,
		12,
		13,
		14,
		15,
		16
	]);	

	StartBrightFade(SCREEN_AB, -1.0, EV_FADE_SLOW);
	local off_bit = CMND_GET_DRAW_OFF_BIT();
	CMND_SET_DRAW_OFF_BIT(off_bit | OFF_RPG);
	local hImg1 = CMND_LOAD_IMAGE("\x0089\x00f1\x0091z\x0097p1", "data/img/bbg01.xi");
	WaitLoading(hImg1);
	CMND_SET_ENABLE(hImg1, true);
	StartBrightFade(SCREEN_A, 0.0, EV_FADE_SLOW);
	CreateSpeech("finalBattle");
	StartBrightFade(SCREEN_A, -1.0, EV_FADE_SLOW);
	CMND_SET_ENABLE(hImg1, false);
	CMND_MAKE_CHILD_MENU_SCENE("OrganizeMenu");
	suspend();

	while (CMND_IS_RUN_CHILD_SCENE())
	{
		suspend();
	}
	
	CMND_MAKE_CHILD_MENU_SCENE("FormationMenu");
	suspend();

	while (CMND_IS_RUN_CHILD_SCENE())
	{
		suspend();
	}	
				
	CMND_DELETE_IMAGE(hImg1);
	CMND_SET_DRAW_OFF_BIT(off_bit);
	
	// Set the oponent team
	BattleFrontier.BattleFactoryTeam = []
	for (local i = 0; i < players.len(); i++) 
	{
		if (CMND_GET_PARTY_HANDLE(players[i].name))
		{
			local player = CMND_GET_PARTY_HANDLE(players[i].name);
			local soccerPosition = CMND_GET_SOCCER_POSITION(player, false);
			
			if (soccerPosition > 11 || soccerPosition == -1)
			{								
				local newPlayer = players[i];			
				
				local moves = [];
				for (local j = 0; j < 4; j++) {
					local newMove = CMND_GET_SKILL(player, j);
					
					if (newMove != null) 
					{
						moves.append(findHissatsuByCRC32(newMove));
					}
				}
				
				newPlayer.hissatsus = moves;
				
				BattleFrontier.BattleFactoryTeam.append(newPlayer);
				
				RemovePartyCmnd(players[i].name, true, false);
			}
		}	
	}	

	CMND_TEAM_GP_RECV_ALL();
	CMND_TEAM_TP_RECV_ALL();
	
	CMND_SOCCER_BATTLE("mf12b01", "btl7003", {});
	ReserveEvent(70000250);
}