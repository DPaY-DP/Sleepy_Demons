#region IMMUTABLE VALUES
name = "env object";

if (!variable_global_exists("countEnv")) global.countEnv = 0;
numberEnv = global.countEnv++;

inRoom = instance_place(x, y, obj_room);

hpMax = 100;
stageMax = 2;

image_index = image_number - 1;

distInteract = 200;

membersMax = 3;
membersSabo = 2;

pointsSabo = [];

var _dir = 0;
var _distPointSabo = 64;
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
	//show_message($"obj_env in room {inRoom.number} could not find enough sabo points to match membersMax variable, added {_repeats} repeats.")
}
#endregion


#region GAME VALUES
hp = hpMax;
stage = stageMax;

hpDrain = 0;

members = [];

pointMeet = undefined;
#endregion


#region METHODS
switch_stage = function(_change)
{
	stage += _change;
	image_index = stage;
	
	switch (stage)
	{		
		case 2:		hpDrain = 0.1;
					inRoom.flood = false;
		break;
		
		case 1:		hpDrain = 0.2;
					inRoom.flood = true;
		break;
		
		case 0:		hpDrain = 0.3;
		break;
	}
}

add_member = function(_id)
{
	if (array_length(members) == membersMax) return false
	else array_push(members, _id);
	
	if (array_length(members) == 1) pointMeet = array_choose(inRoom.points);
	
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
			show_message("While Loop Overflow\nobj_env > get_points_sabo()");
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
#endregion