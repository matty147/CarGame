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
if timer < 0
	{
		deviation = irandom_range(-20, 20);
		timer = 100;
	}else timer--;
	var result = AiControlls(x ,y, CurentBoxVal,spd);
	angle = point_direction(x, y, result[1].x + deviation, result[1].y + deviation);
	half_angle = min(image_angle, angle) + angle_difference(image_angle, angle) / 4;
	image_angle = angle;
	spd = result[0];
	show_debug_message("image_angle: " + string(half_angle )); // should make the rotacion more smooth
	var targetX = lengthdir_x(result[0] * 1.5, half_angle );
	var targetY = lengthdir_y(result[0] * 1.5, half_angle );
	move_towards_point(result[1].x + deviation + targetX, result[1].y + deviation + targetY, result[0]);
	//move_towards_point(result[1].x + deviation, result[1].y + deviation, result[0]* 1.5);
	CurentBoxVal = result[2]
	if (CurentBoxVal > Ai_checkpoints)	
	{
		CurentBoxVal = 1;
	}
}else
{
	var result = PlayerMovement(x, y, Up, Down, Left, Right);
x = result[0];
y = result[1];
}