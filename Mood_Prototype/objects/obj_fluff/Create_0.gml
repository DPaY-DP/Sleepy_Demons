dragged = false;
xOffset = 0;
yOffset = 0;

image_index = irandom(image_number - 1);
image_xscale = 6 * global.GUIScale;
image_yscale = 6 * global.GUIScale;

do
{ 
	x = GUIwidth * 0.2 + random(GUIwidth * 0.7);
	y = GUIheight * 0.1 + random(GUIheight * 0.8);
	
	show_debug_message($"{x}; {y}")
	
	var _collidingwithFluff = place_meeting(x, y, obj_fluff);
	var _collidingwithPillow = place_meeting(x, y, obj_pillow);
}
until (!_collidingwithFluff) && (!_collidingwithPillow)