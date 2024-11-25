var _effect = other.owner.movementMods[enumMovementMods.MINIYUM];

_effect.active = true;
_effect.timer = 60;
if (_effect.strength > -10) _effect.strength -= 0.35;

instance_destroy();