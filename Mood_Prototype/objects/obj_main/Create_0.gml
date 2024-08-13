mode = "main";

levels =
[
	{
		room : room_tutorial_executie,
		name : "00: Executie",
	},
	{
		room : room_tutorial_melee,
		name : "01: Melee",
	},
	{
		room : room_tutorial_gun,
		name : "02: Gun",
	},
	{
		room : room_tutorial_gun_trigger,
		name : "03: Trigger",
	},
	{
		room : room_tutorial_big_room,
		name : "04: Big Room",
	},
	{
		room : room_tutorial_big_room_with_env,
		name : "05: Big Room + Env",
	},
	{
		room : room_tutorial_tunnel,
		name : "06: Tunnel",
	},
]



//methods

draw_menu_button = function(_string, _size, _function)
{	
	var _font = font_upheaval_scalable;
	var _fontsize = _size;

	draw_set_font(_font);
	var _textwidth = string_width(_string) * _fontsize;
	var _textheight = string_height(_string) * _fontsize * 0.8;

show_debug_message(buttonheight)

	var _x = GUIwidth * 0.95;
	var _y = GUIheight * 0.97 - buttonheight;
	
	buttonheight += _textheight + 20;
	
	var _color = c_white;
	if (mouse_in_area_gui(_x - _textwidth, _y - _textheight, _textwidth, _textheight))
	{
		_color = c_grey;
		if (mouse_check_button_pressed(mb_left)) _function();
	}

	draw_text_simple(_x, _y, _string, { color : _color, valign : fa_bottom, halign : fa_right, font : _font, size : _fontsize });
}