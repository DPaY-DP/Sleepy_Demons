mode = "main";



//methods

draw_menu_button = function(_string, _size, _function, _active = true)
{	
	var _font = font_upheaval_scalable;
	var _fontsize = _size;

	draw_set_font(_font);
	var _textwidth = string_width(_string) * _fontsize;
	var _textheight = string_height(_string) * _fontsize;

	var _x = GUIwidth * 0.95;
	var _y = GUIheight * 0.97 - buttonheight;
	
	buttonheight += _textheight + 20;
	
	if (!_active)
	{
		draw_text_simple(_x, _y, _string, { color : c_dkgray, valign : fa_bottom, halign : fa_right, font : _font, size : _fontsize });
		exit;
	}
	
	var _color = c_white;
	if (mouse_in_area_gui(_x - _textwidth, _y - _textheight, _textwidth, _textheight))
	{
		_color = c_grey;
		if (mouse_check_button_pressed(mb_left)) 
		{
			_function();
			audio_play_sound(snd_button,1,false)
		}
	}

	draw_text_simple(_x, _y, _string, { color : _color, valign : fa_bottom, halign : fa_right, font : _font, size : _fontsize });
}