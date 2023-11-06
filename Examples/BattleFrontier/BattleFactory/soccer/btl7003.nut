battleTeam <- [];
eventCounter <- 0;
draw_flag <- 16;
defeat_flag <- 17;
win_flag <- 18;

OPEN_CPU_BTL_FLAG <- function ( _flag )
{
	CMND_SET_GLOBAL_BIT_FLAG(_flag, 1);

	for( local i = 1650; i <= 1678; i++ )
	{

		if (!CMND_GET_GLOBAL_BIT_FLAG(i))
		{
			return;
		}
	}

	CMND_SET_GLOBAL_BIT_FLAG(1679, 1);
};

InitBtl <- function ()
{		
	// Set raimon equipment for user team
	CMND_BTL_SET_SHOES_AND_GLOVE(0, "ssa0001", "sga0001");
	
	// Wolfe Whyte
	battleTeam.append(Player("para_cp0201", "GK", [
		Hissatsu("whk0006", "hard", "save", 0x7A5A44EB, 5),
		Hissatsu("whp0030", "easy", "skill", 0xAF24148E),
		Hissatsu("whp0020", "easy", "skill", 0xB63F25CF),
	]));
	
	// Gale Mystral
	battleTeam.append(Player("para_cp1272" "DF", [
		Hissatsu("whd0009", "legend", "defense", 0x68B5CEAB, 5),
		Hissatsu("who0001", "hard", "dribble", 0x11BE7788, 4),
		Hissatsu("whp0036", "easy", "skill", 0x4647B1BB),
		Hissatsu("whp0029", "easy", "skill", 0xCFE39D6B),
	]));
	
	// Gale Sweep
	battleTeam.append(Player("para_cp1516", "DF", [
		Hissatsu("whd0009", "legend", "defense", 0x68B5CEAB, 5),
		Hissatsu("who0001", "hard", "dribble", 0x11BE7788, 4),
		Hissatsu("whp0037", "easy", "skill", 0x3140812D),
		Hissatsu("whp0029", "easy", "skill", 0xCFE39D6B),
	]));
	
	// Grisley
	battleTeam.append(Player("para_cp0216", "FW", [
		Hissatsu("whs0024", "legend", "shoot", 0xF6F29B06, 5),
		Hissatsu("whs0028", "legend", "shoot", 0xFF44D72D, 5),
		Hissatsu("who0014", "hard", "dribble", 0x78CFB246, 4),
		Hissatsu("whp0020", "easy", "skill", 0xB63F25CF),
		Hissatsu("whp0021", "easy", "skill", 0xC1381559),
	]));
	
	// Ascot
	battleTeam.append(Player("para_cp0133", "DF", [
		Hissatsu("whs0006", "legend", "shoot", 0x2ACA98A8, 4),
		Hissatsu("who0012", "legend", "dribble", 0x91AC1773, 5),
		Hissatsu("whd0009", "legend", "defense", 0x68B5CEAB, 5),
		Hissatsu("whp0039", "easy", "skill", 0xD6F8AC2A),
		Hissatsu("whp0040", "easy", "skill", 0xE0658249),
	]));
	
	for (local i = 0; i < BattleFrontier.BattleFactoryTeam.len(); i++) 
	{
		battleTeam.append(BattleFrontier.BattleFactoryTeam[i]);
	}
	
	for (local i = 0; i < battleTeam.len(); i++) {
		CMND_BTL_ADD_MEMBER(1, battleTeam[i].name, 99, i);			
	}
	
	// Forces the game to remove basic moves to learn randomized moveset
	for (local i = 0; i < battleTeam.len(); i++) {
		foreach(hissatsu in defenses) {
			CMND_BTL_FORGET_SKILL(1, battleTeam[i].name, hissatsu.name, false);
		}
		
		foreach(hissatsu in dribbles) {
			CMND_BTL_FORGET_SKILL(1, battleTeam[i].name, hissatsu.name, false);
		}

		foreach(hissatsu in saves) {
			CMND_BTL_FORGET_SKILL(1, battleTeam[i].name, hissatsu.name, false);
		}	

		foreach(hissatsu in shoots) {
			CMND_BTL_FORGET_SKILL(1, battleTeam[i].name, hissatsu.name, false);
		}	

		foreach(hissatsu in skills) {
			CMND_BTL_FORGET_SKILL(1, battleTeam[i].name, hissatsu.name, false);
		}	

		foreach(hissatsu in battleTeam[i].hissatsus) {
			CMND_BTL_LEARNING_SKILL(1, battleTeam[i].name, hissatsu.name, hissatsu.level);
		}
	}

	CMND_BTL_CHANGR_MEMBER_POS(1, "para_cp1272", 4);
	CMND_BTL_CHANGR_MEMBER_POS(1, "para_cp1516", 5);
	CMND_BTL_CHANGR_MEMBER_POS(1, "para_cp0216", 10);
	CMND_BTL_CHANGR_MEMBER_POS(1, "para_cp0133", 11);
};

BtlSetting <- function ()
{
	// Remove fighting spirit for user team
	CMND_SET_GLOBAL_BIT_FLAG(1402, 1);

	CMND_BTL_SET_FORCE_TOUGH_ONLY_TP(true, 0, 1, true);
	CMND_BTL_SET_FORCE_TOUGH_ONLY_TP(true, 3, 1, true);
	CMND_BTL_SET_FORCE_TOUGH_ONLY_TP(true, 4, 1, true);
	CMND_BTL_SET_FORCE_TOUGH_ONLY_TP(true, 9, 1, true);
	CMND_BTL_SET_FORCE_TOUGH_ONLY_TP(true, 10, 1, true);	
};

CallPurposeMarker <- function ()
{
	if (eventCounter == 0) 
	{
		local posXZRotY1 = [
			0.0,
			-0.2,
			0.0
		];
		
		CMND_BTL_SET_CHARA_POS(1, "para_cp0133", posXZRotY1);
		CMND_BTL_SET_BALL_HAVE(1, "para_cp0133");
		
		CMND_BTL_SET_EVPARAM(70000200);
		suspend();
	}
};

ScBtlResult <- function ()
{

};

CallMatchGoalEnd <- function ( teamInGoal, idSh, idKp )
{
};

CallMatchOwnGoalEnd <- function ( teamInGoal, idSh, idKp )
{
};

CallMatchGetPassBall <- function ( idGet, idPass )
{
};

CallMatchBeginMatch <- function ()
{
};

CallMatchKickoffFirst <- function ()
{
	// Force to remove fighting spirit
	for (local i = 5; i < battleTeam.len(); i++) 
	{
		CMND_BTL_SET_AVATER(battleTeam[i].name, "ck0000", 1);
	}

	CMND_BTL_SET_PURPOSE(3, -1, true, 0, -0.68, 0);
};

CallMatchEndMatch <- function ( teamWin, id0, id1 )
{
	if (teamWin == 0)
	{
		CMND_SET_TEMP_BIT_FLAG(win_flag, true);
		CMND_SET_TEMP_BIT_FLAG(defeat_flag, false);
		CMND_SET_TEMP_BIT_FLAG(draw_flag, false);
	} else if (teamWin == 1) 
	{
		CMND_SET_TEMP_BIT_FLAG(win_flag, false);
		CMND_SET_TEMP_BIT_FLAG(defeat_flag, true);
		CMND_SET_TEMP_BIT_FLAG(draw_flag, false);
	} else 
	{
		CMND_SET_TEMP_BIT_FLAG(win_flag, false);
		CMND_SET_TEMP_BIT_FLAG(defeat_flag, false);
		CMND_SET_TEMP_BIT_FLAG(draw_flag, true);
	}
};