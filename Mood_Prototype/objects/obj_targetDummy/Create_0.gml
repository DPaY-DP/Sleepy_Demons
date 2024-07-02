route = 0;

slowed = false;

spdNormal = 4;
spdSlowed = spdNormal * 0.5;

spd = spdNormal;

waypoints = [
[[1300, 200], [1300, 900]],
]

currentRoute = waypoints[route];
numberWaypoint = 0;
currentWaypoint = currentRoute[numberWaypoint];

frame = 0;

intervalSlowed = 80;
timerSlowed = intervalSlowed;
alpha = 1;

hit = 0;

caught = undefined;

get_slowed = function(_length)
{
	slowed = true;
	timerSlowed = _length;
}