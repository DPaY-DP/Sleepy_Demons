event_inherited();

//unique values
spd = 60;

iterationsInc = 10;

hit = function(_target)
{
	if (_target.hp == 0) exit;
	
	var _comboEffect = false;
	if (first)
	{
		_target.hitCombo.burstId = burstId;
		_target.hitCombo.hits = 0;
		
		_target.hitCombo.hits++;
	}
	else if (last)
	{
		if (_target.hitCombo.burstId == burstId)
		{
			_target.hitCombo.hits++;
			if (_target.hitCombo.hits == burstGoal) _comboEffect = true;
		}
	}
	else _target.hitCombo.hits++;

	var _color = c_red;
	if (_comboEffect) 
	{
		_target.get_slowed(80);
		_color = c_yellow;
	}

	instance_create_layer(_target.x, _target.y, "Overlay", obj_damageNumber, { damage : damage, color : _color });

	_target.hvel += lengthdir_x(punch, image_angle);
	_target.vvel += lengthdir_y(punch, image_angle);

	_target.hp -= damage;

	instance_destroy();
}