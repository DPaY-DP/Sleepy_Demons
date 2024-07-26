event_inherited();

//unique values
spd = 60;

iterationsInc = 10;

hit = function()
{
	if (other.hp == 0) exit;
	
	if (!variable_instance_exists(other.id, "hitCombo")) other.hitCombo = 0;

	var _comboEffect = false;
	
	other.hitCombo++;
	if (last)
	{
		if (other.hitCombo >= 3) _comboEffect = true;
		other.hitCombo = 0;
	}

	var _color = c_red;
	if (_comboEffect) 
	{
		other.get_slowed(80);
		_color = c_yellow;
	}

	instance_create_layer(other.x, other.y, "Overlay", obj_damageNumber, { damage : damage, color : _color });

	other.hvel += lengthdir_x(punch, image_angle);
	other.vvel += lengthdir_y(punch, image_angle);

	other.hp -= damage;

	instance_destroy();
}