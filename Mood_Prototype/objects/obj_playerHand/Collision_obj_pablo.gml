if (!active) exit;

active = false;

var _damage = 10;

var _color = c_red;
if (other.slowed) 
{
	_color = c_yellow;
	_damage = 25;
}

instance_create_layer(other.x, other.y, "Overlay", obj_damageNumber, { damage : _damage, color : _color });

other.x += lengthdir_x(_damage * 2.5, image_angle);
other.y += lengthdir_y(_damage * 2.5, image_angle);
