function player_movement(_x, _y, _up, _down, _left, _right, _player_number, movement){	
	
		if (_player_number == 1)
			{
				speed_up = global.player1_speed_up;

			}else if (_player_number == 2)
			{
				speed_up = global.player2_speed_up;
		
			}else if (_player_number == 3)
			{
				speed_up = global.player3_speed_up;

			}else 
			{
				speed_up = global.player4_speed_up;
			}
			
			x = movement + 1.0;
			dir_x = lengthdir_x(movement, image_angle);
			dir_y = lengthdir_y(movement, image_angle);
			
	if !place_meeting(_x + dir_x * speed_up, _y + dir_y * speed_up, Obj_Ramp)
	{
		LastRecordedX = _x;
		LastRecordedY = _y;
	}

if left != "0"
{
	//show_debug_message("Left != 0");
	if keyboard_check(ord(left)) 
	{
		image_angle += TurnSpeed;
		//show_debug_message("L");
	}
	else if keyboard_check(ord(right))
	{
	    image_angle -= TurnSpeed;
		//show_debug_message("R");
	}
}
else if keyboard_check(vk_left)
{
	//show_debug_message("<");
	image_angle += TurnSpeed;
	
}
else if keyboard_check(vk_right)
{
	//show_debug_message(">");
	image_angle -= TurnSpeed;
}


	if place_meeting(_x, _y, Obj_Ramp)
	{
		var distance = point_distance(LastRecordedX, 0, _y, 0);
		//show_debug_message("Distance: " + string(distance));
	
		if distance < ramp_width * 0.25
		{
			_y = LastRecordedY - 0;
		}else if distance < ramp_width * 0.5
		{
			_y = LastRecordedY - 8;
		}else if distance < ramp_width * 0.75
		{
			_y = LastRecordedY - 16;
		}else if distance < ramp_width
		{
			_y = LastRecordedY - 24;
		}
		height = 24; 
		image_index = 1;
		layer = 0;
	}else
	{
		image_index = 0; layer = 1;
		if  1== 1 //!place_meeting(x,y, Obj_ElevatedGround)
		{
			 if (height > 0)
			 {
				height--;
				if (LastRecordedY >= _y)
				{
					_y++;
				}
			 }
		}
	}

	if place_meeting(_x,_y, Obj_Ground) || height != 0
	{
		if (movement <= DefMovement)
		{
			movement += 0.25;		
		}
	}else
	{
		SpeedUp = 0.5;
		if (movement >= 2)
		{
			movement -= 0.25;
		}
	}
	
	if up != "0" || down != "0"
	{
		if keyboard_check(ord(up))
			{
				if (speed_up <= MaxSpeedUp)
				{
					speed_up += 0.01;
				}
				MoveX = dir_x;
				MoveY = dir_y;
			}else if keyboard_check(ord(down))
			{
				speed_up = 0.5;
				MoveX = dir_x * -1;
				MoveY = dir_y * -1;
			}else
			{
				MoveY = 0; MoveX = 0;
				if (speed_up > 0.1)
				{
					speed_up -= 0.1;
					//show_debug_message("A");
				}
			}
	}
	else if keyboard_check(vk_up)
	{
		if (speed_up <= MaxSpeedUp)
		{
			speed_up += 0.01;
		}
		MoveX = dir_x;
		MoveY = dir_y;
	}else if keyboard_check(vk_down)
	{
		speed_up = 0.5;
		MoveX = dir_x * -1;
		MoveY = dir_y * -1;
	}else
	{
		MoveY = 0; MoveX = 0;
		if (speed_up > 0.1)
		{
			speed_up -= 0.1;
		}
	}
												//will have to make this work
	if height > 0 && !place_meeting(_x,_y,Obj_Player) // && !place_meeting(x,y,Obj_ElevatedGround)
	{ 
		if place_meeting(_x,_y,Obj_Ramp)
		{
			speed_up = 0.75;
		}else speed_up = 0.5;
		MoveX = dir_x;
	}
	if height == 1
	{
	 speed_up = 1;	
	}

	if height > 0 || !place_meeting(_x + MoveX * speed_up, _y + MoveY * speed_up, Obj_Barrier)
	{
		_x += MoveX * speed_up;
		_y += MoveY * speed_up;
	}
	//show_debug_message(string(PlayerNumber) + " SpeedUp:" + string(SpeedUp));
	//saves the speed so i can use it nextime
	if (_player_number == 1)
		{
			global.player1_speed_up = speed_up;

		}else if (_player_number == 2)
		{
			global.player2_speed_up = speed_up;
		
		}else if (_player_number == 3)
		{
			global.player3_speed_up = speed_up;

		}else 
		{
			global.player4_speed_up = speed_up;
		}
return [_x, _y];
}