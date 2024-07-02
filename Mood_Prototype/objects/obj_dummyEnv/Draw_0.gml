var _barWidth = 80;
var _barHeight = 8;
	
var x1 = x - _barWidth / 2;
var y1 = y + sprite_height;
	
var x2 = x1 + _barWidth * (hp / hpMax);
var y2 = y1 + _barHeight;
	
draw_self();
draw_rectangle_color(x1, y1, x1 + _barWidth, y2, c_grey, c_grey, c_grey, c_grey, false);
draw_rectangle_color(x1, y1, x2, y2, c_navy, c_navy, c_navy, c_navy, false);