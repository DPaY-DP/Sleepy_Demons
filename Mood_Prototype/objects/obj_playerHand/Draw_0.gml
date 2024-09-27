var _length = array_length(shadows);

//for (var i = 0; i < _length; i++)
//{
//	var _alpha = 1 - (i + 1) / (_length + 1);
	
//	draw_sprite_simple(sprite_index, shadows[i].image, shadows[i].x, shadows[i].y, { alpha : _alpha * image_alpha, angle : shadows[i].angle });
//}

if (timerCooldown > 0)
{
	var _barWidth = 30;
	var _barHeight = 4;
	
	var x1 = x - _barWidth / 2;
	var y1 = y + 32;
	
	var x2 = x1 + _barWidth * (timerCooldown / intervalCooldown);
	var y2 = y1 + _barHeight;
	
	draw_rectangle_color(x1, y1, x2, y2, c_purple, c_purple, c_purple, c_purple, false);
}

draw_self();

if (global.debugmode)
{
	//draw_text_simple(x, y, image_index, { color : c_fuchsia, font : font_upheaval_scalable, size : fontscale * 4 })
}