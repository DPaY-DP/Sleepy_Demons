buttonheight = 0;

var _length = array_length(levels);
for (var i = 0; i < _length; i++)
{
	var _name = levels[i].name;
	var _room = levels[i].room;
	global.roomTo = levels[i].room;
	
	draw_menu_button(_name, 0.5, function() {room_goto(global.roomTo)});
	
	show_debug_message(i)
}

draw_text_simple(x + 30, y + 30, "Main Menu for\nselecting levels and such", { size : 1, halign : fa_left, valign : fa_top })