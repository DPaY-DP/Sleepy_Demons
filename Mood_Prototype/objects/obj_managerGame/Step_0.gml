//state machine
state.run();
timerState++;


//restart


//###DEBUG
global.debugtimer++;

//if (keyboard_check_pressed(vk_f10)) global.debugmode = !global.debugmode;
if (global.debugmode)
{
	if (keyboard_check_pressed(vk_f9)) with (OBJ_enemy) instance_destroy();
	if (keyboard_check_pressed(vk_f8)) global.envHP += 1000;
}