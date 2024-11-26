//player healing when broken
if	(broken) && 
	(array_length(POIsBroken) == 0) &&
	(point_distance(x, y, obj_player.x, obj_player.y) < distInteract) &&
	(obj_player.inRoom == inRoom)
{
	if (keyRepair) 
	{
		instance_create_depth(x, y, depth, obj_managerMinigame, { broken : id, game : enumMinigame.INPUTS_RAW });
		applyDamage = false;
	}
}


//applying damage on full destroy
if (broken) && (applyDamage) global.envHP -= hpDrain;


//getting sabotaged
var _numberSaboteurs = 0;
var _length = array_length(members);
for (var i = 0; i < _length; i++)
{
	var _member = members[i];
	if (instance_exists(_member))
	if (_member.inSaboPosition) _numberSaboteurs++;
	continue;
	
	var _dist = point_distance(x, y, _member.x, _member.y);
		
	if (_dist < members[i].distSabotage) _numberSaboteurs++;
}

if (_numberSaboteurs >= membersSabo)
for (var i = 0; i < _length; i++)
{
	var _member = members[i];
	
	show_debug_message($"sabotaging: {_member.name}")
	hp -= _member.envDamage;
}


//change stage
if (hp < 0) && (!broken)
{
	if (array_length(POIs) > 0)
	{
		POIs = array_shuffle(POIs);
		var _broken = array_pop(POIs);
		_broken.applyDamage = true;
		_broken.image_speed = 1;
	
		array_push(POIsBroken, _broken);	
		image_index = array_length(POIsBroken);
	}
	
	if (array_length(POIs) != 0) hp = hpMax;
	else
	{
		broken = true;
		applyDamage = true;
		image_blend = c_red;
	}
	
	audio_play_sound_at(snd_envSabotage, x, y, 0, 100, 150, 1, 0, 0, gainSFX);
}