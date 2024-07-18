//state machine
show_debug_message($"state {state.name} run")
state.run();
timerState++;







//slowness spaghetti code
if (slowed) spd = spdSlowed;
else spd = spdNormal;

//extendo net spaghetti code
if (caught)
{
	x = caught.x;
	y = caught.y;
}

//prowler spaghetti code
if (hit) && (!instance_exists(obj_projectileBulletProwler))
{
	hit = 0;
}