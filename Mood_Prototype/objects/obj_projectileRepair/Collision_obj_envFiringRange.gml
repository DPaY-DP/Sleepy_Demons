if (!active) exit;
active = false;

var _damage = damage * (1 - falloff);
_damage = floor(_damage);
if (_damage == 0) _damage++;

var _color = c_blue;
instance_create_layer(other.x, other.y, "Overlay", obj_damageNumber, { damage : _damage, color : _color });

other.hp += _damage;