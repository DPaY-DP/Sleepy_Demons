var _target = other.owner;

var _damage = min(_target.hp + 1, 25);
var _punch = _damage * 2;

instance_create_layer(_target.x, _target.y, "Overlay", obj_damageNumber, { damage : _damage, color : c_red });

_target.hvel += lengthdir_x(_punch, image_angle);
_target.vvel += lengthdir_y(_punch, image_angle);

_target.hp -= _damage;

instance_destroy();