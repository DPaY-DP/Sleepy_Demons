x += lengthdir_x(spd, image_angle);
y += lengthdir_y(spd, image_angle);

var _dist = point_distance(x, y, xStart, yStart);

if (_dist > range)
{
	falloff = (_dist - range) / rangeFalloff;
	
	image_xscale = size * (1 - falloff);
	image_yscale = size * (1 - falloff);
	
	if (falloff >= 1) instance_destroy();
}

if (x > room_width + boundary) || (x < -boundary) || (y > room_height + boundary) || (y < -boundary)
{
	instance_destroy();
}