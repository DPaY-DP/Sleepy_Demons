if (drawExplosion)
{
	timerExplode--;
	if (timerExplode <= 0) instance_destroy();
	
	draw_set_color(c_orange);
	draw_set_alpha(timerExplode / 45);
	draw_circle(x, y, area / 2, false);
	draw_set_color(c_white);
	draw_set_alpha(1);
}
else
{
	timerDraw++;
	
	var _iterations = min(timerDraw, 30);
	var _dist = 3;

	for (var i = 0; i < _iterations; i++)
	{
		var _alpha = 1 - i / _iterations;
	
		draw_sprite_simple(sprite_index, 0, x - lengthdir_x(_dist * i, image_angle), y - lengthdir_y(_dist * i, image_angle), { alpha : _alpha, angle : image_angle });
	}
}