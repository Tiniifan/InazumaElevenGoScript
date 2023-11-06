draw_flag <- 16;
defeat_flag <- 17;
win_flag <- 18;

Event <- function ()
{
	// Turn top screen to black
	StartBrightFade(SCREEN_A, -1.0, 30);
	
	// Init camera
	local hCam = CMND_GET_ACT_CAMERA();
	CamCtrlInit(hCam);
	
	// Prepare the new BGM
	local bgm;

	if (CMND_GET_TEMP_BIT_FLAG(draw_flag, true))
	{
		bgm = CMND_SND_OPEN_BGM("M_18");
	}  else if (CMND_GET_TEMP_BIT_FLAG(defeat_flag, true))
	{
		bgm = CMND_SND_OPEN_BGM("M_36");
	} else if (CMND_GET_TEMP_BIT_FLAG(win_flag, true))
	{
		bgm = CMND_SND_OPEN_BGM("M_94");
	}
	
	while (CMND_SND_IS_LOADING(bgm))
	{
		suspend();
	}	
	
	local factoryGuy = CreateEvLowMdlForCharaNo_NPCOnly("\x0082\x00d4\x0082\x00a9\x0082`L", 1080);
	local whyte = CreateEvLowMdlForNumber("whyte", 201, 108, false, true);
	local grisley = CreateEvLowMdlForNumber("\x0082\x00c2\x0082\x00e9\x0082\x00acL", 216, 108, false, false);
	local ascot = CreateEvLowMdlForNumber("\x0082\x00a0\x0082\x00a8\x0082\x00e2\x0082\x00dcL", 133, 108, false, false);
	local arion = PlayerToTenmaBgn(902);
		
	WaitLoading(factoryGuy);
	WaitLoading(whyte);
	WaitLoading(grisley);
	WaitLoading(ascot);
	WaitLoading(arion);

	SetCharaPosAndMotName(factoryGuy, [
		-10, 
		0, 
		-10, 
		0
	], "\x0097\x00a7\x0082\x00bf01");
	SetCharaPosAndMotName(whyte, [
		0,
		0,
		20,
		180
	], "\x0097\x00a7\x0082\x00bf01");
	SetCharaPosAndMotName(grisley, [
		10,
		0,
		20,
		210
	], "\x0097\x00a7\x0082\x00bf01");		
	SetCharaPosAndMotName(ascot, [
		-10,
		0,
		20,
		150
	], "\x0097\x00a7\x0082\x00bf01");
	SetCharaPosAndMotName(arion, [
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
	
	CMND_SET_ENABLE(factoryGuy, true);
	CMND_SET_ENABLE(whyte, true);
	CMND_SET_ENABLE(grisley, true);
	CMND_SET_ENABLE(ascot, true);
	CMND_SET_ENABLE(arion, true);
	
	SetDrawAndPause(false);	
	
	CMND_SND_PLAY(bgm);
	
	StartBrightFade(SCREEN_AB, 0.0, EV_FADE_SLOW);
	
	if (CMND_GET_TEMP_BIT_FLAG(draw_flag, true))
	{
		CreateSpeech("ev100"); // Factory guy
		CreateSpeech("ev150"); // Whyte
		CreateSpeech("ev200"); // Grisley
		CreateSpeech("ev250"); // Arthur Ascot
		CreateSpeech("ev300"); // Arion
		CreateSpeech("ev350"); // Whyte
		CreateSpeech("ev400"); // Factory guy
		CreateSpeech("ev450"); // Grisley
		
		local whyteTalk = function () : ( whyte)
		{
			WaitFrame(1);
			CreateSpeech("ev500"); // Whyte
		};		
		local factorySurprise = function () : ( factoryGuy, whyte)
		{
			WaitFrame(1);
			CMND_SET_ICON_TO_CHARA(factoryGuy, "\x0083r\x0083b\x0083N\x0083\x008a01");
			QuickTurn(factoryGuy, whyte, true, false);
		};
		local arionSurprise = function () : ( arion, whyte)
		{
			WaitFrame(1);
			CMND_SET_ICON_TO_CHARA(arion, "\x0083r\x0083b\x0083N\x0083\x008a01");
			QuickTurn(arion, whyte, true, false);
		};
		local grisleySurprise = function () : ( grisley, whyte)
		{
			WaitFrame(1);
			CMND_SET_ICON_TO_CHARA(grisley, "\x0083r\x0083b\x0083N\x0083\x008a01");
			QuickTurn(grisley, whyte, true, false);
		};
		local ascotSurprise = function () : ( ascot, whyte)
		{
			WaitFrame(1);
			CMND_SET_ICON_TO_CHARA(ascot, "\x0083r\x0083b\x0083N\x0083\x008a01");
			QuickTurn(ascot, whyte, true, false);
		};		

		InitChildThread(5);
		AddChildThread(whyteTalk);
		AddChildThread(factorySurprise);
		AddChildThread(arionSurprise);
		AddChildThread(grisleySurprise);
		AddChildThread(ascotSurprise);
		RunChildThread();			
		
		CreateSpeech("ev550"); // Ascot
		CreateSpeech("ev600"); // Whyte
		
		local whyteWalk = function () : ( whyte)
		{
			WaitFrame(1);
			CMND_CHR_POS_VAL_TRG(whyte, [
				0,
				0,
				80
			], 999, 0, EV_MINI_CHARA_MOVE_SPEED_WALK);
					
			while (CMND_CHR_POS_VAL_IS_MOVING(whyte))
			{
				suspend();
			}
		};	
		local grisleyWalk = function () : ( grisley)
		{
			WaitFrame(1);
			CMND_CHR_POS_VAL_TRG(grisley, [
				10,
				0,
				80
			], 999, 0, EV_MINI_CHARA_MOVE_SPEED_WALK);
					
			while (CMND_CHR_POS_VAL_IS_MOVING(grisley))
			{
				suspend();
			}			
		};
		local ascotWalk = function () : ( ascot)
		{
			WaitFrame(1);
			CMND_CHR_POS_VAL_TRG(ascot, [
				-10,
				0,
				80
			], 999, 0, EV_MINI_CHARA_MOVE_SPEED_WALK);
					
			while (CMND_CHR_POS_VAL_IS_MOVING(ascot))
			{
				suspend();
			}			
		};

		InitChildThread(3);
		AddChildThread(whyteWalk);
		AddChildThread(grisleyWalk);
		AddChildThread(ascotWalk);
		RunChildThread();

		CMND_DELETE_CHARA(whyte);
		CMND_DELETE_CHARA(grisley);
		CMND_DELETE_CHARA(ascot);
		
		CMND_MESWIN_UNLOCK();
		CMND_SET_GLOBAL_BIT_FLAG(1402, 0);
		CMND_SND_CLOSE(bgm, 30);
		BattleFrontier.Reserve = [];
		BattleFrontier.BattleFactoryWin = 0;
		BattleFrontier.BattleFactoryTeam = [];	
		BattleFrontier.BattleFactoryRun = false;		
		StartBrightFade(SCREEN_AB, -1.0, EV_FADE_SLOW);
		CMND_CHR_WARP_SET(arion, true);
		SetDrawAndPause(true);
		PlayerToTenmaEnd(arion);
		SetExitRpgCamera();
		CamCtrlExit();
			
		local defBgmID = CMND_SND_GET_DEF_BGMID();
		local hMapSnd = CMND_SND_OPEN_BGM(defBgmID);

		while (CMND_SND_IS_LOADING(hMapSnd))
		{
			suspend();
		}

		CMND_SND_PLAY(hMapSnd);	
	} else if (CMND_GET_TEMP_BIT_FLAG(defeat_flag, true))
	{
		CreateSpeech("ev650"); // Whyte
		
		local whyteWalk = function () : ( whyte)
		{
			WaitFrame(1);
			CMND_CHR_POS_VAL_TRG(whyte, [
				0,
				0,
				80
			], 999, 0, EV_MINI_CHARA_MOVE_SPEED_WALK);
					
			while (CMND_CHR_POS_VAL_IS_MOVING(whyte))
			{
				suspend();
			}
		};	
		local grisleyWalk = function () : ( grisley)
		{
			WaitFrame(1);
			CMND_CHR_POS_VAL_TRG(grisley, [
				10,
				0,
				80
			], 999, 0, EV_MINI_CHARA_MOVE_SPEED_WALK);
					
			while (CMND_CHR_POS_VAL_IS_MOVING(grisley))
			{
				suspend();
			}			
		};
		local ascotWalk = function () : ( ascot)
		{
			WaitFrame(1);
			CMND_CHR_POS_VAL_TRG(ascot, [
				-10,
				0,
				80
			], 999, 0, EV_MINI_CHARA_MOVE_SPEED_WALK);
					
			while (CMND_CHR_POS_VAL_IS_MOVING(ascot))
			{
				suspend();
			}			
		};

		InitChildThread(3);
		AddChildThread(whyteWalk);
		AddChildThread(grisleyWalk);
		AddChildThread(ascotWalk);
		RunChildThread();

		CMND_DELETE_CHARA(whyte);
		CMND_DELETE_CHARA(grisley);
		CMND_DELETE_CHARA(ascot);
		
		QuickTurn(arion, factoryGuy, true, true);
		CMND_SET_MOTION(factoryGuy, "\x0097\x00a7\x0082\x00bf01\x0089\x00ef\x0098b01");
		CreateSpeech("ev700"); // Factory
		
		CMND_MESWIN_UNLOCK();
		CMND_SET_GLOBAL_BIT_FLAG(1402, 0);
		CMND_SND_CLOSE(bgm, 30);
		BattleFrontier.Reserve = [];
		BattleFrontier.BattleFactoryWin = 0;
		BattleFrontier.BattleFactoryTeam = [];	
		BattleFrontier.BattleFactoryRun = false;			
		StartBrightFade(SCREEN_AB, -1.0, EV_FADE_SLOW);
		CMND_CHR_WARP_SET(arion, true);
		SetDrawAndPause(true);
		PlayerToTenmaEnd(arion);
		SetExitRpgCamera();
		CamCtrlExit();
			
		local defBgmID = CMND_SND_GET_DEF_BGMID();
		local hMapSnd = CMND_SND_OPEN_BGM(defBgmID);

		while (CMND_SND_IS_LOADING(hMapSnd))
		{
			suspend();
		}

		CMND_SND_PLAY(hMapSnd);	
	} else if (CMND_GET_TEMP_BIT_FLAG(win_flag, true))
	{
		local victorStandEvent = CreateEvHiMdlForNumber("victorStandEvent", 10, 902);
		local arionStandEvent = CreateEvHiMdlForNumber("\x0082\x00c4\x0082\x00f1\x0082\x00dcH", 8, 902);
		local whyteStandEvent = CreateEvHiMdlForNumber("\x0082\x00b5\x0082\x00eb\x0082\x00b3\x0082\x00abH", 201, 108, false, true);
		local factoryGuyStandEvent = CreateEvHiMdlForCharaNo_NPCOnly("\x0082\x00ad\x0082\x00c7\x0082\x00a4H", 1080);
		local grisleyStandEvent = CreateEvHiMdlForNumber("grisleyStandEvent", 216, 108, false, false);
		local ascotStandEvent = CreateEvHiMdlForNumber("ascotStandEvent", 133, 108, false, false);
		
		WaitLoading(victorStandEvent);
		WaitLoading(arionStandEvent);
		WaitLoading(whyteStandEvent);	
		WaitLoading(factoryGuyStandEvent);
		WaitLoading(grisleyStandEvent);
		WaitLoading(ascotStandEvent);

		SetDrawAndPause(false);
		StartBrightFade(SCREEN_AB, 0.0, 60);
		CMND_RESET_TALK_CHARA();
		StartStandEvent();
		SetHiMdlPosAndMotID(factoryGuyStandEvent, EV_CHARA_POS_LEFT, [
			41,
			2,
			1
		], "cn1080");
		SetHiMdlPosAndMotID(whyteStandEvent, EV_CHARA_POS_RIGHT, [
			71,
			3,
			1
		], "cp0201");
		SetHiMdlPosAndMotID(arionStandEvent, EV_CHARA_POS_LEFT, [
			11,
			2,
			1
		], "cp0008");		
		SetHiMdlPosAndMotID(grisleyStandEvent, EV_CHARA_POS_LEFT, [
			33,
			3,
			1
		], "cp0216");
		SetHiMdlPosAndMotID(ascotStandEvent, EV_CHARA_POS_LEFT, [
			11,
			7,
			1
		], "cp0133");
		SetHiMdlPosAndMotID(victorStandEvent, EV_CHARA_POS_LEFT, [
			11,
			7,
			1
		], "cp0010");

		StandEventCharaFadeWait([factoryGuyStandEvent, whyteStandEvent], 1.0);
		CMND_MESWIN_LOCK();
		CreateSpeech("ev750"); // Factory Talk
		CreateSpeech("ev800", 0, true);  // Whyte Talk	
		CreateSpeech("ev850"); // Factory Talk
		CreateSpeech("ev900", 0, true);  // Whyte Talk
		StandEventCharaFadeWait(factoryGuyStandEvent, 0.0);
		StandEventCharaFadeWait(arionStandEvent, 1.0);
		CreateSpeech("ev950"); // Arion Talk

		// Flash back
		StartBrightFade(SCREEN_AB, -1.0, EV_FADE_SLOW);
		local off_bit = CMND_GET_DRAW_OFF_BIT();
		CMND_SET_DRAW_OFF_BIT(off_bit | OFF_RPG);
		local hImg1 = CMND_LOAD_IMAGE("\x0089\x00f1\x0091z\x0097p1", "data/img/bbg01.xi");
		WaitLoading(hImg1);
		CMND_SET_ENABLE(hImg1, true);
		StartBrightFade(SCREEN_A, 0.0, EV_FADE_SLOW);
		CreateSpeech("flashback");
		CMND_DELETE_IMAGE(hImg1);
		CMND_SET_DRAW_OFF_BIT(off_bit);

		CreateSpeech("ev1000", 0, true);  // Whyte Talk
		StandEventCharaFadeWait(arionStandEvent, 0.0);
		StandEventCharaFadeWait(victorStandEvent, 1.0);	
		CreateSpeech("ev1050"); // Victor Talk
		SetHiMdlPosAndMotID(whyteStandEvent, EV_CHARA_POS_RIGHT, [
			11,
			5,
			1
		], "cp0201");
		StandEventCharaFadeWait(victorStandEvent, 0.0);
		CreateSpeech("ev1100", 0, true);  // Whyte Talk
		StandEventCharaFadeWait(ascotStandEvent, 1.0);
		CreateSpeech("ev1150"); // Ascot Talk
		StandEventCharaFadeWait(ascotStandEvent, 0.0);
		StandEventCharaFadeWait(grisleyStandEvent, 1.0);
		CreateSpeech("ev1200"); // Grisley Talk
		StandEventCharaFadeWait(grisleyStandEvent, 0.0);
		CreateSpeech("ev1250", 0, true);  // Whyte Talk
		StandEventCharaFadeWait(arionStandEvent, 1.0);
		CreateSpeech("ev1300"); // Arion Talk
		CMND_MESWIN_UNLOCK();
		EndStandEvent();
		
		StartBrightFade(SCREEN_AB, -1.0, 30);
		
		CMND_DELETE_CHARA(factoryGuyStandEvent);
		CMND_DELETE_CHARA(arionStandEvent);
		CMND_DELETE_CHARA(victorStandEvent);
		CMND_DELETE_CHARA(grisleyStandEvent);
		CMND_DELETE_CHARA(ascotStandEvent);
		CMND_DELETE_CHARA(whyteStandEvent);
		CMND_DELETE_CHARA(whyte);
		CMND_DELETE_CHARA(grisley);
		CMND_DELETE_CHARA(ascot);
		
		StartBrightFade(SCREEN_AB, 0.0, EV_FADE_SLOW);
		
		QuickTurn(arion, factoryGuy, true, true);
		CMND_SET_MOTION(factoryGuy, "\x0097\x00a7\x0082\x00bf01\x0089\x00ef\x0098b01");
		CreateSpeech("ev1350"); // Factory
		
		CMND_MESWIN_UNLOCK();
		CMND_SET_GLOBAL_BIT_FLAG(1402, 0);
		CMND_SND_CLOSE(bgm, 30);
		BattleFrontier.Reserve = [];
		BattleFrontier.BattleFactoryWin = 0;
		BattleFrontier.BattleFactoryTeam = [];	
		BattleFrontier.BattleFactoryRun = false;	
		StartBrightFade(SCREEN_AB, -1.0, EV_FADE_SLOW);
		CMND_CHR_WARP_SET(arion, true);
		SetDrawAndPause(true);
		PlayerToTenmaEnd(arion);
		SetExitRpgCamera();
		CamCtrlExit();
			
		local defBgmID = CMND_SND_GET_DEF_BGMID();
		local hMapSnd = CMND_SND_OPEN_BGM(defBgmID);

		while (CMND_SND_IS_LOADING(hMapSnd))
		{
			suspend();
		}

		CMND_SND_PLAY(hMapSnd);			
	}
}