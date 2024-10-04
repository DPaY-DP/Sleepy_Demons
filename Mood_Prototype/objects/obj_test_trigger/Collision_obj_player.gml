
	instance_activate_layer("Rooms_1");
	instance_deactivate_layer("Walls");
	instance_activate_layer("Walls_1");
	instance_activate_layer("More_Doors");
	instance_activate_layer("Enemies_1");
	instance_activate_layer("Doors_Sprites");
	show_debug_message("drückeberger");
	audio_play_sound_at(snd_foundTeddySecret, x, y, 0, 100, 150, 1, 0, false, .5)
	instance_destroy();
	
	with (OBJ_enemy) switch_state(lastState);
	obj_weapon.canShoot = true;


