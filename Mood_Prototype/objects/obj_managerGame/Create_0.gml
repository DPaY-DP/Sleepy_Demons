randomize();
global.envHPMax = 1000;
global.envHP = global.envHPMax;

drawEnvHP = false;
if (instance_exists(obj_env)) drawEnvHP = true;

global.debugtimer = 0;

show_debug_message($"###### {sprite_get_speed(spr_bhop)}")

global.colorsDebug = [c_red, c_yellow, c_green, c_blue, c_fuchsia, c_aqua, c_maroon, c_olive, c_lime, c_navy, c_teal, c_orange, c_purple];


//DEBUG
global.debugmode = 0;

draw_set_font(Font1)

//enemy behavior
global.parties = [];


//rooms
timerLoss = 0;


#region METHODS
draw_minimap = function(_scale)
{
	var _scaleMinimap = _scale;
	
	var _offsetX = GUIWidth * 0.02 - 128 * _scaleMinimap;
	var _offsetY = GUIHeight * 0.02 - 96 * _scaleMinimap;
	
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
	var _width = (GUIWidth * 0.76) * (global.envHP / global.envHPMax);
	if (_width < 0) _width = 0;
	var _barX = GUIWidth * 0.22;

	draw_set_color(c_green);
	if (global.envHP > 0) draw_rectangle(_barX, GUIHeight * 0.02, _barX + _width, GUIHeight * 0.1, false);
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
	draw_sprite_simple(spr_window, 0, GUIWidth * 0.05, GUIHeight * 0.05, { xscale : GUIWidth * 0.9, yscale : GUIHeight * 0.9, alpha : 0.5 });
	
	if (timerState <= sprite_get_number(spr_bhop) * get_animation_framelength(spr_bhop)) 
	{
		var _frame = get_animation_frame(spr_bhop, timerState);
		draw_sprite_simple(spr_bhop, _frame, GUIWidth / 2, GUIHeight / 2, { size : 4 });
	}

	draw_text_simple(GUIWidth * 0.5, GUIHeight * 0.15, "Ya dun goof'd!", { size : 1, color : c_white, font : font_menu });
	if (timerState > 120) draw_text_simple(GUIWidth * 0.5, GUIHeight * 0.85, "Press R to restart.", { size : 1, color : c_white, font : font_menu_small });
}


stateWin = new State();
stateWin.start = function()
{
	with (OBJ_agents) switch_state(stateLock);
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
	draw_sprite_simple(spr_window, 0, GUIWidth * 0.05, GUIHeight * 0.05, { xscale : GUIWidth * 0.9, yscale : GUIHeight * 0.9, alpha : 0.5 });

	draw_text_simple(GUIWidth * 0.5, GUIHeight * 0.15, "Yo'rue a gamer B)))", { size : 1, color : c_white, font : font_menu });
	if (timerState > 120) draw_text_simple(GUIWidth * 0.5, GUIHeight * 0.85, "Press Space for Next Lervel :oo", { size : 1, color : c_white, font : font_menu_small });
}

initialize_state(stateGame);