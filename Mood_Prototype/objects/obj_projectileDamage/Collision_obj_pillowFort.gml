var _target = other.id;

instance_create_layer(_target.x, _target.y, "Overlay", obj_damageNumber, { damage : damage, color : c_red });

_target.hp -= damage;

instance_destroy();