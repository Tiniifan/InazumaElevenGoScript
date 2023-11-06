formations <- [
	"ifb0101",
	"ifb0102",
	"ifb0103",
	"ifb0104",
	"ifb0105",
	"ifb0106",
	"ifb0107",
	"ifb0108",
	"ifb0109",
	"ifb0110",
	"ifb0111",
];

uniforms <- [
	1,
	2,
	3,
	4,
	5,
	6,
	7,
	8,
	10,
	11,
	12,
	14,
	15,
	16,
	17,
	18,
	19,
	20,
	21,
	22,	
	23,		
	101,
	102,
	103,
	104,
	105,
	106,
	107,
	108,
	109,
	110,
	111,
	112,
	113,
	114,
	115,
	116,
	117,
	118,
	119,
	120,
	121,
	901,	
];

battleTeam <- [];
easy_flag <- 12;
hard_flag <- 13;
legend_flag <- 14;
win_flag <- 15;

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
	
	// Set random formation for opponent team
	CMND_BTL_SET_FORMATIONID(1, formations[CMND_RANDOM(formations.len())]);

	// Generate a random team based on difficulty for opponent team
	if (CMND_GET_TEMP_BIT_FLAG(easy_flag))
	{
		battleTeam = CreateTeam(players, "easy", 1);
		CMND_BTL_SET_SHOES_AND_GLOVE(1, "ssa0006", "sga0006"); // Royal Academy
	} else if (CMND_GET_TEMP_BIT_FLAG(hard_flag))
	{
		battleTeam = CreateTeam(players, "hard", 1);
		CMND_BTL_SET_SHOES_AND_GLOVE(1, "ssa0010", "sga0010"); // Alpine
	} else if (CMND_GET_TEMP_BIT_FLAG(legend_flag))
	{
		battleTeam = CreateTeam(players, "legend", 1);
		CMND_BTL_SET_SHOES_AND_GLOVE(1, "ssa0019", "sga0019"); // Zero
	}
	
	// Add random players to the opponent team
	for (local i = 0; i < 5; i++) {
		CMND_BTL_ADD_MEMBER(1, battleTeam[i].name, 99, i+1);
	}
};

BtlSetting <- function ()
{
	// Remove fighting spirit for user team
	CMND_SET_GLOBAL_BIT_FLAG(1402, 1);
	
	// Set team name
	CMND_BTL_SET_TEAM_NAME(0, 1, "name_bfte_0001"); // Borrow Team
	CMND_BTL_SET_TEAM_NAME(1, 1, "name_bfte_" + (BattleFrontier.BattleFactoryWin+1)); // Battle Factory
	
	// Set random uniform for opponent team
	local uniform = uniforms[CMND_RANDOM(uniforms.len())];
	local uniform_outdoor = CMND_RANDOM(100);
	
	// Forces the game to remove basic moves to learn randomized moveset
	for (local i = 0; i < 5; i++) {
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
			CMND_BTL_LEARNING_SKILL(1, battleTeam[i].name, hissatsu.name, 1);
		}
		
		if (uniform_outdoor < 50) {
			CMND_BTL_CHANGE_UNIFORM(1, battleTeam[i].name, uniform, 0, 0, uniform);
		} else {
			CMND_BTL_CHANGE_UNIFORM(1, battleTeam[i].name, uniform, 1, 0, uniform);
		}
	}
};

ScBtlResult <- function ()
{
	local isWin = 0;
	isWin = CMND_BTL_GET_RESULT();
	
	if (isWin) {
		CMND_SET_TEMP_BIT_FLAG(win_flag, true);
		
		foreach(player in battleTeam) {
			if (!CMND_GET_PARTY_HANDLE(player.name)) {
				local newPlayer = CMND_ADD_PARTY(player.name);
				CMND_SET_LV(newPlayer, 99);
				
				for (local i = 0; i < player.hissatsus.len(); i++) {
					CMND_SET_SKILL(newPlayer, player.hissatsus[i].crc32, i);
				}
			}
		}		
	} else {
		CMND_SET_TEMP_BIT_FLAG(win_flag, false);
	}
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

};

CallMatchEndMatch <- function ( teamWin, id0, id1 )
{

};