SPrint("MapScript");
InitMap <- function ()
{
	SPrint("InitMap");
	
	if (BattleFrontier.BattleFactoryRun)
	{
		ReserveEvent(70000100);
	}	
}