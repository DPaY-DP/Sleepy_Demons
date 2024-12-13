var _target = other.owner;

if (_target.hp == 0) exit;

var _effect = _target.movementMods[enumMovementMods.MINIYUM];

_effect.active = true;
_effect.timer = 360;
if (_effect.strength > -10) _effect.strength -= 1.25;

instance_destroy();