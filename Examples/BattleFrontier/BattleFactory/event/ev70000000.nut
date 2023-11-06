easy_flag <- 12;
hard_flag <- 13;
legend_flag <- 14;
win_flag <- 15;

StartBattle <- function()
{
	CMND_TEAM_GP_RECV_ALL();
	CMND_TEAM_TP_RECV_ALL();
	
	CMND_MESSAGE_REPLACE_VAL(1, BattleFrontier.BattleFactoryWin+1);
	CreateSpeech("nextRound");	
	
	if (BattleFrontier.BattleFactoryWin < 15) {
		if (!CMND_GET_TEMP_BIT_FLAG(easy_flag)) {
			CMND_SET_TEMP_BIT_FLAG(easy_flag, true);
			CMND_SET_TEMP_BIT_FLAG(hard_flag, false);
			CMND_SET_TEMP_BIT_FLAG(legend_flag, false);
		}
		
		EncountEffect();
		CMND_SOCCER_BATTLE("mf12b01", "btl7000", true);
		CamCtrlExit();
	} else if (BattleFrontier.BattleFactoryWin < 30) {
		if (!CMND_GET_TEMP_BIT_FLAG(hard_flag)) {
			CMND_SET_TEMP_BIT_FLAG(hard_flag, true);
			CMND_SET_TEMP_BIT_FLAG(easy_flag, false);
			CMND_SET_TEMP_BIT_FLAG(legend_flag, false);
		}
		
		EncountEffect();
		CMND_SOCCER_BATTLE("mf12b01", "btl7001", true);
		CamCtrlExit();
	} else if (BattleFrontier.BattleFactoryWin < 49) {
		if (!CMND_GET_TEMP_BIT_FLAG(legend_flag)) {
			CMND_SET_TEMP_BIT_FLAG(legend_flag, true);
			CMND_SET_TEMP_BIT_FLAG(easy_flag, false);
			CMND_SET_TEMP_BIT_FLAG(hard_flag, false);
		}
		
		EncountEffect();
		CMND_SOCCER_BATTLE("mf12b01", "btl7002", true);
		CamCtrlExit();
	}
}

firstPlayer <- 0;
arion <- 0;
factoryGuy <- 0;
bgm <- 0;

SetEvent <- function (hideQuickTurn, enableScreenAtEnd, newBgm)
{
	// Turn top screen to black
	StartBrightFade(SCREEN_A, -1.0, 30);
	
	// Save the first player's location
	firstPlayer = CMND_GET_CHARA_HANDLE(GET_HANDLE_TYPE_CTRL_PC);	
	local firstPlayerLocation = [
		0,
		0,
		0,
		0
	];
	CMND_GET_POSRY(firstPlayer, firstPlayerLocation);

	// Stop to play currently BGM
	local hMapSnd = CMND_SND_GET_BGM_SNDID();
	CMND_SND_STOP(hMapSnd, 30);

	// Prepare the new BGM
	bgm = CMND_SND_OPEN_BGM(newBgm);
	while (CMND_SND_IS_LOADING(bgm))
	{
		suspend();
	}
	
	while (CMND_SND_IS_LOADING(bgm))
	{
		suspend();
	}

	// Init camera
	local hCam = CMND_GET_ACT_CAMERA();
	CamCtrlInit(hCam);

	// Create npc tenma and npc factory guy
	arion = PlayerToTenmaBgn(902);
	factoryGuy = CreateEvLowMdlForCharaNo_NPCOnly("\x0082\x00d4\x0082\x00a9\x0082`L", 1080);
	
	// Init position
	SetCharaPosAndMotName(arion, firstPlayerLocation, "\x0097\x00a7\x0082\x00bf01");
	SetCharaPosAndMotName(factoryGuy, [0, 0, 0, 0], "\x0097\x00a7\x0082\x00bf01");
	
	// Wait
	WaitLoading(arion);
	WaitLoading(factoryGuy);
	
	// Enable tenma, factory npc and remove first player
	CMND_SET_ENABLE(arion, true);
	CMND_SET_ENABLE(factoryGuy, true);
	CMND_SET_ENABLE(firstPlayer, false);
	
	SetDrawAndPause(false);
	
	CMND_SND_PLAY(bgm);
	
	if (hideQuickTurn) 
	{
		QuickTurn(arion, factoryGuy, true, true);
		CMND_SET_MOTION(factoryGuy, "\x0097\x00a7\x0082\x00bf01\x0089\x00ef\x0098b01");
		
		if (enableScreenAtEnd) 
		{
			StartBrightFade(SCREEN_AB, 0.0, EV_FADE_SLOW);
		}
	} else {
		StartBrightFade(SCREEN_AB, 0.0, EV_FADE_SLOW);
		QuickTurn(arion, factoryGuy, true, true);
		CMND_SET_MOTION(factoryGuy, "\x0097\x00a7\x0082\x00bf01\x0089\x00ef\x0098b01");	
	}
}

