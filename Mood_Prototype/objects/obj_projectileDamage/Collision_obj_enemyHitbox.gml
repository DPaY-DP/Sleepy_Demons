var _target = other.owner;

instance_create_layer(_target.x, _target.y, "Overlay", obj_damageNumber, { damage : damage, color : c_red });

_target.hvel += lengthdir_x(punch, image_angle);
_target.vvel += lengthdir_y(punch, image_angle);

_target.hp -= damage;

instance_destroy();