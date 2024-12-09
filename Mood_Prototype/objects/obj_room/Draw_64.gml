if (global.debugmode)
{
	var _color = c_lime;
	//var _color = global.colorsDebug[number];
	
	var _number = number;
	//if (conjoined) _number = string(number) + "*";
	
	draw_text_simple((xCenter - camX) * global.GUIScale, (yCenter - camY) * global.GUIScale, _number, { color : _color, halign : fa_left, valign : fa_top, font : font_upheaval_scalable, size : fontscale * 5 });
	
	if (mouse_on_me()) && (mouse_check_button_pressed(mb_left)) showDots = !showDots;
	if (!showDots) exit;
	
	var _length = array_length(points);
			//show_debug_message(points);
	for (var i = 0; i < _length; i++)
	{
		if (i > 0) _color = c_fuchsia;
		if (i > 4) _color = c_yellow;
		
		var _x = (points[i].x - camX) * global.GUIScale;
		var _y = (points[i].y - camY) * global.GUIScale;
		
		draw_sprite_simple(spr_debugDot, 0, _x, _y, { color : _color });
	}
}