Event <- function ()
{
	SetDrawAndPause(false);
	local hCam = CMND_GET_ACT_CAMERA();
	CamCtrlInit(hCam);
	CamCtrlSetPosRef(hCam, [
		53.299999,
		38.900002,
		-10.4,
		-26.200001,
		4.0999999,
		-61.599998
	]);
	
	CMND_RESET_TALK_CHARA();
	
	local alexZabel = CreateEvLowMdlForCharaNo_NPCOnlyNoBustup("\x0082\x00a2\x0082\x00b5\x0082\x00c7L", 17);
	local whyte = CreateEvLowMdlForNumber("\x0083g\x0083L\x0083IL", 201, 10, true, true);	
	CMND_LOAD_MOTION(whyte, "data/chr/motion/rpg/mot_uz_event01.xc");
	
	WaitLoading(alexZabel);
	WaitLoading(whyte);
	
	SetCharaPosAndMotName(alexZabel, [
		0,
		12.0,
		-195.10001,
		0
	], "\x008d\x00c0\x0082\x00e904");
	SetCharaPosAndMotName(whyte, [
		-0.5,
		0.2,
		-130.0,
		180
	], "\x0095G\x0097\x00a7\x0082\x00bf01");
	
	local alexZabelStandEvent = CreateEvHiMdlForCharaNo_NPCOnly("\x0082\x00a2\x0082\x00b5\x0082\x00c7H", 17);
	local whyteStandEvent = CreateEvHiMdlForNumber("\x0082\x00b5\x0082\x00eb\x0082\x00b3\x0082\x00abH", 201, 10, true, true);
	
	WaitLoading(alexZabelStandEvent);
	WaitLoading(whyteStandEvent);
	
	SetHiMdlPosAndMotID(alexZabelStandEvent, EV_CHARA_POS_RIGHT, [
		91,
		1,
		1
	], "cn0017");
	SetHiMdlPosAndMotID(whyteStandEvent, EV_CHARA_POS_LEFT, [
		11,
		4,
		4
	], "cp0201");
	
	StartBrightFade(SCREEN_A, 0.0, 60);
	
	CMND_SET_ENABLE(alexZabel, true);
	CMND_SET_ENABLE(whyte, true);
	
	CamCtrlMoveTo(hCam, 300, [
		79.800003,
		44.799999,
		-101.0,
		0.2,
		10.0,
		-152.2
	], 3);
	
	while (IsCamCtrlMove())
	{
		suspend();
	}
		
	WaitFrame(10);
	StartStandEvent();
	StandEventCharaFadeWait([
		alexZabelStandEvent,
		whyteStandEvent
	], 1.0, 10);
	CMND_MESWIN_LOCK();
	CreateSpeech("ev100", 0, true); // Alex Zabel talk
	CreateSpeech("ev150"); // Wolfe Whyte talk
	CMND_MESWIN_UNLOCK();
	StandEventCharaFadeWait([
		alexZabelStandEvent,
		whyteStandEvent
	], 0.0, 10);
	EndStandEvent();
	
	local whyteWalk = function () : ( whyte )
	{
		WaitFrame(1);
		CMND_SET_MOTION(whyte, "\x0097\x00a7\x0082\x00bf01", 0, 60);
		CMND_CHR_TURN_AUTO_TRG(whyte, 0, 360, 1);
		
		CMND_CHR_POS_VAL_TRG(whyte, [
			0,
			0,
			-80
		], 999, 0, EV_MINI_CHARA_MOVE_SPEED_WALK);
						
		while (CMND_CHR_POS_VAL_IS_MOVING(whyte))
		{
			suspend();
		}
	};
	local whyteTalk = function () : ()
	{
		WaitFrame(1);
		CreateSpeech("ev200"); // Wolfe Whyte talk
	};
	
	InitChildThread(2);
	AddChildThread(whyteWalk);
	AddChildThread(whyteTalk);
	RunChildThread();	
	
	StartBrightFade(SCREEN_AB, -1.0, 60);
	SetExitRpgCamera();
	CamCtrlExit();
	CMND_DELETE_CHARA(alexZabel);
	CMND_DELETE_CHARA(whyte);
	CMND_DELETE_CHARA(alexZabelStandEvent);
	CMND_DELETE_CHARA(whyteStandEvent);
	SetDrawAndPause(true);
	CMND_SET_GLOBAL_BIT_FLAG(23);
	CMND_MAP_BGM_OFF();
	ReserveMapJump("mr20b04", [
		-230,
		0.0,
		-10,
		0
	], true);
}