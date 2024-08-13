if (!active) exit;

active = false;

var _damage = damage * 2.5;

other.owner.hp -= _damage;
instance_create_layer(other.owner.x, other.owner.y, "Overlay", obj_damageNumber, { damage : _damage, color : c_red });
	
explode();