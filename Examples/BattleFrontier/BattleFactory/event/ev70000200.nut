Event <- function ()
{	
	local isEvUpperDisp = 1;
	local scEvHdl = [
		0,
		0,
		0
	];
	StartScEvent(isEvUpperDisp, scEvHdl);
	local hCam = CMND_GET_ACT_CAMERA();
	CamCtrlInit(hCam);
	CamCtrlSetPosRef(hCam, [
		259.70001,
		129.7,
		117.0,
		152.10001,
		92.0,
		54.400002
	]);
	local whyteStandEvent = CreateEvHiMdlForMatch("whyte", isEvUpperDisp, "para_cp0201");
	local grisleyStandEvent = CreateEvHiMdlForMatch("grisley", isEvUpperDisp, "para_cp0216");
	local ascotStandEvent = CreateEvHiMdlForMatch("ascot", isEvUpperDisp, "para_cp0133");
	local mistralStandEvent = CreateEvHiMdlForMatch("mistral", isEvUpperDisp, "para_cp1272");
	local sweepStandEevent = CreateEvHiMdlForMatch("sweep", isEvUpperDisp, "para_cp1516");
	
	SetHiMdlPosAndMotID(whyteStandEvent, EV_CHARA_POS_LEFT, [
		61,
		6,
		1
	], "cp0201");
	SetHiMdlPosAndMotID(grisleyStandEvent, EV_CHARA_POS_RIGHT, [
		71,
		5,
		3
	], "cp0216");
	SetHiMdlPosAndMotID(ascotStandEvent, EV_CHARA_POS_LEFT, [
		71,
		5,
		3
	], "cp0133");
	SetHiMdlPosAndMotID(mistralStandEvent, EV_CHARA_POS_RIGHT, [
		71,
		5,
		3
	], "cp1272");
	SetHiMdlPosAndMotID(sweepStandEevent, EV_CHARA_POS_RIGHT, [
		71,
		5,
		3
	], "cp1516");
	
	StandEventCharaFadeWait([whyteStandEvent], 1.0);
	StartBrightFade(SCREEN_A, 0.0, 30);
	StartStandEvent();
	CMND_MESWIN_LOCK();
	CreateSpeech("ev100");
	StandEventCharaFadeWait([ascotStandEvent], 1.0);
	StandEventCharaFadeWait([whyteStandEvent], 0.0);
	CreateSpeech("ev150");
	StandEventCharaFadeWait([mistralStandEvent], 1.0);
	CreateSpeech("ev200", 0, true);
	StandEventCharaFadeWait([sweepStandEevent], 1.0);
	StandEventCharaFadeWait([mistralStandEvent], 0.0);
	CreateSpeech("ev250", 0, true);
	StandEventCharaFadeWait([grisleyStandEvent], 1.0);
	StandEventCharaFadeWait([ascotStandEvent], 0.0);
	StandEventCharaFadeWait([sweepStandEevent], 0.0);
	CreateSpeech("ev300", 0, true);	
	StartBrightFade(SCREEN_A, -1.0, EV_FADE_SLOW);
	CMND_DELETE_CHARA(whyteStandEvent);
	CMND_DELETE_CHARA(ascotStandEvent);
	CMND_DELETE_CHARA(mistralStandEvent);
	CMND_DELETE_CHARA(sweepStandEevent);
	CMND_DELETE_CHARA(grisleyStandEvent);
	CMND_MESWIN_UNLOCK();
	EndStandEvent();
	local tacs_id_1 = "para_cp0133";
	local tacs_id_2 = "para_cp1272";
	local tacs_id_3 = "para_cp0216";
	local tacs_id_5 = "para_cp1516";
	local tacs_id_4 = CMND_GET_PARAM_ID_RANDOM(1, false, tacs_id_1, tacs_id_2, tacs_id_3, tacs_id_5);
	local tacs_id_6 = CMND_GET_PARAM_ID_RANDOM(1, false, tacs_id_1, tacs_id_2, tacs_id_3, tacs_id_4, tacs_id_5);
	local tacs1 = CreateEvLowMdlForMatchNoBustup("tacs1L", isEvUpperDisp, tacs_id_1, 1);
	local tacs2 = CreateEvLowMdlForMatchNoBustup("tacs2L", isEvUpperDisp, tacs_id_2, 1);
	local tacs3 = CreateEvLowMdlForMatchNoBustup("tacs3L", isEvUpperDisp, tacs_id_3, 1);
	local tacs4 = CreateEvLowMdlForMatchNoBustup("tacs4L", isEvUpperDisp, tacs_id_4, 1);
	local tacs5 = CreateEvLowMdlForMatchNoBustup("tacs5L", isEvUpperDisp, tacs_id_5, 1);
	local tacs6 = CreateEvLowMdlForMatchNoBustup("tacs6L", isEvUpperDisp, tacs_id_6, 1);
	local hAtk = [
		tacs1,
		tacs2,
		tacs5,
		tacs4,
		tacs3,
		tacs6
	];
	local hDef = [
		0
	];
	RunTactics("wht0006", hAtk, hDef);
	suspend();
	CMND_DELETE_CHARA(tacs1);
	CMND_DELETE_CHARA(tacs2);
	CMND_DELETE_CHARA(tacs3);
	CMND_DELETE_CHARA(tacs4);
	CMND_DELETE_CHARA(tacs5);
	CMND_DELETE_CHARA(tacs6);
	CamCtrlExit();
	EndScEvent(isEvUpperDisp, scEvHdl);	
}