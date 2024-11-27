if (point_distance(x + sprite_width / 2, y + sprite_height / 2, obj_player.x, obj_player.y) < rangeInteract)
{
	if (keyboard_check(ord("F"))) 
	{
		hp -= 0.2;
	}
}

if (hp <= 0) instance_destroy();