//state machine
state.run();
timerState++;


//###DEBUG
global.debugtimer++;
if (keyboard_check_pressed(vk_escape)) room_goto(room_main);
if (keyboard_check_pressed(ord("R"))) 
{
	room_restart();
	global.countRooms = 0;
	global.countEnv = 0;
}
if (keyboard_check_pressed(vk_f9)) with (OBJ_enemy) instance_destroy();
if (keyboard_check_pressed(vk_f7)) global.envHP = 0;
if (keyboard_check_pressed(vk_f10)) 
{
	draw_set_font(Font1);
	global.debugmode = (!global.debugmode);
}