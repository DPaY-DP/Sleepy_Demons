draw_self();

var _factor = hp / hpMax;

var _xDraw = x - sprite_width / 2;
var _yDraw = y + sprite_height / 2 - _factor * sprite_height;

var _width = sprite_width;
var _height = _factor * sprite_height / 2;

var _maxImage = image_number - 1;
var _image = ((_factor / 3) + stage * (1/3)) * _maxImage;

image_index = _image;

//draw_sprite_part_ext(spr_envObject, stage + 1, 0, 0, _width, _height, _xDraw, _yDraw, 2, 2, c_white, 1);

if	(hp < hpMax) && 
	(point_distance(x, y, obj_player.x, obj_player.y) < distInteract) &&
	(obj_player.inRoom == inRoom)
{
	draw_sprite_simple(spr_UI_button, 1, x, y, { size : 0.8 });
}

//DEBUG
if (global.debugmode)
{
	var _length = array_length(pointsSabo);
	for (var i = 0; i < _length; i++)
	{
		var _color = c_lime;
		if (pointsSabo[i][1] != 0) _color = c_green;
		draw_sprite_simple(spr_debugDot, 0, pointsSabo[i][0].x, pointsSabo[i][0].y, { color : _color });
	}
}