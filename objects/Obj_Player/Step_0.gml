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
	height = 18; 
	image_index = 1;
	layer = 0;
}else
{
	image_index = 0; layer = 1;
	 if (height > 0)
	 {
		height--;
		//y++;
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

if height > 0 || !place_meeting(x + MoveX * SpeedUp, y + MoveY * SpeedUp, Obj_Barrier)
{
	x += MoveX * SpeedUp;
	y += MoveY * SpeedUp;
}