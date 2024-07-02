var _length = array_length(shadows);

for (var i = 0; i < _length; i++)
{
	var _alpha = 1 - (i + 1) / (_length + 1);
	
	draw_sprite_simple(sprite_index, 0, shadows[i][0], shadows[i][1], { alpha : _alpha, angle : shadows[i][2] });
}

draw_self();