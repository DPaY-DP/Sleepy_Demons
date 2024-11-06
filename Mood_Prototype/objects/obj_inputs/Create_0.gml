//SETUP
randomize();
inputgameend = false


//IMMUTABLE VALUES
enum enumInput
{
	LEFT,
	RIGHT,
	UP,
	DOWN,
	LMB,
	RMB,
}

inputsMandatory = [enumInput.LEFT, enumInput.RIGHT];
inputsRandom = [enumInput.UP, enumInput.DOWN, enumInput.LMB, enumInput.RMB];


//GAME VALUES
inputs = [];
array_push(inputs, array_shift(inputsMandatory));
array_push(inputs, array_shift(inputsMandatory));

repeat(3)
{
	array_push(inputs, array_choose(inputsRandom));
}

inputs = array_shuffle(inputs);

position = 0;
validation = array_create(array_length(inputs), 0);


//METHOD
evaluate_input = function(_input)
{
	switch (_input)
	{
		case enumInput.LEFT:	if (keyboard_check_pressed(ord("A"))) || (keyboard_check_pressed(vk_left)) return true;
		break;
		
		case enumInput.RIGHT:	if (keyboard_check_pressed(ord("D"))) || (keyboard_check_pressed(vk_right)) return true;	
		break;
		
		case enumInput.UP:		if (keyboard_check_pressed(ord("W"))) || (keyboard_check_pressed(vk_up)) return true;
		break;
		
		case enumInput.DOWN:	if (keyboard_check_pressed(ord("S"))) || (keyboard_check_pressed(vk_down)) return true;	
		break;
		
		case enumInput.LMB:		if (mouse_check_button_pressed(mb_left)) return true;
		break;
		
		case enumInput.RMB:		if (mouse_check_button_pressed(mb_right)) return true;
		break;
	}
		
	return false
}