Event <- function ()
{
	if (BattleFrontier.BattleFactoryWin == 0 && BattleFrontier.BattleFactoryRun == false) 
	{
		SetEvent(false, false, "M_38");
		
		local participateQuestion;
		
		if (!CMND_GET_GLOBAL_BIT_FLAG(2003)) 
		{
			local victorStandEvent = CreateEvHiMdlForNumber("victorStandEvent", 10, 902);
			local arionStandEvent = CreateEvHiMdlForNumber("\x0082\x00c4\x0082\x00f1\x0082\x00dcH", 8, 902);
			local factoryGuyStandEvent = CreateEvHiMdlForCharaNo_NPCOnly("\x0082\x00ad\x0082\x00c7\x0082\x00a4H", 1080);
			
			WaitLoading(victorStandEvent);
			WaitLoading(arionStandEvent);
			WaitLoading(factoryGuyStandEvent);

			SetDrawAndPause(false);
			StartBrightFade(SCREEN_AB, 0.0, 60);
			CMND_RESET_TALK_CHARA();
			StartStandEvent();
			SetHiMdlPosAndMotID(factoryGuyStandEvent, EV_CHARA_POS_LEFT, [
				41,
				2,
				1
			], "cn1080");
			SetHiMdlPosAndMotID(arionStandEvent, EV_CHARA_POS_RIGHT, [
				11,
				5,
				1
			], "cp0008");
			CMND_MESWIN_LOCK();
			StandEventCharaFadeWait(factoryGuyStandEvent, 1.0);
			CreateSpeech("ev10"); // Factory Talk
			StandEventCharaFadeWait(arionStandEvent, 1.0);
			CreateSpeech("ev20", 0, true);  // Arion Talk
			SetHiMdlPosAndMotID(arionStandEvent, EV_CHARA_POS_LEFT, [
				11,
				1,
				1
			], "cp0008");		
			SetHiMdlPosAndMotID(victorStandEvent, EV_CHARA_POS_RIGHT, [
				91,
				4,
				1
			], "cp0010");			
			StandEventCharaFadeWait([factoryGuyStandEvent, arionStandEvent], 0.0);
			StandEventCharaFadeWait([arionStandEvent, victorStandEvent], 1.0);
			CreateSpeech("ev30", 0, true) // Victor Talk
			StandEventCharaFadeWait([arionStandEvent, victorStandEvent], 0.0);
			StandEventCharaFadeWait([factoryGuyStandEvent, victorStandEvent], 1.0);
			SetHiMdlPosAndMotID(factoryGuyStandEvent, EV_CHARA_POS_LEFT, [
				41,
				2,
				1
			], "cn1080");
			CreateSpeech("ev40"); // Factory Talk
			SetHiMdlPosAndMotID(arionStandEvent, EV_CHARA_POS_RIGHT, [
				11,
				5,
				1
			], "cp0008");
			StandEventCharaFadeWait(victorStandEvent, 0.0);
			StandEventCharaFadeWait(arionStandEvent, 1.0);
			CreateSpeech("ev50", 0, true); // Arion Talk
			CreateSpeech("ev60"); // Factory Talk
			SetHiMdlPosAndMotID(arionStandEvent, EV_CHARA_POS_LEFT, [
				11,
				1,
				1
			], "cp0008");		
			SetHiMdlPosAndMotID(victorStandEvent, EV_CHARA_POS_RIGHT, [
				91,
				4,
				1
			], "cp0010");			
			StandEventCharaFadeWait([factoryGuyStandEvent, arionStandEvent], 0.0);
			StandEventCharaFadeWait([arionStandEvent, victorStandEvent], 1.0);
			CreateSpeech("ev70", 0, true); // Victor Talk
			CreateSpeech("ev80"); // Arion Talk
			
			participateQuestion = CMND_MESWIN_GET_SEL();
			
			CMND_MESWIN_UNLOCK();
			EndStandEvent();
		
			CMND_DELETE_CHARA(factoryGuyStandEvent);
			CMND_DELETE_CHARA(arionStandEvent);
			CMND_DELETE_CHARA(victorStandEvent);;
		} else {
			CreateSpeech("ev100");
			participateQuestion = CMND_MESWIN_GET_SEL();
		}
			
		if (participateQuestion != 0)
		{
			CreateSpeech("challengeRefused");
			CMND_MESWIN_UNLOCK();
			CMND_SET_GLOBAL_BIT_FLAG(1402, 0);
			CMND_SND_CLOSE(bgm, 30);
			StartBrightFade(SCREEN_AB, -1.0, EV_FADE_SLOW);
			CMND_SET_ENABLE(firstPlayer, true);
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
			return;
		}
		else
		{
			if (!CMND_GET_GLOBAL_BIT_FLAG(2003)) 
			{
				CMND_SET_GLOBAL_BIT_FLAG(2003, true);
			}
			
			CreateSpeech("challengeAccepted");
			
			SaveReserve();
			
			local userTeam = CreateTeam(players, "easy", 2);
			foreach(player in userTeam) {
				local newPlayer = CMND_ADD_PARTY(player.name);
				CMND_SET_LV(newPlayer, 99);
				
				for (local i = 0; i < player.hissatsus.len(); i++) {
					CMND_SET_SKILL(newPlayer, player.hissatsus[i].crc32, i);
				}
			}
			
			StartBrightFade(SCREEN_AB, -1.0, EV_FADE_SLOW);
			local off_bit = CMND_GET_DRAW_OFF_BIT();
			CMND_SET_DRAW_OFF_BIT(off_bit | OFF_RPG);
			local hImg1 = CMND_LOAD_IMAGE("\x0089\x00f1\x0091z\x0097p1", "data/img/bbg01.xi");
			WaitLoading(hImg1);
			CMND_SET_ENABLE(hImg1, true);
			StartBrightFade(SCREEN_A, 0.0, EV_FADE_SLOW);
			CreateSpeech("explainRules");
			StartBrightFade(SCREEN_A, -1.0, EV_FADE_SLOW);
			CMND_SET_ENABLE(hImg1, false);
			CMND_MAKE_CHILD_MENU_SCENE("OrganizeMenu");
			suspend();

			while (CMND_IS_RUN_CHILD_SCENE())
			{
				suspend();
			}
			
			for (local i = 0; i < 10; i++) {
				local playerHandle = CMND_GET_PARTY_HANDLE(userTeam[i].name);
				local soccerPosition = CMND_GET_SOCCER_POSITION(playerHandle, true);
				
				if (soccerPosition == -1) {
					RemovePartyCmnd(userTeam[i].name, true, false);
				} else {
					BattleFrontier.BattleFactoryTeam.append(userTeam[i].name);
				}				
			}			

			CMND_DELETE_IMAGE(hImg1);
			CMND_SET_DRAW_OFF_BIT(off_bit);
			CMND_SET_ENABLE(firstPlayer, false);
			StartBrightFade(SCREEN_AB, 0.0, EV_FADE_SLOW);
			
			BattleFrontier.BattleFactoryRun = true;

			StartBattle();
			ReserveEvent(70000000);									
		}
		
		CamCtrlExit();	
	} else {
		if (CMND_GET_TEMP_BIT_FLAG(win_flag)) {
			if (BattleFrontier.BattleFactoryWin < 49) {
				SetEvent(true, false, "M_22");
				BattleFrontier.BattleFactoryWin += 1;
				
				StartBrightFade(SCREEN_AB, -1.0, EV_FADE_SLOW);
				local off_bit = CMND_GET_DRAW_OFF_BIT();
				CMND_SET_DRAW_OFF_BIT(off_bit | OFF_RPG);
				local hImg1 = CMND_LOAD_IMAGE("\x0089\x00f1\x0091z\x0097p1", "data/img/bbg01.xi");
				WaitLoading(hImg1);
				CMND_SET_ENABLE(hImg1, true);
				StartBrightFade(SCREEN_A, 0.0, EV_FADE_SLOW);
				CreateSpeech("recruitRules");
				StartBrightFade(SCREEN_A, -1.0, EV_FADE_SLOW);
				CMND_SET_ENABLE(hImg1, false);
				CMND_MAKE_CHILD_MENU_SCENE("OrganizeMenu");
				suspend();

				while (CMND_IS_RUN_CHILD_SCENE())
				{
					suspend();
				}
				
				CMND_DELETE_IMAGE(hImg1);
				CMND_SET_DRAW_OFF_BIT(off_bit);
				StartBrightFade(SCREEN_AB, 0.0, EV_FADE_SLOW);
				
				local oponantTeam = [];
				
				// Determine which character from the opposing team is the first
				local firstOpposingPlayer;
				local firstReservePositionOpposingPlayer = 16;
				foreach (player in players) {
					if (CMND_GET_PARTY_HANDLE(player.name) && indexOfList(BattleFrontier.BattleFactoryTeam, player.name) == -1) {
						oponantTeam.append(player.name);
						
						local hdl = CMND_GET_PARTY_HANDLE(player.name);
						local reservePosition = CMND_GET_RESERVE_POSITION(hdl);
			
						if (reservePosition < firstReservePositionOpposingPlayer) {
							firstReservePositionOpposingPlayer = reservePosition;
							firstOpposingPlayer = player.name;
						}
					}
				}					

				// Determine which character from the player team is the last
				local lastUserPlayer;
				local lastReservePositionUserPlayer = -1;
				foreach (player in BattleFrontier.BattleFactoryTeam) {
					local hdl = CMND_GET_PARTY_HANDLE(player);
					local reservePosition = CMND_GET_RESERVE_POSITION(hdl);
			
					if (reservePosition > lastReservePositionUserPlayer) {
						lastReservePositionUserPlayer = reservePosition;
						lastUserPlayer = player;
					}
				}
				
				
				// An opposing player is on the battle-team
				if (firstReservePositionOpposingPlayer < 5) {
					// Remove last player of the user
					RemovePartyCmnd(lastUserPlayer, true, false);
					removeElementList(BattleFrontier.BattleFactoryTeam, lastUserPlayer);
					BattleFrontier.BattleFactoryTeam.append(firstOpposingPlayer);
					removeElementList(oponantTeam, firstOpposingPlayer);
			
					// Remove last battle player not chosen
					foreach (player in oponantTeam) {
						RemovePartyCmnd(player, true, false);
					}					
				} else {
					// Remove battle player
					foreach (player in oponantTeam) {
						RemovePartyCmnd(player, true, false);
					}					
				}
								
				// Run only if there was a bug with the recruitment system
				if (CMND_GET_PARTY_MEMBER_NUM() > 5) {
					foreach (player in players) 
					{
						if (CMND_GET_PARTY_HANDLE(player.name) && indexOfList(player.name, BattleFrontier.BattleFactoryTeam) == -1) 
						{
							RemovePartyCmnd(player.name, true, false);
						}
					}
				}
				
				StartBrightFade(SCREEN_AB, 0.0, EV_FADE_SLOW);
				CMND_SET_ENABLE(firstPlayer, false);
				WaitFrame(30);
				StartBlackFadeIn(SCREEN_AB, 0.0);				
				WaitFrame(30);
				local hCam = CMND_GET_ACT_CAMERA();
				CamCtrlInit(hCam);
				StartBrightFade(SCREEN_AB, 0.0, EV_FADE_SLOW);			

				StartBattle();
				ReserveEvent(70000000);	
			} else {
				// Boss Event
				
				local whyte = CreateEvLowMdlForNumber("\x0083g\x0083L\x0083IL", 201, 108, false, true);
				local grisley = CreateEvLowMdlForNumber("\x0082\x00c2\x0082\x00e9\x0082\x00acL", 216, 108, false, false);
				local ascot = CreateEvLowMdlForNumber("\x0082\x00a0\x0082\x00a8\x0082\x00e2\x0082\x00dcL", 133, 108, false, false);
				
				WaitLoading(whyte);
				WaitLoading(grisley);
				WaitLoading(ascot);	
				
				SetCharaPosAndMotName(whyte, [
					0,
					0,
					80,
					180
				], "\x0097\x00a7\x0082\x00bf01");
				SetCharaPosAndMotName(grisley, [
					10,
					0,
					80,
					180
				], "\x0097\x00a7\x0082\x00bf01");		
				SetCharaPosAndMotName(ascot, [
					-10,
					0,
					80,
					180
				], "\x0097\x00a7\x0082\x00bf01");				

				local whyteWalk = function () : ( whyte, factoryGuy )
				{
					WaitFrame(1);
					CMND_SET_ENABLE(whyte, true);
					CMND_CHR_POS_VAL_TRG(whyte, [
						0,
						0,
						20
					], 999, 0, EV_MINI_CHARA_MOVE_SPEED_WALK);
					
					while (CMND_CHR_POS_VAL_IS_MOVING(whyte))
					{
						suspend();
					}

					CMND_CHR_TURN_AUTO_TRG(whyte, 0, 180, 1);
				};	

				local grisleyWalk = function () : ( grisley, factoryGuy )
				{
					WaitFrame(1);
					CMND_SET_ENABLE(grisley, true);
					CMND_CHR_POS_VAL_TRG(grisley, [
						10,
						0,
						20
					], 999, 0, EV_MINI_CHARA_MOVE_SPEED_WALK);
					
					while (CMND_CHR_POS_VAL_IS_MOVING(grisley))
					{
						suspend();
					}
					
					CMND_CHR_TURN_AUTO_TRG(grisley, 0, 210, 1);
				};	

				local ascotWalk = function () : ( ascot, factoryGuy )
				{
					WaitFrame(1);
					CMND_SET_ENABLE(ascot, true);
					CMND_CHR_POS_VAL_TRG(ascot, [
						-10,
						0,
						20
					], 999, 0, EV_MINI_CHARA_MOVE_SPEED_WALK);
					
					while (CMND_CHR_POS_VAL_IS_MOVING(ascot))
					{
						suspend();
					}
					
					CMND_CHR_TURN_AUTO_TRG(ascot, 0, 150, 1);
				};					
				
				SetEvent(true, true, "M_42");
				CreateSpeech("newChallenger");
				
				bgm = CMND_SND_OPEN_BGM("M_85");
				while (CMND_SND_IS_LOADING(bgm))
				{
					suspend();
				}
				
				while (CMND_SND_IS_LOADING(bgm))
				{
					suspend();
				}

				local factoryGuyTurn = function () : ( factoryGuy, whyte )
				{
					WaitFrame(1);
					CMND_SET_ICON_TO_CHARA(factoryGuy, "\x0083r\x0083b\x0083N\x0083\x008a01");
					QuickTurn(factoryGuy, whyte, true, true);
				};
				local arionTurn = function () : ( arion, whyte )
				{
					WaitFrame(1);
					CMND_SET_ICON_TO_CHARA(arion, "\x0083r\x0083b\x0083N\x0083\x008a01");
					QuickTurn(arion, whyte, true, true);
				};					
				
				InitChildThread(2);
				AddChildThread(factoryGuyTurn);
				AddChildThread(arionTurn);
				RunChildThread();
				CMND_SND_PLAY(bgm);

				local arionPos = [
					0,
					0,
					0,
					0
				];				
				CMND_GET_POSRY(arion, arionPos);
				BattleFrontier.BattleFactoryPlayerLocation = arionPos;
								
				InitChildThread(3);
				AddChildThread(whyteWalk);
				AddChildThread(grisleyWalk);
				AddChildThread(ascotWalk);
				RunChildThread();
				WaitFrame(15);
				
				local arionStandEvent = CreateEvHiMdlForNumber("\x0082\x00c4\x0082\x00f1\x0082\x00dcH", 8, 902);
				local whyteStandEvent = CreateEvHiMdlForNumber("\x0082\x00b5\x0082\x00eb\x0082\x00b3\x0082\x00abH", 201, 108, false, true);
				local factoryGuyStandEvent = CreateEvHiMdlForCharaNo_NPCOnly("\x0082\x00ad\x0082\x00c7\x0082\x00a4H", 1080);
				local grisleyStandEvent = CreateEvHiMdlForNumber("grisleyStandEvent", 216, 108, false, false);
				local ascotStandEvent = CreateEvHiMdlForNumber("ascotStandEvent", 133, 108, false, false);
				WaitLoading(arionStandEvent);
				WaitLoading(whyteStandEvent);	
				WaitLoading(factoryGuyStandEvent);
				WaitLoading(grisleyStandEvent);
				WaitLoading(ascotStandEvent);	
				
				SetDrawAndPause(false);
				StartBrightFade(SCREEN_AB, 0.0, 60);
				CMND_RESET_TALK_CHARA();
				StartStandEvent();
				SetHiMdlPosAndMotID(arionStandEvent, EV_CHARA_POS_LEFT, [
					11,
					5,
					1
				], "cp0008");
				SetHiMdlPosAndMotID(whyteStandEvent, EV_CHARA_POS_RIGHT, [
					71,
					3,
					1
				], "cp0201");
				SetHiMdlPosAndMotID(factoryGuyStandEvent, EV_CHARA_POS_LEFT, [
					41,
					2,
					1
				], "cn1080");
				SetHiMdlPosAndMotID(grisleyStandEvent, EV_CHARA_POS_RIGHT, [
					33,
					3,
					1
				], "cp0216");
				SetHiMdlPosAndMotID(ascotStandEvent, EV_CHARA_POS_RIGHT, [
					11,
					7,
					1
				], "cp0133");				
				StandEventCharaFadeWait(whyteStandEvent, 1.0);
				CMND_MESWIN_LOCK();
				CreateSpeech("ev200", 0, true); // Whyte Talk
				StandEventCharaFadeWait(arionStandEvent, 1.0);				
				CreateSpeech("ev250"); // Arion Talk
				SetHiMdlPosAndMotID(arionStandEvent, EV_CHARA_POS_LEFT, [
					11,
					4,
					1
				], "cp0008");				
				SetHiMdlPosAndMotID(whyteStandEvent, EV_CHARA_POS_RIGHT, [
					61,
					6,
					1
				], "cp0201");					
				CreateSpeech("ev300", 0, true); // Whyte Talk
				CreateSpeech("ev350"); // Arion Talk
				StandEventCharaFadeWait(whyteStandEvent, 0.0);
				StandEventCharaFadeWait(arionStandEvent, 0.0);
				StandEventCharaFadeWait(factoryGuyStandEvent, 1.0);
				CreateSpeech("ev400"); // Factory guy Talk
				StandEventCharaFadeWait(grisleyStandEvent, 1.0);
				CreateSpeech("ev450", 0, true); // Grisley Talk
				StandEventCharaFadeWait(factoryGuyStandEvent, 0.0);
				StandEventCharaFadeWait(arionStandEvent, 1.0);
				CreateSpeech("ev500"); // Arion Talk
				StandEventCharaFadeWait(grisleyStandEvent, 0.0);
				StandEventCharaFadeWait(arionStandEvent, 0.0);
				StandEventCharaFadeWait(factoryGuyStandEvent, 1.0);
				StandEventCharaFadeWait(ascotStandEvent, 1.0);
				CreateSpeech("ev550"); // Factory guy Talk
				StandEventCharaFadeWait(factoryGuyStandEvent, 0.0);
				StandEventCharaFadeWait(arionStandEvent, 1.0);
				CreateSpeech("ev600"); // Arion Talk
				CreateSpeech("ev650", 0, true); // Arthur Talk
				StandEventCharaFadeWait(ascotStandEvent, 0.0);
				StandEventCharaFadeWait(whyteStandEvent, 1.0);
				CreateSpeech("ev700", 0, true); // Whyte Talk
				StartBrightFade(SCREEN_A, 1.0, EV_FADE_SLOW);
				StartBrightFade(SCREEN_AB, -1.0, 30);
				CMND_MESWIN_UNLOCK();
				EndStandEvent();
				SetDrawAndPause(true);
				CMND_DELETE_CHARA(factoryGuyStandEvent);
				CMND_DELETE_CHARA(arionStandEvent);
				CMND_DELETE_CHARA(grisleyStandEvent);
				CMND_DELETE_CHARA(ascotStandEvent);
				CMND_DELETE_CHARA(whyteStandEvent);
				SetDrawAndPause(true);
				ReserveMapJump("me01i02", [
					0,
					0,
					0,
					0
				]);
			}
		} else {
			// Defeat
			SetEvent(true, true, "M_20");
			BattleFrontier.Reserve = [];
			BattleFrontier.BattleFactoryWin = 0;
			BattleFrontier.BattleFactoryTeam = [];	
			BattleFrontier.BattleFactoryRun = false;			
			CreateSpeech("challengeFailed");								
			CMND_SET_GLOBAL_BIT_FLAG(1402, 0);
			CMND_SND_CLOSE(bgm, 30);
			StartBrightFade(SCREEN_AB, -1.0, EV_FADE_SLOW);
			CMND_SET_ENABLE(firstPlayer, true);
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
};