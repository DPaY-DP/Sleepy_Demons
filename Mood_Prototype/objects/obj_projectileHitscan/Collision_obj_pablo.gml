if (!active) exit;

active = false;

var _comboEffect = false;

var _color = c_red;
if (_comboEffect) 
{
	other.get_slowed();
	_color = c_yellow;
}

instance_create_layer(other.x, other.y, "Overlay", obj_damageNumber, { damage : damage, color : _color });

other.hvel += lengthdir_x(punch, image_angle);
other.vvel += lengthdir_y(punch, image_angle);

other.hp -= damage;