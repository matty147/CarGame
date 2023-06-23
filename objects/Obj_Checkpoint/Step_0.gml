if place_meeting(x, y, Obj_Player)
{
	if global.CurentCheckpointNumber == CheckpointNumber
	{
		global.CurentCheckpointNumber++;
		show_debug_message("CurentCheckpoint: " + string(global.CurentCheckpointNumber));
	}
}