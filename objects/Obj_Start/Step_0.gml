if StartEndTimer
{
	timer--;
	if timer <= 0
	{
		game_end();
	}
	
}else
{
	if place_meeting(x, y, Obj_Player)
	{
		var colliding_car_id = instance_place(x , y, Obj_Player);
		PlayerNumber = colliding_car_id.PlayerId - 1;
			
		if global.CurentCheckpointNumberPlayer[PlayerNumber] <= 0
		{
			global.CurentCheckpointNumberPlayer[PlayerNumber]++;
			show_debug_message("CurentCheckpoint: " + string(global.CurentCheckpointNumberPlayer[PlayerNumber]));
		}else if (global.CurentCheckpointNumberPlayer[PlayerNumber] >= NumberOfCheckpoints)
			{
				global.CurentCheckpointNumberPlayer[PlayerNumber] = 0;
				global.PlayerLapsPlayer[PlayerNumber]++;
			}
			if (global.PlayerLapsPlayer[PlayerNumber] >= LapsToWin)
				{
					show_debug_message($"{PlayerNumber + 1} Finished!!!");
					PlayersFinished[PlayerNumber] = 1;
					ds_list_add(FinalPlayerPosition , string(PlayerNumber));
				}
				
				PlayerFinishedNumber = PlayersFinished[0] + PlayersFinished[1] + PlayersFinished[2] + PlayersFinished[3];
				if PlayerFinishedNumber + 1 = Obj_GameManager.NumberOfCars
				{
					show_debug_message(PlayerFinishedNumber);
					StartEndTimer = true;
					timer = 120;
				}
	}
}
