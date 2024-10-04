//healing and preventing damage
var _applyDamage = true;
if	(hp < hpMax) && 
	(point_distance(x, y, obj_player.x, obj_player.y) < distInteract) &&
	(obj_player.inRoom == inRoom)
{
	if (keyRepair) 
	{
		hp += obj_player.spdRepair;
		_applyDamage = false;
	}
}

//applying damage
if (_applyDamage) global.envHP -= hpDrain;

//sabotaging
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
	
	hp -= _member.envDamage;
}

//change stage
if (hp >= hpMax)
{
	if (stage < stageMax)
	{
		switch_stage(1)
		hp = 0;
	}
	else 
	{
		//stage 3
		hpDrain = 0;
	}
}

if (hp < 0) && (stage > 0)
{	
	switch_stage(-1);
	hp = hpMax;
}

hp = clamp(hp, 0, hpMax);