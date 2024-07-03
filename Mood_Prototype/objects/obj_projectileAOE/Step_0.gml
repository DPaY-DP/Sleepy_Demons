x += lengthdir_x(spd, image_angle);
y += lengthdir_y(spd, image_angle);

timerAlive++;

if (x > room_width + boundary) || (x < -boundary) || (y > room_height + boundary) || (y < -boundary)
{
	instance_destroy();
}

if (active)
if (point_distance(x, y, xStart, yStart) > range) || (place_meeting(x, y, obj_wall))
{
	explode();
}