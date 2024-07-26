event_inherited();


//unique values
spd = 45;

iterationsInc = 5;

hit = function(_target)
{
	if (_target.hp == 0) exit;

	var _color = c_red;

	instance_create_layer(_target.x, _target.y, "Overlay", obj_damageNumber, { damage : 0, color : _color });
	_target.get_slowed(160);

	_target.hvel += lengthdir_x(punch, image_angle);
	_target.vvel += lengthdir_y(punch, image_angle);

	_target.hp -= damage;
	
	instance_destroy();
}