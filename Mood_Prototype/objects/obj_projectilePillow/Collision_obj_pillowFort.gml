var _target = other.id;

var _damage = _target.hp + 1;

instance_create_layer(_target.x, _target.y, "Overlay", obj_damageNumber, { damage : _damage, color : c_red });

_target.hp -= _damage;

instance_destroy();