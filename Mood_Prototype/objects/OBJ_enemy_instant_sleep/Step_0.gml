//state machine
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



//DEBUG
//show_debug_message($"inRoom: {inRoom}");
if (inRoom == noone) show_message("HEY BOZO inRoom == noone!!!");