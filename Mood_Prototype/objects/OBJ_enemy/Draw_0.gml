draw_self();
state.draw();

if (slowed)
{
	timerSlowed--;
	if (timerSlowed <= 20) && (slowedStarFrame mod 4 == 0) slowedStarAlpha *= -1;
	if (timerSlowed <= 0)
	{
		slowed = false;
		slowedStarAlpha = 1;
	}
	
	slowedStarFrame++;
	draw_sprite_simple(spr_stun, floor(slowedStarFrame / 20), x, y - 20, { alpha : slowedStarAlpha });
}

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
	if (variable_instance_exists(id, "drawArrow"))
	{
		if (drawArrow != false)
		{
			draw_sprite_simple(spr_arrow, 0, x, y, { angle : drawArrow.goal, color : c_black });
			draw_sprite_simple(spr_arrow, 0, x, y, { angle : drawArrow.move, color : c_green });
			draw_sprite_simple(spr_arrow, 0, x, y, { angle : drawArrow.target, color : c_red });
		}
	}
	
	draw_text_simple(x, y, state.name, { color : c_red, size : 2 });
	if (state.name == "Playing") draw_text_simple(x, y + 64, $"{timerPlaying}\n{timerReady}", { color : c_red, size : 1 });
	if (state.name == "Walk") draw_text_simple(x, y + 64, intent, { color : c_red, size : 1 });
	if (state.name == "Sabotage") 
	{
		if (timerCackle < 300) draw_text_simple(x, y + 64, "cackling", { color : c_red, size : 1 });
		else if (inSaboPosition) draw_text_simple(x, y + 64, "READY", { color : c_red, size : 1 });
		else draw_text_simple(x, y + 64, "not ready to sabotage", { color : c_red, size : 1 });
	}
	if (state.name == "Instigate") 
	{
		if (timerInstigate < 300) && (!done) draw_text_simple(x, y + 64, "active", { color : c_red, size : 1 });
		if (done) draw_text_simple(x, y + 64, "catching breath", { color : c_red, size : 1 });
	}
	
	draw_text_simple(x, y + 128, inRoom.number, { color : c_green, size : 1 });
}