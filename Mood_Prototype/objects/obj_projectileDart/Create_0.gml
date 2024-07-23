event_inherited();


//unique values
spd = 45;

iterationsInc = 5;

hit = function()
{
	if (other.hp == 0) exit;

	var _color = c_red;

	instance_create_layer(other.x, other.y, "Overlay", obj_damageNumber, { damage : 0, color : _color });
	other.get_slowed(160);

	other.hvel += lengthdir_x(punch, image_angle);
	other.vvel += lengthdir_y(punch, image_angle);

	other.hp -= damage;
	
	instance_destroy();
}