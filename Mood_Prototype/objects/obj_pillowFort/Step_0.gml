if (point_distance(x, y, obj_player.x, obj_player.y) < rangeInteract)
{
	if (keyboard_check_pressed(ord("F"))) 
	{
		boost += factorBoost;
	}
}

if (boost > 0) 
{
	boost -= factorDeboost;
	boost = clamp(boost, 0, hpMax);
}

if (hp <= 0) || (boost >= hp) instance_destroy();