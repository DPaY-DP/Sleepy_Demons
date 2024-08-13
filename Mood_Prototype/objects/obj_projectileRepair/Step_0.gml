x += lengthdir_x(spd, dir);
y += lengthdir_y(spd, dir);

image_angle += rot;

if (x > room_width + boundary) || (x < -boundary) || (y > room_height + boundary) || (y < -boundary) || (place_meeting(x, y, obj_wall))
{
	instance_destroy();
}

var _dist = point_distance(x, y, xStart, yStart);
if (_dist > range)
{
	falloff = (_dist - range) / rangeFalloff;
	
	image_xscale = 1 - falloff;
	image_yscale = 1 - falloff;
	
	if (falloff >= 1) instance_destroy();
}