function draw_debug(stringDisplay)
{
	var _x = x;
	var _y = y;
	var _size = 1;
	
	var i = 1;
	if (argument[i] != undefined) _x += argument[i];
	if (argument[i + 1] != undefined) _y += argument[i + 1];
	if (argument[i + 2] != undefined) _size = argument[i + 2];
	
	draw_text_simple(_x, _y, stringDisplay, { size : 4 * _size, color : c_red });
}