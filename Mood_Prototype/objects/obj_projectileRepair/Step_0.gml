x += lengthdir_x(spd, dir);
y += lengthdir_y(spd, dir);

image_angle += rot;

timerAlive++;

if (x > room_width + boundary) || (x < -boundary) || (y > room_height + boundary) || (y < -boundary) || (place_meeting(x, y, obj_wall))
{
	instance_destroy();
}