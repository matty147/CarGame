function PreformAction()
{
	if (Action == 1)
	{
	 room_goto_next();
	}
}
if (mouse_check_button_pressed(mb_left)) {
	PreformAction();
}