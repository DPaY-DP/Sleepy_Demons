//draw self
draw_self();


//interaction prompt
if (point_distance(x + sprite_width / 2, y + sprite_height / 2, obj_player.x, obj_player.y) < rangeInteract)
{
	draw_sprite_simple(spr_UI_button, 0, x + sprite_width / 2, y + sprite_height / 2, { size : 0.8 });
}

//hp bar
if (hp == hpMax) exit;

var _width = 96;
var _height = 16;

var _widthReal = _width * (hp / hpMax);

var _xBar = x - _width / 2 + sprite_width / 2;
var _yBar = y + sprite_height * 0.75;

draw_set_color(c_dkgray);
draw_rectangle(_xBar, _yBar, _xBar + _width, _yBar + _height, false);
draw_set_color(c_yellow);
if (_widthReal) draw_rectangle(_xBar, _yBar, _xBar + _widthReal, _yBar + _height, false);
draw_set_color(c_white);