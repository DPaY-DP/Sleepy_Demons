//immutable values
timerAlive = 0;
timerDespawn = 60;

timerDraw = 0;

boundary = 200;

//methods
hit = function()
{
	if (other.hp == 0) exit;

	var _color = c_red;
	instance_create_layer(other.x, other.y, "Overlay", obj_damageNumber, { damage : damage, color : _color });

	other.hvel += lengthdir_x(punch, image_angle);
	other.vvel += lengthdir_y(punch, image_angle);

	other.hp -= damage;

	instance_destroy();
}