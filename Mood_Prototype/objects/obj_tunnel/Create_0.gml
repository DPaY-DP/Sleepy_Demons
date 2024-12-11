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
			
			//the below case makes sure that enemies recalculate their path on the spot, as to avoid
			//them going through the (now closed off) tunnel
			//a better / less resource intensive way would be to flag enemies currently intending
			//to use this tunnel and only apply this statement to them
			
			case "recover": var _scare = noone;
							
							if (fleeFromPlayer)
							if (obj_player.inRoom == inRoom)
							{
							    timerPlaying = 0;
    
							    var _distPlayer = point_distance(x, y, obj_player.x, obj_player.y);
							    if (_distPlayer < rangePlayerFlee) _scare = obj_player;
							}
    
							if (instance_exists(obj_projectileStinkbomb))
							{
							    var _stinkbomb = instance_nearest(x, y, obj_projectileStinkbomb);
            
							    var _distStink = point_distance(x, y, _stinkbomb.x, _stinkbomb.y);
							    if (_distStink < obj_projectileStinkbomb.range) _scare = _stinkbomb;
							}
    
							if (hp != hpLast) _scare = obj_player;
    
							if (_scare != noone) switch_state(stateFlee, _scare);
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