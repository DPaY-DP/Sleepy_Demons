event_inherited();

//methods
toggle_sabotaged = function(_true_or_false)
{
	sabotaged = _true_or_false;
	
	with (OBJ_enemy) if (state.name == "Walk")
	{
		switch (intent)
		{
			case "sabotage": initialize_state(stateSeek);
			break;
			
			case "random": initialize_state(stateRandomTarget);
			break;
			
			case "recover": initialize_state(stateFlee);
			break;
			
			case "instigate": initialize_state(stateSeek);
			break;
		}
	}
}


//states
setup_state_machine();


stateIdle = new State();
stateIdle.start = function()
{
}
stateIdle.run = function()
{
	if (point_distance(xCenter, yCenter, obj_player.x, obj_player.y) < 120)
	if (sabotaged) && (keyMelee) && (!instance_exists(obj_managerMinigame))
	{
		toggle_sabotaged(false);
		instance_create_layer(obj_player.x, obj_player.y, "Player", obj_weaponPillow)
	}
}
stateIdle.draw = function()
{
	if (sabotaged) && (point_distance(xCenter, yCenter, obj_player.x, obj_player.y) < 120) draw_sprite_simple(spr_UI_button, 3, xCenter, yCenter);
	
	image_index = sabotaged;
}
stateIdle.stop = function()
{
	
}

initialize_state(stateIdle);