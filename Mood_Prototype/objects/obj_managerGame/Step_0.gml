//state machine
state.run();
timerState++;


//restart
if (keyboard_check_pressed(vk_f8)) room_restart();
if (keyboard_check_pressed(vk_escape)) room_goto(room_main);


//###DEBUG
global.debugtimer++;
if (keyboard_check_pressed(vk_f9)) with (OBJ_enemy) instance_destroy();
//if (keyboard_check_pressed(vk_f7)) global.envHP = 0;
if (keyboard_check_pressed(vk_f10)) 
{
	draw_set_font(Font1);
	global.debugmode = (!global.debugmode);
}