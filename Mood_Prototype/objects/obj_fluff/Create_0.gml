dragged = false;
xOffset = 0;
yOffset = 0;

image_index = irandom(image_number - 1);
image_xscale = 6;
image_yscale = 6;

do
{ 
	x = camX + camWidth * 0.2 + random(camWidth * 0.7);
	y = camY + camHeight * 0.1 + random(camHeight * 0.8);
	
	show_debug_message($"{x}; {y}")
	
	var _collidingwithFluff = place_meeting(x, y, obj_fluff);
	var _collidingwithPillow = place_meeting(x, y, obj_pillow);
}
until (!_collidingwithFluff) && (!_collidingwithPillow)