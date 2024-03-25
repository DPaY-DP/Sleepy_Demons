function coords_in_area(_x, _y, _xTop, _yTop, _xOffset, _yOffset)
{
	var bottomX = _xTop + _xOffset;
	var bottomY = _yTop + _yOffset;
	
	if (mouse_x >= _xTop) && (mouse_y >= _yTop) && (mouse_x < bottomX) && (mouse_y < bottomY)
	return true;
	
	return false;
}