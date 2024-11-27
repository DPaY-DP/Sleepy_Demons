//unique values
sprite_index = spr_pablo;

event_inherited();

hp = 0;
hpLast = 0;

intervalRecoverExecute = infinity;

initialize_state(stateExecute);

//stateExecute = new State("Execute");
//stateExecute.start = function()
//{
//}
//stateExecute.run = function()
//{	
//	if	(point_distance(x, y, obj_player.x, obj_player.y) < 40) &&
//	(obj_player.inRoom == inRoom)
//	{
//		if (keyExecute) && (!instance_exists(obj_managerMinigame))
//		{
//			instance_create_layer(x, y, "Overlay", obj_managerMinigame, { enemy : id, game : "finisher" });
//		}
//	}
//}
//stateExecute.draw = function()
//{
//	if	(point_distance(x, y, obj_player.x, obj_player.y) < 40) &&
//		(obj_player.inRoom == inRoom)
//	{
//		if (!instance_exists(obj_managerMinigame)) draw_sprite_simple(spr_UI_button, 0, x, y - 16, { size : 0.8 });
//	}
//}

stateSleep = new State("Sleep");
stateSleep.start = function()
{
	audio_play_sound_at(array_get(sleepSounds, random_range(0,array_length(sleepSounds))), x, y, 0, 100, 150, 1, 0, false, gainSFX);
	
	obj_loadout.reload();
	
	switch_state(stateExecute);
}