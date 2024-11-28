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
	
	var _shufflebag = obj_loadout.reload();
	if (_shufflebag != undefined) 
	{
		var _image = 0;
		switch (obj_loadout.weaponsEquipped[_shufflebag[0]].object_index)
		{
			case obj_weaponGluelauncher:	_image = 0;
											get_size = function() { return 3 }
			break;							
											
			case obj_weaponBlackhole:		_image = 1;
											get_size = function() { return 2 }
			break;							
											
			case obj_weaponMiniyum:			_image = 2;
											get_size = function() { return 0.6 + random(0.4) }
			break;							
											
			case obj_weaponGummybear:		_image = 3;
											get_size = function() { return 3 }
			break;							
											
			case obj_weaponStinkbomb:		_image = 4;
											get_size = function() { return 3 }
			break;							
											
			case obj_weaponCatchmines:		_image = 5;
											get_size = function() { return 2 }
			break;
			
		}
		
		repeat (min(_shufflebag[1], 8)) 
		{
			instance_create_depth(x, y, depth, obj_ammoAnim, { size : get_size(), image_index : _image });
		}
	}
	
	switch_state(stateExecute);
}