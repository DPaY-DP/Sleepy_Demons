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
	draw_text_simple(x + sprite_width / 2, y + sprite_height / 2, number, { color : c_red, halign : fa_left, valign : fa_top });
	
	var _length = array_length(points);
	for (var i = 0; i < _length; i++)
	{
		draw_sprite_simple(spr_debugDot, 0, points[i].x, points[i].y, { color : c_fuchsia });
	}
}