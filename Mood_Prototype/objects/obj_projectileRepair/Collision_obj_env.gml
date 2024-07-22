if (!active) exit;
active = false;

var _color = c_blue;
instance_create_layer(other.x, other.y, "Overlay", obj_damageNumber, { damage : damage, color : _color });

other.hp += damage;