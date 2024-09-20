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


#region METHODS
draw_minimap = function(_scale)
{
	var _scaleMinimap = _scale;
	
	var _offsetX = GUIwidth * 0.02 - 128 * _scaleMinimap;
	var _offsetY = GUIheight * 0.02 - 96 * _scaleMinimap;
	
	with (obj_doorway) draw_sprite_simple(spr_doorOverlay, 0, _offsetX + x * _scaleMinimap, _offsetY + y * _scaleMinimap, { xscale : image_xscale * _scaleMinimap, yscale : image_yscale * _scaleMinimap })
	with (obj_tunnel) 
	{
		draw_sprite_simple(spr_tunnelOverlay, sabotaged, _offsetX + x * _scaleMinimap, _offsetY + y * _scaleMinimap, { xscale : image_xscale * _scaleMinimap, yscale : image_yscale * _scaleMinimap });
	}
	with (obj_room)	
	{
		draw_sprite_simple(spr_roomOverlay, 0, _offsetX + x * _scaleMinimap, _offsetY + y * _scaleMinimap, { xscale : image_xscale * _scaleMinimap, yscale : image_yscale * _scaleMinimap });
		
		if (flood) draw_sprite_simple(spr_roomFlooded, 0, _offsetX + x * _scaleMinimap, _offsetY + y * _scaleMinimap, { xscale : image_xscale * _scaleMinimap, yscale : image_yscale * _scaleMinimap, alpha : 0.5 * floodAmount });
	}
	with (obj_env)	
	{
		draw_sprite_simple(spr_envOverlay, image_index, _offsetX + x * _scaleMinimap, _offsetY + y * _scaleMinimap, { xscale : image_xscale * _scaleMinimap, yscale : image_yscale * _scaleMinimap })
	}
	with (obj_gunPickup)
	{
		draw_sprite_simple(spr_gunOverlay, image_index, _offsetX + x * _scaleMinimap, _offsetY + y * _scaleMinimap, { xscale : image_xscale * _scaleMinimap, yscale : image_yscale * _scaleMinimap })
	}
}

draw_hpbar = function()
{
	var _width = (GUIwidth * 0.76) * (global.envHP / global.envHPMax);
	if (_width < 0) _width = 0;
	var _barX = GUIwidth * 0.22;

	draw_set_color(c_green);
	if (global.envHP > 0) draw_rectangle(_barX, GUIheight * 0.02, _barX + _width, GUIheight * 0.1, false);
	draw_set_color(c_white);
}

#endregion

//states
setup_state_machine();

stateGame = new State();
stateGame.run = function()
{
	if (global.envHP <= 0) switch_state(stateLoss);
	
	if (!instance_exists(OBJ_enemy)) switch_state(stateWin);
}
stateGame.drawGUI = function()
{
	if (drawEnvHP) draw_hpbar();
	//draw_minimap(0.2);
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
	
	var _length = array_length(global.save.levels);
	for (var i = 0; i < _length; i++)
	{
		if	(i < _length - 1) &&
			(room = global.save.levels[i].room)
		{
			global.save.levels[i + 1].unlocked = true;
			obj_data.write_save();
			break;
		}
	}
}
stateWin.run = function()
{
	if (keyboard_check_pressed(vk_space)) 
	{
		room_goto_next();
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