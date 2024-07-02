if (!active) exit;

active = false;

other.caught = id;
target = other.id;

retract = true;

audio_play_sound(snd_extendoCatch, 0, 0);