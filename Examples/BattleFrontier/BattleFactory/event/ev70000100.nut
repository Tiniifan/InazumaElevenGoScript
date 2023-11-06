Event <- function ()
{	
	// Turn top screen to black
	StartBrightFade(SCREEN_A, -1.0, 30);

	// Stop to play currently BGM
	local hMapSnd = CMND_SND_GET_BGM_SNDID();
	CMND_SND_STOP(hMapSnd, 30);

	// Prepare the new BGM
	local bgm = CMND_SND_OPEN_BGM("M_20");
	while (CMND_SND_IS_LOADING(bgm))
	{
		suspend();
	}

	// Init camera
	local hCam = CMND_GET_ACT_CAMERA();
	CamCtrlInit(hCam);
	
	// Get firstPlayer
	local firstPlayer = CMND_GET_CHARA_HANDLE(GET_HANDLE_TYPE_CTRL_PC);	
	
	// Hide firstPlayer
	CMND_SET_ENABLE(firstPlayer, false);
	
	local whyte = CreateEvLowMdlForNumber("\x0083g\x0083L\x0083IL", 201, 10, true, true);
	local factoryGuy = CreateEvLowMdlForCharaNo_NPCOnly("factoryGuy", 1080);
	
	WaitLoading(whyte);
	WaitLoading(factoryGuy);
	
	SetCharaPosAndMotName(whyte, [
		-230,
		0,
		-10,
		90
	], "\x0097\x00a7\x0082\x00bf01");
	
	SetCharaPosAndMotName(factoryGuy, [
		-280,
		0,
		-10,
		90
	], "\x0097\x00a7\x0082\x00bf01");	
	
	CMND_SET_ENABLE(whyte, true);
	
	SetDrawAndPause(false);	

	CMND_SND_PLAY(bgm);
	
	StartBrightFade(SCREEN_AB, 0.0, EV_FADE_SLOW);
		
	local whyteWalk = function () : ( whyte )
	{
		WaitFrame(1);
		CMND_CHR_POS_VAL_TRG(whyte, [
			-120,
			0,
			-10
		], 999, 0, EV_MINI_CHARA_MOVE_SPEED_WALK);
						
		while (CMND_CHR_POS_VAL_IS_MOVING(whyte))
		{
			suspend();
		}
	};
	local cameraMove = function () : ( hCam )
	{
		WaitFrame(1);
		CamCtrlMoveTo(hCam, 100, [
			-150,
			80,
			93,
			-150,
			2,
			-10
		]);
	};
	
	InitChildThread(2);
	AddChildThread(whyteWalk);
	AddChildThread(cameraMove);
	RunChildThread();	
	
	local factoryTalk = function () : ( factoryGuy )
	{
		WaitFrame(1);
		CreateSpeech("ev100"); // factory guy talk
	};
	local whyteTurn = function () : ( whyte, factoryGuy )
	{
		WaitFrame(1);
		CMND_SET_ICON_TO_CHARA(whyte, "\x0083r\x0083b\x0083N\x0083\x008a01");
		QuickTurn(whyte, factoryGuy, true, true);
		CMND_SET_ENABLE(factoryGuy, true);
	};
	
	InitChildThread(2);
	AddChildThread(factoryTalk);
	AddChildThread(whyteTurn);
	RunChildThread();	
	
	CMND_CHR_POS_VAL_TRG(factoryGuy, [
		-150,
		0,
		-10
	], 999, 0, EV_MINI_CHARA_MOVE_SPEED_RUN);
					
	while (CMND_CHR_POS_VAL_IS_MOVING(factoryGuy))
	{
		suspend();
	}
	
	local factorySaluate = function () : ( factoryGuy )
	{
		WaitFrame(1);
		CMND_SET_MOTION(factoryGuy, "\x0097\x00a7\x0082\x00bf01\x0089\x00ef\x0098b01");
	};
	local whyteSaluate = function () : ( whyte )
	{
		WaitFrame(1);
		CMND_SET_MOTION(whyte, "\x0097\x00a7\x0082\x00bf01\x0089\x00ef\x0098b01");
	};	
	
	InitChildThread(2);
	AddChildThread(factorySaluate);
	AddChildThread(whyteSaluate);
	RunChildThread();
	
	CreateSpeech("ev150"); // whyte guy talk
	CreateSpeech("ev200"); // factory guy talk
	CreateSpeech("ev250"); // whyte guy talk
	CreateSpeech("ev300"); // factory guy talk
	CreateSpeech("ev350"); // whyte guy talk
	
	local factoryWalk = function () : ( factoryGuy )
	{
		WaitFrame(1);
		CMND_CHR_TURN_AUTO_TRG(factoryGuy, 0, 360, 1);
		
		CMND_CHR_POS_VAL_TRG(factoryGuy, [
			-230,
			0,
			-10
		], 999, 0, EV_MINI_CHARA_MOVE_SPEED_WALK);
						
		while (CMND_CHR_POS_VAL_IS_MOVING(factoryGuy))
		{
			suspend();
		}
	};
	local whyteWalk = function () : ( whyte )
	{
		WaitFrame(1);
		CMND_CHR_TURN_AUTO_TRG(whyte, 0, 360, 1);
		
		CMND_CHR_POS_VAL_TRG(whyte, [
			-230,
			0,
			-10
		], 999, 0, EV_MINI_CHARA_MOVE_SPEED_WALK);
						
		while (CMND_CHR_POS_VAL_IS_MOVING(whyte))
		{
			suspend();
		}
	};
	
	InitChildThread(2);
	AddChildThread(factoryWalk);
	AddChildThread(whyteWalk);
	RunChildThread();

	// Turn top screen to black
	StartBrightFade(SCREEN_A, -1.0, 30);	
	CMND_SET_TEMP_BIT_FLAG(16, true);

	ReserveMapJump("mr12b01", [
		0,
		0,
		0,
		0
	], true);	
}