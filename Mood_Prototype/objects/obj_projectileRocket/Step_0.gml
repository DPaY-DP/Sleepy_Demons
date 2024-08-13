if (!active) exit;
x += lengthdir_x(spd, image_angle);
y += lengthdir_y(spd, image_angle);
spd *= acc;

if (x > room_width + boundary) || (x < -boundary) || (y > room_height + boundary) || (y < -boundary)
{
	instance_destroy();
}

if (point_distance(x, y, xStart, yStart) > range) || (place_meeting(x, y, OBJ_colliderPlayer))
{
	explode();
}