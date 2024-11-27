draw_self();

if	(broken) && 
	(array_length(POIsBroken) == 0) &&
	(point_distance(x, y, obj_player.x, obj_player.y) < distInteract) &&
	(obj_player.inRoom == inRoom)
{
	draw_sprite_simple(spr_UI_button, 1, x, y, { size : 0.8 });
}

//DEBUG
if (global.debugmode)
{
	var _length = array_length(pointsSabo);
	for (var i = 0; i < _length; i++)
	{
		var _color = c_lime;
		if (pointsSabo[i][1] != 0) _color = c_green;
		draw_sprite_simple(spr_debugDot, 0, pointsSabo[i][0].x, pointsSabo[i][0].y, { color : _color });
	}
}