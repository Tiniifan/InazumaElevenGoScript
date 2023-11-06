SPrint("MapScript");
InitMap <- function ()
{
	SPrint("InitMap");

	if (CMND_GET_GLOBAL_BIT_FLAG(734) && !CMND_GET_GLOBAL_BIT_FLAG(735))
	{
		ReserveEvent(42082600);
	}


	if (CMND_GET_GLOBAL_BIT_FLAG(736) && !CMND_GET_GLOBAL_BIT_FLAG(743))
	{
		ReserveEvent(42083400);
	}


	if (CMND_GET_GLOBAL_BIT_FLAG(745) && !CMND_GET_GLOBAL_BIT_FLAG(744))
	{
		CMND_MAP_BGM_OFF();
		ReserveEvent(42083500);
	}


	if (CMND_GET_GLOBAL_BIT_FLAG(748) && !CMND_GET_GLOBAL_BIT_FLAG(801))
	{
		CMND_MAP_BGM_OFF();
		ReserveEvent(42090100);
	}


	if (CMND_GET_GLOBAL_BIT_FLAG(904) && !CMND_GET_GLOBAL_BIT_FLAG(905))
	{
		ReserveEvent(42100400);
	}


	if (CMND_GET_GLOBAL_BIT_FLAG(1309) && !CMND_GET_GLOBAL_BIT_FLAG(1307))
	{
		ReserveEvent(42210200, true);
	}
	
	if (BattleFrontier.BattleFactoryRun && !CMND_GET_TEMP_BIT_FLAG(16))
	{
		CMND_MAP_BGM_OFF();
	}
	
	if (BattleFrontier.BattleFactoryRun && CMND_GET_TEMP_BIT_FLAG(16))
	{
		ReserveEvent(70000150);
	}	
};
InitNpc <- function ()
{
	SPrint("InitNpc");
};

