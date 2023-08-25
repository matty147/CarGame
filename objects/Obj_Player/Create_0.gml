ramp_width = sprite_get_width(Obj_Ramp.sprite_index);
spd = 0.5;
image_speed = 0;
MoveX = 0;
MoveY = 0;
DefMovement = Movement;
SpeedUp = 0;
MaxSpeedUp = 1;
height = 0;
LastRecordedX = 0;
LastRecordedY = 0;
CurentBoxVal = 1;
timer = -1;
angle = 0;
deviation = 0;
Afterboost = 0;
//Color = function(r,g,b) constructor
//{
//	red = r;
//	green = g;
//	blue = b;

//	static toShaderValue = function(value)
//	{
//		return value/255;
//	}
//};

//colorMatch = new Color(0,0,0);
//colorReplace = new Color(234,48,255);

//sh_handle_range = shader_get_uniform(sh_ChangeColor, "range");
//sh_handle_match = shader_get_uniform(sh_ChangeColor, "colorMatch");
//sh_handle_replace = shader_get_uniform(sh_ChangeColor, "colorReplace");
