if (!active) exit;

explode();

var _damage = damage * 2;

instance_create_layer(other.x, other.y, "Overlay", obj_damageNumber, { damage : _damage, color : c_red });
other.hp -= _damage;