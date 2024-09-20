//state machine
state.run();
timerState++;

hp = clamp(hp, 0, hpMax);
hpLast = hp;


//slowness spaghetti code
if (timerSlowed > 0) timerSlowed--;
else if (slowed)
{
	slowed = false;
	acc = accDefault;
	velMax = velMaxDefault;
}

//extendo net spaghetti code
if (caught)
{
	x = caught.x;
	y = caught.y;
}


//DEBUG
////show_debug_message($"inRoom: {inRoom}");
//if (inRoom == noone) show_message("HEY BOZO inRoom == noone!!!");