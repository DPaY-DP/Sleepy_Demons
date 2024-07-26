function mouse_on_me()
{
	var _bottomX = x + sprite_width;
	var _bottomY = y + sprite_height;
	
	if (mouse_x >= x) && (mouse_y >= y) && (mouse_x < _bottomX) && (mouse_y < _bottomY)
	return true;
	
	return false;
}