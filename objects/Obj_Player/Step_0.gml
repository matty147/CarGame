/*
	DirX = lengthdir_x(Movement, image_angle);
	DirY = lengthdir_y(Movement, image_angle);
if !place_meeting(x + DirX * SpeedUp, y + DirY * SpeedUp, Obj_Ramp)
{
	LastRecordedX = x;
	LastRecordedY = y;
}

if keyboard_check(ord("A")) || keyboard_check(vk_left)
{
    image_angle += TurnSpeed;
}
else if keyboard_check(ord("D")) || keyboard_check(vk_right)
{
    image_angle -= TurnSpeed;
}
if place_meeting(x,y, Obj_Ramp)
{
	var distance = point_distance(LastRecordedX, 0, x, 0);
	//show_debug_message("Distance: " + string(distance));
	
	if distance < ramp_width * 0.25
	{
		y = LastRecordedY - 0;
	}else if distance < ramp_width * 0.5
	{
		y = LastRecordedY - 8;
	}else if distance < ramp_width * 0.75
	{
		y = LastRecordedY - 16;
	}else if distance < ramp_width
	{
		y = LastRecordedY - 24;
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
			if (LastRecordedY >= y)
			{
				y++;
			}
		 }
	}
}

if place_meeting(x,y, Obj_Ground) || height != 0
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
if keyboard_check(ord("W")) || keyboard_check(vk_up)
{
	if (SpeedUp <= MaxSpeedUp)
	{
		SpeedUp += 0.01;
	}
	MoveX = DirX;
	MoveY = DirY;
}else if keyboard_check(ord("S")) || keyboard_check(vk_down)
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
												//will have to make this work
if height > 0 && !place_meeting(x,y,Obj_Player) // && !place_meeting(x,y,Obj_ElevatedGround)
{ 
	if place_meeting(x,y,Obj_Ramp)
	{
		SpeedUp = 0.75;
	}else SpeedUp = 0.5;
	MoveX = DirX;
}
if height == 1
{
 SpeedUp = 1;	
}

if height > 0 || !place_meeting(x + MoveX * SpeedUp, y + MoveY * SpeedUp, Obj_Barrier)
{
	x += MoveX * SpeedUp;
	y += MoveY * SpeedUp;
}
show_debug_message("SpeedUp:" + string(SpeedUp));
*/
if Ai
{
	var result = AiControlls(x ,y, CurentBoxVal);
	image_angle = point_direction(x, y, result[1].x, result[1].y);
	move_towards_point(result[1].x, result[1].y, result[0]*10);
	CurentBoxVal = result[2]
	if (CurentBoxVal > Ai_checkpoints)
	CurentBoxVal = 1;
}else
{
	var result = PlayerMovement(x, y, Up, Down, Left, Right);
x = result[0];
y = result[1];
}


