if (hpLast != hp)
{
	var _effect = movementMods[enumMovementMods.GUENTHER_RUSH];

	_effect.active = true;
	_effect.timer = 240;
	if (_effect.strength < 10) _effect.strength += 1.8;
	
	show_debug_message(_effect)
}