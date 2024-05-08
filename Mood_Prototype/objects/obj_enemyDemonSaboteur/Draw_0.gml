draw_self();

state.run();
timerState++;

var _scale = 5;
var _border = 5;

var _xLeft = x - hpMax * _scale / 2 - _border;
var _xRight = x + hpMax * _scale / 2 + _border;

draw_rectangle(	_xLeft, y - 40, 
				_xRight, y - 20, 1);
draw_rectangle_colour(	_xLeft + _border, y - 35, 
						_xLeft + _border + hp * _scale, y - 25, 
						$FF05E1FF & $FFFFFF, $FFFFFF & $FFFFFF, $FFFFFF & $FFFFFF, $FF05E1FF & $FFFFFF, 0);