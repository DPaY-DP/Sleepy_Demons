if (global.debugmode)
{
	var _length = array_length(navmesh);
	for (var i = 0; i < _length; i++)
	{
		var _x = (navmesh[i].x - camX) * global.GUIScale;
		var _y = (navmesh[i].y - camY) * global.GUIScale;
	
		var _color = c_red;
		if (name == "guenther") _color = c_purple;
	
		draw_sprite_simple(spr_debugDot, 1, _x, _y, { color : _color });
	}
}