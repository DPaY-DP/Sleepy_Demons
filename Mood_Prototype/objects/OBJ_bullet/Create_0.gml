//immutable values
	//bullet values
iterationsInc = 5;
boundary = 200;

xStart = x;
yStart = y;

size = 1;



//game values
	//bullet values
timerAlive = 0;
timerDespawn = 60;
timerDraw = 0;

falloff = 0;
	
destroy = false;



//methods
hit = function(_target)
{
	if (_target.hp == 0) exit;
	
	var _damage = damage * (1 - falloff);
	_damage = floor(_damage);
	if (_damage == 0) _damage++;

	var _color = c_red;
	instance_create_layer(_target.x, _target.y, "Overlay", obj_damageNumber, { damage : _damage, color : _color });

	_target.hvel += lengthdir_x(punch, image_angle);
	_target.vvel += lengthdir_y(punch, image_angle);

	_target.hp -= _damage;

	destroy = true;
}