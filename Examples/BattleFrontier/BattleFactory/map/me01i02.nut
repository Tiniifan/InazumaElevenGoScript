SPrint("MapScript");
InitMap <- function ()
{
	SPrint("InitMap");
	
	if (BattleFrontier.BattleFactoryRun)
	{
		ReserveEvent(70000050);
	}	

	if (CMND_GET_GLOBAL_BIT_FLAG(64) && !CMND_GET_GLOBAL_BIT_FLAG(23))
	{
		ReserveEvent(42012300);
	}
	else
	{

		if (CMND_GET_GLOBAL_BIT_FLAG(402) && !CMND_GET_GLOBAL_BIT_FLAG(401))
		{
			ReserveEvent(42050100);
		}
		else
		{

			if (CMND_GET_GLOBAL_BIT_FLAG(603) && !CMND_GET_GLOBAL_BIT_FLAG(604))
			{
				ReserveEvent(42070400);
			}
			else
			{

				if (CMND_GET_GLOBAL_BIT_FLAG(649) && !CMND_GET_GLOBAL_BIT_FLAG(647))
				{
					ReserveEvent(42073800);
				}
				else
				{

					if (CMND_GET_GLOBAL_BIT_FLAG(820) && !CMND_GET_GLOBAL_BIT_FLAG(821))
					{
						ReserveEvent(42091600);
					}
					else
					{

						if (CMND_GET_GLOBAL_BIT_FLAG(901) && !CMND_GET_GLOBAL_BIT_FLAG(902))
						{
							ReserveEvent(42100200);
						}
						else
						{

							if (CMND_GET_GLOBAL_BIT_FLAG(938) && !CMND_GET_GLOBAL_BIT_FLAG(937))
							{
								ReserveEvent(42102800);
							}
							else
							{

								if (CMND_GET_GLOBAL_BIT_FLAG(1025) && !CMND_GET_GLOBAL_BIT_FLAG(1024))
								{
									ReserveEvent(42111500);
								}
								else
								{

									if (CMND_GET_GLOBAL_BIT_FLAG(1142) && !CMND_GET_GLOBAL_BIT_FLAG(1141))
									{
										ReserveEvent(42123200);
									}
								}
							}
						}
					}
				}
			}
		}
	}

};
InitNpc <- function ()
{
	SPrint("InitNpc");
};

