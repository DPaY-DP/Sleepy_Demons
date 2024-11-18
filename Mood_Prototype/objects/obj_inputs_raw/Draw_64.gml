var _entries = array_length(inputs);

var _offsetFrame = 64;
var _offsetStart = _offsetFrame * _entries / 2;

for (var i = 0; i < _entries; i++)
{
	var _x = GUIwidth / 2 - _offsetStart + _offsetFrame * i;
	var _y = GUIheight * 0.75;
	
	var _frame = 0;
	if (i == position) _frame = 1;
	else if (i < position) _frame = 2;
	
	draw_sprite_simple(spr_inputFrame, _frame, _x, _y);
	draw_sprite_simple(spr_input, inputs[i], _x, _y);
}

//if (keyboard_check_pressed(vk_anykey)) || (mouse_check_button_pressed(mb_any))
if (evaluate_input(inputs[position]))
{
	show_debug_message($"pos: {position}; length: {array_length(inputs)}")
	if (position == array_length(inputs) - 1) 
	{
		inputgameend = true
		show_debug_message("TRUEEEEEEEE")
	}
	else position++;
}