//draw self
draw_self();


//interaction prompt
if (point_distance(x, y, obj_player.x, obj_player.y) < rangeInteract)
{
	draw_sprite_simple(spr_UI_button, 0, x, y, { size : 0.8 });
}


//hp bar
if (hp == hpMax) && (boost == 0) exit;

var _width = 96;
var _height = 16;

var _widthReal = _width * (hp / hpMax);

var _xBar = x - _width / 2;
var _yBar = y + sprite_height * 0.25;

draw_set_color(c_dkgray);
draw_rectangle(_xBar, _yBar, _xBar + _width, _yBar + _height, false);
draw_set_color(c_yellow);
if (_widthReal) draw_rectangle(_xBar, _yBar, _xBar + _widthReal, _yBar + _height, false);
draw_set_color(c_white);

if (boost == 0) exit;

var _widthReal = _width * (boost / hpMax);
var _xBar = x - _width / 2;

draw_set_color(c_aqua);
if (_widthReal) draw_rectangle(_xBar, _yBar, _xBar + _widthReal, _yBar + _height, false);
draw_set_color(c_white);