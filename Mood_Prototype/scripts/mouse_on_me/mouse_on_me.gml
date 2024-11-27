function mouse_on_me()
{
	if (instance_position(mouse_x, mouse_y, id)) return true;
	
	return false;
}