draw_set_color(c_black);
draw_circle(x, y, range * factorCircle, true);
draw_set_color(c_white);

factorCircle -= factorFactorCircle;
if (factorCircle == 0) factorCircle = factorCircleBase;

draw_self();