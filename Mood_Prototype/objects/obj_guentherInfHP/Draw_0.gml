draw_self();
state.draw();

//hp bar
var _width = 64;
var _height = 16;

var _widthReal = _width * (hp / hpMax);

var _xBar = x - _width / 2;
var _yBar = y + 32;

draw_set_color(c_dkgray);
draw_rectangle(_xBar, _yBar, _xBar + _width, _yBar + _height, false);
draw_set_color(c_red);
if (_widthReal) draw_rectangle(_xBar, _yBar, _xBar + _widthReal, _yBar + _height, false);
draw_set_color(c_white);

if (global.debugmode)
{	
	draw_text_simple(x, y, state.name, { color : c_red, font : font_upheaval_scalable, size : fontscale * 4 });
	if (state.name == "Playing") draw_text_simple(x, y + 64, $"{timerPlaying}\n{timerReady}", { color : c_red, font : font_upheaval_scalable, size : fontscale * 1 });
	if (state.name == "Walk") draw_text_simple(x, y + 64, intent, { color : c_red, font : font_upheaval_scalable, size : fontscale * 2 });
	if (state.name == "Instigate") 
	{
		if (timerInstigate < 300) && (!done) draw_text_simple(x, y + 64, "active", { color : c_red, font : font_upheaval_scalable, size : fontscale * 1 });
		if (done) draw_text_simple(x, y + 64, "catching breath", { color : c_red, font : font_upheaval_scalable, size : fontscale * 1 });
	}
	
	draw_text_simple(x, y + 128, inRoom.number, { color : c_green, font : font_upheaval_scalable, size : fontscale * 2 });
}