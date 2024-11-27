//state machine
state.run();
timerState++;


//restart
if (keyboard_check_pressed(vk_f8)) room_restart();
if (keyboard_check_pressed(vk_escape)) 
{
	audio_stop_sound(currentSong);
	room_goto(room_main);
}


//###DEBUG
global.debugtimer++;
if (keyboard_check_pressed(vk_f9)) with (OBJ_enemy) instance_destroy();
if (keyboard_check_pressed(vk_f10)) global.debugmode = 1;
if (keyboard_check(vk_f7)) global.envHP -= 10;