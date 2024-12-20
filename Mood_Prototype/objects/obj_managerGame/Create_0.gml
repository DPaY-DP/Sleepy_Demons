//IMMUTABLE VALUES
global.envHPMax = 1000;
if (room == room_shootingRange) global.envHPMax = infinity;

image_speed = 0.1;


//GAME VALUES
global.envHP = global.envHPMax;

drawEnvHP = false;
if (instance_exists(OBJ_env)) drawEnvHP = true;


currentSong = choose(snd_musicLevel1, snd_musicLevel2);
audio_play_sound(currentSong,1,false, gainMusic);

mapAlpha = 0;
alarm[0] = 1;


global.debugtimer = 0;
global.colorsDebug = [c_red, c_yellow, c_green, c_blue, c_fuchsia, c_aqua, c_maroon, c_olive, c_lime, c_navy, c_teal, c_orange, c_purple];



//SETUP AND SPAWNING
randomize();


#region METHODS
get_current_level = function()
{
	var _length = array_length(global.save.levels);
	for (var i = 0; i < _length; i++)
	{
		if (room == global.save.levels[i].room) return i
	}
}

draw_minimap = function(_scale)
{
	if (instance_exists(obj_managerMinigame)) exit;
	
	var _mapscale = mapscale * global.GUIScale;
	
	var _offsetX = GUIwidth * 0.03;
	var _offsetY = GUIwidth * 0.03;
	
	if (obj_player.x < camX + 300) && (obj_player.y < camY + 300)
	{
		if (mapAlpha > 0) mapAlpha -= 0.025;
	}
	else if (mapAlpha < 1) mapAlpha += 0.025;
	
	with (obj_doorway) 
	{
		var _x = _offsetX + x * _mapscale - other.mapLeftCompensate;
		var _y = _offsetY + y * _mapscale - other.mapTopCompensate;
		
		draw_sprite_simple(spr_doorOverlay, 0, _x, _y, { alpha : other.mapAlpha, xscale : image_xscale *_mapscale, yscale : image_yscale *_mapscale });
	}
	with (obj_tunnel) 
	{
		var _x = _offsetX + x * _mapscale - other.mapLeftCompensate;
		var _y = _offsetY + y * _mapscale - other.mapTopCompensate;
		
		draw_sprite_simple(spr_tunnelOverlay, sabotaged, _x, _y, { alpha : other.mapAlpha, xscale : image_xscale *_mapscale, yscale : image_yscale *_mapscale });
	}
	with (obj_room)	
	{
		var _x = _offsetX + x * _mapscale - other.mapLeftCompensate;
		var _y = _offsetY + y * _mapscale - other.mapTopCompensate;
		
		draw_sprite_simple(spr_roomOverlay, 0, _x, _y, { alpha : other.mapAlpha, xscale : image_xscale *_mapscale, yscale : image_yscale *_mapscale });
		
		if (flood) draw_sprite_simple(spr_roomFlooded, 0, _x, _y, { xscale : image_xscale *_mapscale, yscale : image_yscale *_mapscale, alpha : 0.5 * floodAmount });
	}
	with (OBJ_env)	
	{
		var _x = _offsetX + x * _mapscale - other.mapLeftCompensate;
		var _y = _offsetY + y * _mapscale - other.mapTopCompensate;
		
		draw_sprite_simple(spr_envOverlay, image_index, _x, _y, { alpha : other.mapAlpha, xscale : image_xscale *_mapscale, yscale : image_yscale *_mapscale })
	}
}

draw_hpbar = function()
{
	var _factorHP = (global.envHP / global.envHPMax);
	var _size = 1;
	
	draw_sprite_simple(spr_hpbar, 0, GUIwidth / 2, 0);
	draw_sprite_simple(spr_hpbarFilled, 0, GUIwidth / 2, 0, { xscale : 0.22 + 0.78 * _factorHP });
	draw_sprite_simple(spr_hpbarFace, (sprite_get_number(spr_hpbarFace)) - (sprite_get_number(spr_hpbarFace)) * _factorHP, GUIwidth / 2, 0, { size : 1.1 });
}
#endregion


//states
setup_state_machine();

stateGame = new State();
stateGame.start = function()
{
	currentLevel = get_current_level();
	
	arrayMinigames = array_shuffle(ds_clone(global.save.levels[currentLevel].minigames));
	
	timeStart = current_time;
}
stateGame.run = function()
{
	if (global.envHP <= 0) switch_state(stateLoss);
	
	if (!audio_is_playing(currentSong))
	{
		currentSong = choose(snd_musicLevel1, snd_musicLevel2);
		audio_play_sound(currentSong,1,false, gainMusic);
	}
	
	if (!instance_exists(OBJ_enemy) && !instance_exists(obj_tutorialDummy))
	{
		switch_state(stateWin);
	}
}
stateGame.drawGUI = function()
{
	if (drawEnvHP) draw_hpbar();
	draw_minimap(0.3);
}


