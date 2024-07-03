var _iterations = floor(abs(hvel + vvel) / 8);
var _dist = 6;
var _dir = point_direction(0, 0, hvel, vvel);

for (var i = 0; i < _iterations; i++)
{
	var _alpha = 1 - i / _iterations;
	
	draw_sprite_simple(sprite_index, 0, x - lengthdir_x(_dist * i, _dir), y - lengthdir_y(_dist * i, _dir), { angle : image_angle, alpha : _alpha });
}

draw_sprite_simple(sprite_index, 0, x, y, { angle : orientation });