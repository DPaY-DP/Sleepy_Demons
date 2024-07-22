if (!active) exit;

active = false;

other.hit++;
if (last)
{
	if (other.hit >= 3) comboEffect = true;
	other.hit = 0;
}

//show_debug_message(other.hit);

var _color = c_red;
if (comboEffect) 
{
	other.get_slowed(80);
	_color = c_yellow;
}

instance_create_layer(other.x, other.y, "Overlay", obj_damageNumber, { damage : damage, color : _color });

other.hvel += lengthdir_x(punch, image_angle);
other.vvel += lengthdir_y(punch, image_angle);

other.hp -= damage;