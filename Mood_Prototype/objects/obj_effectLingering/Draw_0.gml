draw_set_color(#EE779D);
draw_circle(x, y, area / 2, false);
draw_set_color(c_white);

draw_set_alpha((timerPulse / intervalPulse) / 2);
draw_circle(x, y, area / 2, false);
draw_set_alpha(1);