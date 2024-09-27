//modes
switch (mode)
{
	case "main":
	break;
	
	case "play":		buttonheight = 0;

						draw_menu_button("Return", 8 * fontscale, function() { mode = "main" });
						var _length = array_length(global.save.levels);
						for (var i = 0; i < _length; i++)
						{
							var _name = global.save.levels[i].name;
							var _room = global.save.levels[i].room;
							global.roomTo = _room;
	
							draw_menu_button($"0{i + 1}: {_name}", 8 * fontscale, function() { room_goto(global.roomTo) }, global.save.levels[i].unlocked);
						}

						draw_text_simple(x + 30, y + 30, "Level Select", { font : font_upheaval_scalable, size : 15 * fontscale, halign : fa_left, valign : fa_top })
	break;
	
	case "settings":	buttonheight = 0;
	
						draw_menu_button("Return", 8 * fontscale, function() { mode = "main" });
						draw_menu_button("Toggle Fullscreen", 8 * fontscale, function() { obj_camera.toggle_fullscreen() });
						
						show_debug_message(fontscale)

						draw_text_simple(x + 30, y + 30, "Settings", { font : font_upheaval_scalable, size : 15 * fontscale, halign : fa_left, valign : fa_top })
	break;
}