if keyboard_check(ord("A")) || keyboard_check(vk_left)
{
    image_angle += TurnSpeed;
}
else if keyboard_check(ord("D")) || keyboard_check(vk_right)
{
    image_angle -= TurnSpeed;
}

if place_meeting(x,y, Obj_Ground)
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
	MoveX = lengthdir_x(Movement, image_angle);
	MoveY = lengthdir_y(Movement, image_angle);
}else if keyboard_check(ord("S")) || keyboard_check(vk_down)
{
	SpeedUp = 0.5;
	MoveX = lengthdir_x(Movement, image_angle) * -1;
	MoveY = lengthdir_y(Movement, image_angle) * -1;
}else
{
	MoveY = 0; MoveX = 0;
	if (SpeedUp > 0.1)
	{
		SpeedUp -= 0.1;
	}
}

x += MoveX * SpeedUp;
y += MoveY * SpeedUp;