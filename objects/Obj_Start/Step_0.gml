if place_meeting(x, y, Obj_Player)
{
	if global.CurentCheckpointNumber <= 0
	{

		global.CurentCheckpointNumber++;
		show_debug_message("CurentCheckpoint: " + string(global.CurentCheckpointNumber));
	}else if (global.CurentCheckpointNumber >= NumberOfCheckpoints)
		{
			global.CurentCheckpointNumber = 0;
			global.PlayerLaps++;
		}
}

if (global.PlayerLaps >= LapsToWin)
{
	 game_end();
}