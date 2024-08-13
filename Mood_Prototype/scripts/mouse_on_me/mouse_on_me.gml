function mouse_on_me()
{
	if (instance_position(mouse_x, mouse_y, id)) return true
	
	return false
	
	
	var _bottomX = x + sprite_width;
	var _bottomY = y + sprite_height;
	
	if (mouse_x >= x) && (mouse_y >= y) && (mouse_x < _bottomX) && (mouse_y < _bottomY)
	return true;
	
	return false;
}