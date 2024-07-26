//immutable values
timerAlive = 0;
timerDespawn = 60;

timerDraw = 0;

boundary = 200;

//methods
hit = function(_target)
{
	if (_target.hp == 0) exit;

	var _color = c_red;
	instance_create_layer(_target.x, _target.y, "Overlay", obj_damageNumber, { damage : damage, color : _color });

	_target.hvel += lengthdir_x(punch, image_angle);
	_target.vvel += lengthdir_y(punch, image_angle);

	_target.hp -= damage;

	instance_destroy();
}