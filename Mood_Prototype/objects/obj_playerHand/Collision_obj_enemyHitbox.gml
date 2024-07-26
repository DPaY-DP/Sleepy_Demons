if (other.owner.hp == 0) || (!active) exit;

var _damage = 10;
var _color = c_red;
if (other.owner.slowed) 
{
	_damage = 21;
	_color = c_yellow;
}

instance_create_layer(other.owner.x, other.owner.y, "Overlay", obj_damageNumber, { damage : _damage, color : _color });

other.owner.hvel += lengthdir_x(_damage / 2, image_angle);
other.owner.vvel += lengthdir_y(_damage / 2, image_angle);

other.owner.hp -= _damage;

active = false;