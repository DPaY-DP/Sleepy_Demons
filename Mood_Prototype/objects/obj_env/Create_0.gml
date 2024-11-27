  #region IMMUTABLE VALUES
name = "env object";

inRoom = instance_place(x, y, obj_room);

distInteract = 200;

membersMax = 4;
membersSabo = 2;

pointsSabo = [];

hpMax = 50;
hpDrain = 0.5;

stageMax = image_number - 1;
#endregion


#region GAME VALUES
hp = hpMax;
POIs = [];
POIsBroken = [];

broken = false;
applyDamage = false;

members = [];

pointMeet = undefined;
#endregion


#region SETUP AND SPAWNING
	//setup environment count and add myself to it
if (!variable_global_exists("countEnv")) global.countEnv = 0;
numberEnv = global.countEnv++;


	//create sabotage points for demons to interact with me
var _dir = 0;
for (var i = 0; i < 8; i++)
{
	var _x = x + lengthdir_x(64, _dir);
	var _y = y + lengthdir_y(64, _dir);
	
	if (!instance_position(_x, _y, obj_wall)) array_push(pointsSabo, [{ x : _x, y : _y }, 0]);
	
	_dir += 45;
}

if (array_length(pointsSabo) < membersMax)
{
	var _repeats = 0;
	do
	{
		array_push(pointsSabo, ds_clone(array_choose(pointsSabo)));
		_repeats++;
	}
	until (array_length(pointsSabo) == membersMax)
}
#endregion


#region METHODS
add_member = function(_id)
{
	if (array_length(members) == membersMax) 
	{
		//show_debug_message("rejected member (full)")
		return false
	}
	else 
	{
		array_push(members, _id);
	}
	
	if (array_length(members) == 1) pointMeet = array_choose(inRoom.points);
	
	//show_debug_message("accepted member")
	
	return true
}

get_point_sabo = function(_id)
{
	var _whilesafe = 0;
	while (true)
	{
		var _randomPointSabo = array_choose(pointsSabo);
		if (_randomPointSabo[1] == 0)
		{
			_randomPointSabo[1] = _id;
			return _randomPointSabo[0];
		}
		
		_whilesafe++;
		if (_whilesafe > 100) 
		{
			//show_message("While Loop Overflow\nOBJ_env > get_points_sabo()");
			break;
		}
	}
}

void_member = function(_id)
{
	members = array_purge(members, _id);
	
	var _lengthPointsSabo = array_length(pointsSabo);
	for (var i = 0; i < _lengthPointsSabo; i++)
	{
		if (_id == pointsSabo[i][1]) pointsSabo[i][1] = 0;
	}
}

fix = function()
{
	broken = false;
	hp = hpMax;
	image_blend = c_white;
	
	audio_play_sound(snd_envRepair, 0, 0, gainSFX);
	alarm[0] = 15;
	alarm[1] = 30;
}
#endregion