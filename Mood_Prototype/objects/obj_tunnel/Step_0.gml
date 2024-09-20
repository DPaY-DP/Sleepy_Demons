timerState++;
state.run();

if (keyboard_check_pressed(vk_f8)) 
{
	toggle_sabotaged(!sabotaged);
}