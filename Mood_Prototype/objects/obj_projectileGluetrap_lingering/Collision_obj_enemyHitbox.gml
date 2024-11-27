var _effect = other.owner.movementMods[enumMovementMods.GLUETRAP];

_effect.active = true;
_effect.timer = 15;
if (_effect.strength > -8) _effect.strength -= 0.1;