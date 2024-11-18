draw_self();

var _lengthConnected = array_length(doors);
for (var i = 0; i < _lengthConnected; i++)
{
	var _color = c_black;
	if (doors[i].object.object_index == obj_tunnel) _color = #AFA010;
}

if (flood)
{
	if (floodAmount < floodMax) floodAmount += floodFactor;
}
else if (floodAmount > 0) floodAmount -= floodFactor * 2;

draw_sprite_simple(spr_roomFlooded, 0, x, y, { xscale : sprite_width / 32, yscale : sprite_height / 32, alpha : 0.5 * floodAmount });

	
if (global.debugmode)
{
	var _color = c_lime;
	//var _color = global.colorsDebug[number];
	
	var _number = number;
	//if (conjoined) _number = string(number) + "*";
	
	draw_text_simple(x + sprite_width / 2, y + sprite_height / 2, _number, { color : _color, halign : fa_left, valign : fa_top, font : font_upheaval_scalable, size : fontscale * 5 });
	
	if (mouse_on_me()) && (mouse_check_button_pressed(mb_left)) showDots = !showDots;
	if (!showDots) exit;
	
	var _length = array_length(points);
			//show_debug_message(points);
	for (var i = 0; i < _length; i++)
	{
		if (i > 0) _color = c_fuchsia;
		if (i > 4) _color = c_yellow;
		draw_sprite_simple(spr_debugDot, 0, points[i].x, points[i].y, { color : _color });
	}
}