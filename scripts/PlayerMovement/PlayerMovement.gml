function PlayerMovement(X, Y, Up, Down, Left, Right){
	
	// the movement variable is used toset te default speed of the car(player on grass, ground...)
	// and the speedup variable is used to for speedups...
	
	
	//sets the where the player will be next frame
		DirX = lengthdir_x(Movement, image_angle);
		DirY = lengthdir_y(Movement, image_angle);
		
		//ramp enter
	if !place_meeting(X + DirX * SpeedUp, Y + DirY * SpeedUp, Obj_Ramp)
	{
		LastRecordedX = X;
		LastRecordedY = Y;
	}
	
	//turning
if Left != 0 && Right != 0
{
	if keyboard_check(ord(Left)) 
	{
		image_angle += TurnSpeed;
	}	
	else if keyboard_check(ord(Right))
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

//ramp
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
		image_index = 1; // FIX that there is no sprite 1!!!
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

//detecting if the player is on the ground
	if place_meeting(X,Y, Obj_Ground) || height != 0
	{
		if (Movement <= DefMovement)
		{
			Movement += 0.25;		
		}
	}
	else
	{
		//SpeedUp = 0.5;
		if (Movement >= 2)
		{
			Movement -= 0.25;
		}
	}
	
	//forward backwards controlls
	if Up != 0 && Down != 0
	{
		if keyboard_check(ord(Up))
			{
				Moving = true;
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
				Moving = true;
			}else Moving = false;
	}else if keyboard_check(vk_up)
	{
		Moving = true;
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
		Moving = true;
	}else
	{
		Moving = false;
		//MoveY = 0; MoveX = 0;
	}
	
	//slow down
	if !Moving
	{
		if SpeedUp >= 0
		{
			if place_meeting(X,Y, Obj_Ice)
			{
				SpeedUp -= 0.005;
			}else SpeedUp -= 0.05;
		}
	}
	if SpeedUp < 0
	{
		SpeedUp = 0;	
	}
		
	//ramp
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

	//bostpad
	if place_meeting(X,Y,Obj_Boostpad) //make it slow down slower // make it faster because it dosent feel like a boost and is too slow
	{
		var collidedObject = instance_place(X, Y, Obj_Boostpad);
		boost = collidedObject.Boost;
		Afterboost = collidedObject.Lenght;
		SpeedUp = MaxSpeedUp;
	}else if Afterboost > 0
	{
		SpeedUp = MaxSpeedUp;
		Afterboost--;
	}else boost = 1;

//moving the player
	if height > 0 || !place_meeting(X + MoveX * SpeedUp, Y + MoveY * SpeedUp, Obj_Barrier)
	{
		X += MoveX * SpeedUp * boost;
		Y += MoveY * SpeedUp  * boost;
	}
	//show_debug_message("SpeedUp:" + string(SpeedUp));
return [X, Y];
}