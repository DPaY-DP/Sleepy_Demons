//SETUP
randomize();
inputgameend = false


//IMMUTABLE VALUES
inputsRandom = [enumInput.UP, enumInput.DOWN, enumInput.LMB, enumInput.RMB, enumInput.LEFT, enumInput.RIGHT];


//GAME VALUES
inputs = [];

repeat(7)
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
			//close eye
		case enumInput.LEFT:	if (keyboard_check_pressed(ord("A"))) || (keyboard_check_pressed(vk_left)) 
								{
									audio_play_sound(snd_keyboardLeft, 0, 0, gainSFX);
									return true;
								}
		break;
		
			//close eye
		case enumInput.RIGHT:	if (keyboard_check_pressed(ord("D"))) || (keyboard_check_pressed(vk_right)) 
								{
									audio_play_sound(snd_keyboardRight, 0, 0, gainSFX);
									return true;
								}
		break;
		
			//cocoa
		case enumInput.UP:		if (keyboard_check_pressed(ord("W"))) || (keyboard_check_pressed(vk_up)) 
								{
									audio_play_sound(snd_keyboardUp, 0, 0, gainSFX);
									return true;
								}
		break;
		
			//pat
		case enumInput.DOWN:	if (keyboard_check_pressed(ord("S"))) || (keyboard_check_pressed(vk_down)) 
								{
									audio_play_sound(snd_keyboardDown, 0, 0, gainSFX);
									return true;
								}
		break;
		
			//brush
		case enumInput.LMB:		if (mouse_check_button_pressed(mb_left)) 
								{
									audio_play_sound(snd_mouseClick, 0, 0, gainSFX, 0, 1.3);
									return true;
								}
		break;
		
			//read
		case enumInput.RMB:		if (mouse_check_button_pressed(mb_right)) 
								{
									audio_play_sound(snd_mouseClick, 0, 0, gainSFX, 0, 0.7);
									return true;
								}
		break;
	}
		
	return false
}