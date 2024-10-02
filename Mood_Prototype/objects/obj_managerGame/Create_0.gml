randomize();
global.envHPMax = 1000;
global.envHP = global.envHPMax;

drawEnvHP = false;
if (instance_exists(obj_env)) drawEnvHP = true;

global.debugtimer = 0;

show_debug_message($"###### {sprite_get_speed(spr_bhop)}")

global.colorsDebug = [c_red, c_yellow, c_green, c_blue, c_fuchsia, c_aqua, c_maroon, c_olive, c_lime, c_navy, c_teal, c_orange, c_purple];


draw_set_font(Font1)

//enemy behavior
global.parties = [];


//rooms
timerLoss = 0;

levelborders = undefined;


#region METHODS
get_current_level = function()
{
	var _length = array_length(global.save.levels);
	for (var i = 0; i < _length; i++)
	{
		if (room == global.save.levels[i].room) return i
	}
}
#endregion


#region METHODS
draw_minimap = function(_scale)
{
	var _mapscale = mapscale * global.GUIScale;
	
	var _offsetX = GUIwidth * 0.03;
	var _offsetY = GUIwidth * 0.03;
	
	//draw_set_color(c_fuchsia);
	//draw_set_alpha(0.6);
	//draw_rectangle(_offsetX - GUIwidth * 0.01, _offsetY - GUIwidth * 0.01, 1450 * 0.2 + GUIwidth * 0.01, mapMaxHeight + 38 + GUIwidth * 0.01, false);
	//draw_set_color(c_white);
	//draw_set_alpha(1);
	
	with (obj_doorway) 
	{
		var _x = _offsetX + x * _mapscale - other.mapLeftCompensate;
		var _y = _offsetY + y * _mapscale - other.mapTopCompensate;
		
		draw_sprite_simple(spr_doorOverlay, 0, _x, _y, { xscale : image_xscale *_mapscale, yscale : image_yscale *_mapscale });
	}
	with (obj_tunnel) 
	{
		var _x = _offsetX + x * _mapscale - other.mapLeftCompensate;
		var _y = _offsetY + y * _mapscale - other.mapTopCompensate;
		
		draw_sprite_simple(spr_tunnelOverlay, sabotaged, _x, _y, { xscale : image_xscale *_mapscale, yscale : image_yscale *_mapscale });
	}
	with (obj_room)	
	{
		var _x = _offsetX + x * _mapscale - other.mapLeftCompensate;
		var _y = _offsetY + y * _mapscale - other.mapTopCompensate;
		
		draw_sprite_simple(spr_roomOverlay, 0, _x, _y, { xscale : image_xscale *_mapscale, yscale : image_yscale *_mapscale });
		
		if (flood) draw_sprite_simple(spr_roomFlooded, 0, _x, _y, { xscale : image_xscale *_mapscale, yscale : image_yscale *_mapscale, alpha : 0.5 * floodAmount });
	}
	with (obj_env)	
	{
		var _x = _offsetX + x * _mapscale - other.mapLeftCompensate;
		var _y = _offsetY + y * _mapscale - other.mapTopCompensate;
		
		draw_sprite_simple(spr_envOverlay, image_index, _x, _y, { xscale : image_xscale *_mapscale, yscale : image_yscale *_mapscale })
	}
	with (obj_gunPickup)
	{
		var _x = _offsetX + x * _mapscale - other.mapLeftCompensate;
		var _y = _offsetY + y * _mapscale - other.mapTopCompensate;
		
		draw_sprite_simple(spr_gunOverlay, image_index, _x, _y, { xscale : image_xscale *_mapscale, yscale : image_yscale *_mapscale })
	}
}

draw_hpbar = function()
{
	var _factorHP = (global.envHP / global.envHPMax);
	
	var _maxHeight = (GUIheight * 0.94);
	var _height = _maxHeight * _factorHP;
	if (_height < 0) _height = 0;
	var _barX = GUIwidth * 0.96;
	var _barY = GUIheight * 0.03;
	var _width = GUIwidth * 0.02;

	draw_set_color(c_green);
	if (global.envHP > 0) draw_rectangle(_barX, _barY + _maxHeight - _height, _barX + _width, _barY + _maxHeight, false);
	draw_set_color(c_white);
}

#endregion

//states
setup_state_machine();

stateGame = new State();
stateGame.start = function()
{
	currentLevel = get_current_level();
	show_debug_message(currentLevel)
}
stateGame.run = function()
{
	if (global.envHP <= 0) switch_state(stateLoss);
	
	if (!instance_exists(OBJ_enemy)) switch_state(stateWin);
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
}
stateLoss.run = function()
{
	
}
stateLoss.drawGUI = function()
{
	draw_sprite_simple(spr_window, 0, GUIwidth * 0.05, GUIheight * 0.05, { xscale : GUIwidth * 0.9, yscale : GUIheight * 0.9, alpha : 0.5 });
	
	if (timerState <= sprite_get_number(spr_bhop) * get_animation_framelength(spr_bhop)) 
	{
		var _frame = get_animation_frame(spr_bhop, timerState);
		draw_sprite_simple(spr_bhop, _frame, GUIwidth / 2, GUIheight / 2, { size : 4 });
	}

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
	with (OBJ_agents) switch_state(stateLock);
	
	if (currentLevel < array_length(global.save.levels) - 1) 
	{
		global.save.levels[currentLevel + 1].unlocked = true;
		obj_data.write_save();
	}
}
stateWin.run = function()
{
	if (keyboard_check_pressed(vk_space)) 
	{
		var _length = array_length(global.save.levels)
		if (currentLevel < _length - 1) room_goto(global.save.levels[currentLevel + 1].room)
		else room_goto(room_credits);
		
		switch_state(stateGame);
	}
}
stateWin.drawGUI = function()
{
	draw_sprite_simple(spr_window, 0, GUIwidth * 0.05, GUIheight * 0.05, { xscale : GUIwidth * 0.9, yscale : GUIheight * 0.9, alpha : 0.5 });

	draw_text_simple(GUIwidth * 0.5, GUIheight * 0.15, "Snooze'd em up!", { color : c_white, font : font_upheaval_scalable, size : 12 * fontscale });
	if (timerState > 90) draw_text_simple(GUIwidth * 0.5, GUIheight * 0.85, "Press SPACE to enter the next level\nPress ESC to return to Menu", { color : c_white, font : font_upheaval_scalable, size : 6 * fontscale });
}

initialize_state(stateGame);

alarm[0] = 1;