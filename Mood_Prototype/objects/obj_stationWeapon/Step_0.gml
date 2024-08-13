var _dist = point_distance(x, y, obj_player.x, obj_player.y);

if (_dist < 32)
{
	var _dir = point_direction(obj_player.x, obj_player.y, x, y);
	obj_player.hvel += lengthdir_x(0.05 * _dist, _dir);
	obj_player.vvel += lengthdir_y(0.05 * _dist, _dir);
	
	timerReuse = intervalReuse;
}
else
{
	if (timerReuse > 0) timerReuse--;
	else used = false;
}

if (_dist < 16) && (!used)
{
	if (timerCollect > 0) timerCollect--;
	else
	{
		if (!collected)
		{
			obj_weapon.pickup_gun(image_index);
			collected = true;
		}
		else obj_weapon.restock_ammo(image_index);
		
		used = true;
	}
}
else timerCollect = intervalCollect;

if (used) image_blend = c_dkgray;
else image_blend = c_white;