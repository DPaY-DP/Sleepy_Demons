draw_self();

var _lengthConnected = array_length(connectedTo);
for (var i = 0; i < _lengthConnected; i++)
{
	var _color = c_black;
	if (connectedTo[i].connector.object_index == obj_tunnel) _color = #AFA010;
}

if (flood)
{
	if (floodAmount < floodMax) floodAmount += floodFactor;
}
else if (floodAmount > 0) floodAmount -= floodFactor * 2;

draw_sprite_simple(spr_roomFlooded, 0, x, y, { xscale : sprite_width / 32, yscale : sprite_height / 32, alpha : 0.5 * floodAmount });


if (global.debugmode)
{
	draw_text_simple(x + 10, y + 10 + 32 * i, connectedTo[i].room.numberRoom, { halign: fa_left, valign : fa_top, color : _color });
	draw_text_simple(x + sprite_width / 2, y + sprite_height / 2, numberRoom, { color : c_red, halign : fa_left, valign : fa_top });	
}