image_xscale = global.GUIScale;
image_yscale = global.GUIScale;

image_speed = 0;

if (obj_managerMinigame.switchesActivated < 3)
{
	turnedOn = choose(0,1);
}
else turnedOn = 0;

if (turnedOn) 
{
	image_index = 1;
	audio_play_sound(snd_button,1,false)
	obj_managerMinigame.switchesActivated++;
}
	
while (place_meeting(x, y, obj_lightswitch))
{
	x = GUIwidth * 0.15 + random(GUIwidth * 0.7);
	y = GUIheight * 0.15 + random(GUIheight * 0.7);
	
	show_debug_message("while obj_lightswitch")
}