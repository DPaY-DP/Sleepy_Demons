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

other.x += lengthdir_x(punch * 3, image_angle);
other.y += lengthdir_y(punch * 3, image_angle);