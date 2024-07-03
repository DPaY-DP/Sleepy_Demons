x += lengthdir_x(spd, image_angle);
y += lengthdir_y(spd, image_angle);

timerAlive++;

if (x > room_width + boundary) || (x < -boundary) || (y > room_height + boundary) || (y < -boundary) || (place_meeting(x, y, obj_wall))
{
	instance_destroy();
}