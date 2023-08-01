function PlayerMovement(X, Y, Up, Down, Left, Right){
	
		DirX = lengthdir_x(Movement, image_angle);
		DirY = lengthdir_y(Movement, image_angle);
	if !place_meeting(X + DirX * SpeedUp, Y + DirY * SpeedUp, Obj_Ramp)
	{
		LastRecordedX = X;
		LastRecordedY = Y;
	}
if Left != 0 && Right != 0
{
	if keyboard_check(ord(Left)) 
	{
		image_angle += TurnSpeed;
	}	else if keyboard_check(ord(Right))
	{
	    image_angle -= TurnSpeed;
	}
}else if keyboard_check(vk_left)
{
	image_angle += TurnSpeed;
}else if keyboard_check(vk_right)
{
	image_angle -= TurnSpeed;
}
	if place_meeting(X,Y, Obj_Ramp)
	{
		var distance = point_distance(LastRecordedX, 0, X, 0);
		//show_debug_message("Distance: " + string(distance));
	
		if distance < ramp_width * 0.25
		{
			Y = LastRecordedY - 0;
		}else if distance < ramp_width * 0.5
		{
			Y = LastRecordedY - 8;
		}else if distance < ramp_width * 0.75
		{
			Y = LastRecordedY - 16;
		}else if distance < ramp_width
		{
			Y = LastRecordedY - 24;
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
				if (LastRecordedY >= Y)
				{
					Y++;
				}
			 }
		}
	}

	if place_meeting(X,Y, Obj_Ground) || height != 0
	{
		if (Movement <= DefMovement)
		{
			Movement += 0.25;		
		}
	}else
	{
		SpeedUp = 0.5;
		if (Movement >= 2)
		{
			Movement -= 0.25;
		}
	}
	if Up != 0 && Down != 0
	{
		if keyboard_check(ord(Up))
			{
				if (SpeedUp <= MaxSpeedUp)
				{
					SpeedUp += 0.01;
				}
				MoveX = DirX;
				MoveY = DirY;
			}else if keyboard_check(ord(Down))
			{
				SpeedUp = 0.5;
				MoveX = DirX * -1;
				MoveY = DirY * -1;
			}else
			{
				MoveY = 0; MoveX = 0;
				if (SpeedUp > 0.1)
				{
					SpeedUp -= 0.1;
				}
			}
	}else if keyboard_check(vk_up)
	{
		if (SpeedUp <= MaxSpeedUp)
		{
			SpeedUp += 0.01;
		}
		MoveX = DirX;
		MoveY = DirY;
	}else if keyboard_check(vk_down)
	{
		SpeedUp = 0.5;
		MoveX = DirX * -1;
		MoveY = DirY * -1;
	}else
	{
		MoveY = 0; MoveX = 0;
		if (SpeedUp > 0.1)
		{
			SpeedUp -= 0.1;
		}
	}
	{
		
		
	}

													//will have to make this work
	if height > 0 && !place_meeting(X,Y,Obj_Player) // && !place_meeting(x,y,Obj_ElevatedGround)
	{ 
		if place_meeting(X,Y,Obj_Ramp)
		{
			SpeedUp = 0.75;
		}else SpeedUp = 0.5;
		MoveX = DirX;
	}
	if height == 1
	{
	 SpeedUp = 1;	
	}

	if height > 0 || !place_meeting(X + MoveX * SpeedUp, Y + MoveY * SpeedUp, Obj_Barrier)
	{
		X += MoveX * SpeedUp;
		Y += MoveY * SpeedUp;
	}
	//show_debug_message("SpeedUp:" + string(SpeedUp));
return [X, Y];
}