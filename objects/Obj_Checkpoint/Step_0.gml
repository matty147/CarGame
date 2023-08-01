if place_meeting(x, y, Obj_Player)
{
	//make a function for this
		var colliding_car_id = instance_place(x , y, Obj_Player);
		if (colliding_car_id.PlayerId == 1) {
		    show_debug_message("P1");
			PlayerNumber = 0;
		}
		if (colliding_car_id.PlayerId == 2) {
		    show_debug_message("P2");
			PlayerNumber = 1;
		}
		if (colliding_car_id.PlayerId == 3) {
		    show_debug_message("P3");
			PlayerNumber = 2;
		}
		if (colliding_car_id.PlayerId == 4) {
		    show_debug_message("P4");
			PlayerNumber = 3;
		}
	if global.CurentCheckpointNumberPlayer[PlayerNumber] == CheckpointNumber
	{
		global.CurentCheckpointNumberPlayer[PlayerNumber]++;
		show_debug_message("CurentCheckpoint: " + string(global.CurentCheckpointNumberPlayer[PlayerNumber]));
	}
}