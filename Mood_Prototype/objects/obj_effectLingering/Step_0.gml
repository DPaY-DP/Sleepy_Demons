var _list = ds_list_create();
var _numberHits = collision_circle_list(x, y, area / 2, OBJ_enemy, false, false, _list, false);
	
var _arrayHit = list_to_array(_list);
ds_list_destroy(_list);
	
for (var i = 0; i < _numberHits; i++)
{
	var _hit = _arrayHit[i];
	
	_hit.slowed = true;
	_hit.timerSlowed = 45;
}

if (length > 0) length--;
else instance_destroy();

timerPulse += factorPulse;
if (timerPulse > intervalPulse) || (timerPulse < 0) factorPulse *= -1;