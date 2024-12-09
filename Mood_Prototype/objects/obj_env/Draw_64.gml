//DEBUG
if (global.debugmode)
{
	var _length = array_length(pointsSabo);
	for (var i = 0; i < _length; i++)
	{
		var _color = c_lime;
		if (pointsSabo[i][1] != 0) _color = c_green;
		
		var _x = (pointsSabo[i][0].x - camX) * global.GUIScale;
		var _y = (pointsSabo[i][0].y - camY) * global.GUIScale;
		
		draw_sprite_simple(spr_debugDot, 0, _x, _y, { color : _color });
	}
		
	var _x = (x - camX) * global.GUIScale;
	var _y = (y - camY + 16) * global.GUIScale;
	
	draw_text_simple(_x, _y, inRoom.number, { color : c_red })
}