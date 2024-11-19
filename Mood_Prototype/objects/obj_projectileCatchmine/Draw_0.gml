if (spd == 0) 
{
	var _alpha = sine_between(current_time / 1000, 2, -0.5, 0.25);

	draw_set_alpha(_alpha);
	draw_circle_color(x, y, range, c_red, c_red, false);
	draw_set_alpha(1);
}

draw_self();