stateLoss = new State();
stateLoss.start = function()
{
	with (OBJ_agents) switch_state(stateLock);
	audio_stop_sound(currentSong);
	
	image_index = 0;
}
stateLoss.run = function()
{
	
}
stateLoss.drawGUI = function()
{
	draw_sprite_simple(spr_window, 0, GUIwidth * 0.05, GUIheight * 0.05, { xscale : GUIwidth * 0.9, yscale : GUIheight * 0.9, alpha : 0.5 });
	
	draw_sprite_simple(spr_bhop, -1, GUIwidth / 2, GUIheight / 2, { size : 3 });
	if (image_index > 18) image_index = 18;

	draw_text_simple(GUIwidth * 0.5, GUIheight * 0.15, "Chaos unfolds", { color : c_white, font : font_upheaval_scalable, size : 12 * fontscale });
	if (timerState > 120) draw_text_simple(GUIwidth * 0.5, GUIheight * 0.85, "Press R to restart.", { color : c_white, font : font_upheaval_scalable, size : 6 * fontscale });
	
	if (keyboard_check_pressed(ord("R"))) 
	{
		room_restart();
		global.countRooms = 0;
		global.countEnv = 0;
	}
}


stateWin = new State();
stateWin.start = function()
{
	audio_stop_sound(currentSong);
	
	with (OBJ_agents) switch_state(stateLock);
	
	unlockEvent = [];
	displayUnlock = 0;
	
	var _levelData = global.save.levels[currentLevel];
	
	 newBest = false;
	_levelData.completed = true;
	timeFinish = current_time - timeStart;
	show_debug_message($"timeFinish: {timeFinish}; _levelData: {_levelData.time}")
	if (timeFinish < _levelData.time) 
	{
		if (_levelData.time != infinity) newBest = true;
		
		_levelData.time = timeFinish;
	}
	
	var _length = array_length(_levelData.weaponUnlocks);
	for (var i = 0; i < _length; i++)
	{
		//if (currentLevel < array_length(global.save.levels) - 1)			//is there another level after this one?
		//if (!global.save.levels[currentLevel + 1].unlocked)					//do we have that unlocked? If NO, show unlocked weapons
		//																	// >> this is a hacky fix, but essentially it's meant to prevent the unlock
		//																	// weapons from unlocking again after you have already unlocked them previously
		//																	// >> better would be to check for the unlock status of each weapon directly, 
		//																	// but actually fuck that right now (I should have set it up as an ID based item
		//																	// system from the start, but we wont continue development on this prototype and
		//																	// it works.)
		//array_push(unlockEvent, obj_data.unlock_weapon(_levelData.weaponUnlocks[i]));
		
		var _unlock = array_shift(_levelData.weaponUnlocks);
		array_push(unlockEvent, obj_data.unlock_weapon(_unlock));
	}
	
	if (currentLevel < array_length(global.save.levels) - 1) 
	{
		global.save.levels[currentLevel + 1].unlocked = true;
		if (currentLevel == 8) global.save.levels[0].unlocked = true;		//this unlocks the firing range
	}
	
	obj_data.write_save();
}
stateWin.run = function()
{
	var _length = array_length(unlockEvent);
	if (keyboard_check_pressed(vk_space)) 
	{
		if (displayUnlock >= _length)
		{
			var _length = array_length(global.save.levels);
			if (currentLevel < _length - 1) 
			{
				global.roomTo = global.save.levels[currentLevel + 1].room;
				room_goto(room_loadout);
			}
			else room_goto(room_credits);
		
			switch_state(stateGame);
		}
		else displayUnlock++;
	}
	
	if (mouse_check_button_pressed(mb_left)) displayUnlock++;
}
stateWin.drawGUI = function()
{
		//BASIC WIN UI
	draw_sprite_simple(spr_window, 0, GUIwidth * 0.05, GUIheight * 0.05, { xscale : GUIwidth * 0.9, yscale : GUIheight * 0.9, alpha : 0.5 });
	draw_text_simple(GUIwidth * 0.5, GUIheight * 0.15, "Snooze'd em up!", { color : c_white, font : font_upheaval_scalable, size : 12 * fontscale });
	if (timerState > 45) draw_text_simple(GUIwidth * 0.5, GUIheight * 0.5, $"{timeFinish / 1000} seconds", { color : c_white, font : font_upheaval_scalable, size : 10 * fontscale });
	if (timerState > 60) && (newBest) draw_text_simple(GUIwidth * 0.5, GUIheight * 0.45, $"NEW BEST!", { color : c_white, font : font_upheaval_scalable, size : 5 * fontscale });
	if (timerState > 90) draw_text_simple(GUIwidth * 0.5, GUIheight * 0.85, "Press SPACE to enter the next level\nPress ESC to return to Menu", { color : c_white, font : font_upheaval_scalable, size : 6 * fontscale });
	
		//WEAPON UNLOCK EVENT logic
	var _length = array_length(unlockEvent);
	if (displayUnlock < _length)
	{	
		var _width = GUIwidth * 0.6 / 135;
		var _height = GUIheight * 0.55 / 135;
		
		draw_sprite_simple(spr_frameSlim, 0, GUIwidth / 2, GUIheight / 2, { xscale : _width, yscale : _height });
		
		var _data = unlockEvent[displayUnlock];
		draw_text_simple(GUIwidth * 0.5, GUIheight * 0.3, "Weapons Unlocked:\n" + _data[2], { color : c_white, font : font_upheaval_scalable, size : 4 * fontscale });
		draw_sprite_simple(_data[0], _data[1], GUIwidth * 0.5, GUIheight * 0.46, { size : global.GUIScale * 3 });
		draw_text_simple(GUIwidth * 0.25, GUIheight * 0.68, _data[3], { color : c_white, font : font_upheaval_scalable, size : 4 * fontscale, halign : fa_left });
	}
}

initialize_state(stateGame);