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
	obj_managerMinigame.switchesActivated++;
}
	
while (place_meeting(x, y, obj_lightswitch))
{
	x = view_get_wport(0) * 0.15 + random(view_get_wport(0) * 0.7);
	y = view_get_hport(0) * 0.15 + random(view_get_hport(0) * 0.7);
}