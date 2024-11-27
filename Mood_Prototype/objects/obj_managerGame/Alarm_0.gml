//get level borders
var _increment = 16;
	
var _xLeft = -_increment;
var _break = false;
while (_xLeft < room_width / 2)
{
	_xLeft += _increment;
	with (obj_room)	if (instance_position(_xLeft, y, id)) _break = true;
		
	if (_break) 
	{
		_break = false;
		break;
	}
}
	
var _xRight = room_width + _increment;
var _break = false;
while (_xRight > room_width / 2)
{
	_xRight -= _increment;
	with (obj_room)	if (instance_position(_xRight, y, id)) _break = true;
		
	if (_break) 
	{
		_break = false;
		break;
	}
}
	
var _yTop = -_increment;
var _break = false;
while (_yTop < room_height / 2)
{
	_yTop += _increment;
	with (obj_room)	if (instance_position(x, _yTop, id)) _break = true;
		
	if (_break) 
	{
		_break = false;
		break;
	}
}
	
var _yBottom = room_height + _increment;
var _break = false;
while (_yBottom > room_height / 2)
{
	_yBottom -= _increment;
	with (obj_room)	if (instance_position(x, _yBottom, id)) _break = true;
		
	if (_break) 
	{
		_break = false;
		break;
	}
}

var _totalWidth = _xRight - _xLeft;
var _totalHeight = _yBottom - _yTop;

mapscale = (1280 / _totalWidth) * 0.2;

mapLeftCompensate = _xLeft * mapscale;
mapTopCompensate = _yTop * mapscale;
mapMaxHeight = _totalHeight * mapscale;
	
show_debug_message($"###left: {_yTop}, right: {_yTop}\ntop: {_yTop}, bottom: {_yBottom}\ntotalW: {_totalWidth}, totalH: {_totalHeight}, scale: {mapscale}");