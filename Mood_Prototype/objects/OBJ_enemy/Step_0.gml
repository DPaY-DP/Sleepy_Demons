//state machine
state.run();
timerState++;

hp = clamp(hp, 0, hpMax);
hpLast = hp;


//idle sound
if(idleTimer <= 0)
{
	audio_play_sound_at(array_get(idleSounds,random_range(0,array_length(idleSounds))), x, y, 0, 100, 150, 1, 0, false, gainSFX); //LUIZSOUND
	idleTimer = random_range(3*room_speed,30*room_speed)
}
else idleTimer--;

//DEBUG
////show_debug_message($"inRoom: {inRoom}");
//if (inRoom == noone) show_message("HEY BOZO inRoom == noone!!!");