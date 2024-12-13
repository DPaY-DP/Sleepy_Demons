if (point_distance(tunnel.xCenter, tunnel.yCenter, obj_player.x, obj_player.y) < rangeStuff)
{
	var _x = (tunnel.xCenter - camX) * global.GUIScale;
	var _y = (tunnel.yCenter - camY) * global.GUIScale;
	
	draw_sprite_simple(spr_UI_button, 3, _x, _y);
}