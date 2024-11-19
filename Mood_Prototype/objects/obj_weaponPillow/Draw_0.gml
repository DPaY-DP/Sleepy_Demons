if (obj_loadout.weaponActive != 0) exit;

if (timerCooldown > 0)
{
	var _barWidth = 30;
	var _barHeight = 4;
	
	var x1 = x - _barWidth / 2;
	var y1 = y + 32;
	
	var x2 = x1 + _barWidth * (timerCooldown / intervalCooldown);
	var y2 = y1 + _barHeight;
	
	draw_rectangle_color(x1, y1, x2, y2, c_purple, c_purple, c_purple, c_purple, false);
}

var _barWidth = 30;
var _barHeight = 4;

var x1 = x - _barWidth / 2;
var y1 = y + 32;

var x2 = x1 + _barWidth * min((counterMeleeCharge / 30), 1);
var y2 = y1 + _barHeight;

draw_rectangle_color(x1, y1, x2, y2, c_aqua, c_aqua, c_aqua, c_aqua, false);

draw_self();

if (global.debugmode)
{
	//draw_text_simple(x, y, image_index, { color : c_fuchsia, font : font_upheaval_scalable, size : fontscale * 4 })
}