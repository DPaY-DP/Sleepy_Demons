var _xTo = currentWaypoint[0];
var _yTo = currentWaypoint[1];

var _dir = point_direction(x, y, _xTo, _yTo);
	
image_angle = _dir;

if (slowed) spd = spdSlowed;
else spd = spdNormal;

if (!caught)
{
	x += lengthdir_x(spd, _dir);
	y += lengthdir_y(spd, _dir);
}
else
{
	x = caught.x;
	y = caught.y;
}

if (point_distance(x, y, _xTo, _yTo) < spd * 1.5)
{
	numberWaypoint++;
	if (numberWaypoint == array_length(currentRoute)) numberWaypoint = 0;
	currentWaypoint = currentRoute[numberWaypoint];
}

if (hit) && (!instance_exists(obj_projectileBulletProwler))
{
	hit = 0;
}