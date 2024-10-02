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

if(idleTimer <= 0)
{
	audio_play_sound(array_get(idleSounds,random_range(0,array_length(idleSounds))),1,false,.3); //LUIZSOUND
	idleTimer = random_range(3*room_speed,30*room_speed)
}
else idleTimer--;

//DEBUG
////show_debug_message($"inRoom: {inRoom}");
//if (inRoom == noone) show_message("HEY BOZO inRoom == noone!!!");