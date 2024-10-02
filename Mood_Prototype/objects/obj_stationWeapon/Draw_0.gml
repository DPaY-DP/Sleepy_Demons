draw_self();

if (timerCollect < intervalCollect)
{
	var _barWidth = 30;
	var _barHeight = 4;
	
	var x1 = x - _barWidth / 2;
	var y1 = y + 32;
	
	var x2 = x1 + _barWidth * ((intervalCollect - timerCollect) / intervalCollect);
	var y2 = y1 + _barHeight;
	
	draw_rectangle_color(x1, y1, x2, y2, c_grey, c_grey, c_grey, c_grey, false);
	draw_rectangle_color(x1, y1, x2, y2, c_fuchsia, c_fuchsia, c_fuchsia, c_fuchsia, false);
}

draw_text(x,y,timerReuse)