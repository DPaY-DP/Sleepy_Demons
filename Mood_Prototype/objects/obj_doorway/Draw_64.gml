if (global.debugmode)
{
	var _x = (xCenter - camX) * global.GUIScale;
	var _y = (yCenter - camY) * global.GUIScale;
	
	draw_text_simple(_x, _y, string_copy(orientation, 0, 3), { color : c_red, font : font_upheaval_scalable, size : fontscale * 5 })
}