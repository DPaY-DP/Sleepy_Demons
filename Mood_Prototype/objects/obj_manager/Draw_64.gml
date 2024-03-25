if (room != room_win) && (room != room_lose)
{
	timerGamesecond++;
	if (timerGamesecond >= durationGamesecond)
	{
		timerGame--;
		if (timerGame <= 0)
		{
			room_goto(room_lose)
		}
		{
			timerGamesecond = 0;
		
			if (timerGame > gracePeriod) durationGamesecond = 60;
			else durationGamesecond = 60 * graceExtension;
		}
	}
}

if (!instance_exists(OBJ_enemy))
{
	with (obj_gate)
	{
		if (instance_exists(wall)) instance_destroy(wall);
		if (place_meeting(x, y, obj_player)) 
		{
			global.finaltime = obj_manager.durationGame - obj_manager.timerGame;
			room_goto_next();
		
			draw_set_valign(fa_middle);
			draw_set_halign(fa_center);
		}
	}
	
	draw_text_transformed(20, 20, $"Time: {timerGame} (Get to the gate!)", 2, 2, 0);
}
else draw_text_transformed(20, 20, $"Time: {timerGame}", 2, 2, 0);


if (room == room_win) draw_text_transformed(room_width, room_height * 1.5, $"Your time: {global.finaltime}", 4, 4, 0);


//###DEBUG
if (keyboard_check_pressed(vk_escape)) game_end();
if (keyboard_check_pressed(ord("R"))) game_restart();
if (keyboard_check_pressed(vk_f9)) with (OBJ_enemy) instance_destroy();