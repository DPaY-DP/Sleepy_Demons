randomize();
draged=false;
xx=0;
yy=0;

image_index=irandom(image_number-1);
image_xscale=3;
image_yscale=3;

GUIwidthsmall = GUIwidth * 0.8
GUIheightsmall = GUIheight * 0.8

do
{ 
	x=(GUIwidthsmall * 0.45) + random(GUIwidthsmall * 0.25);
	y=(GUIheightsmall * 0.1) + random(GUIheightsmall * 0.4);
	
	var _collidingwithFluff=place_meeting(x, y, obj_fluff);
	var _collidingwithPillow=place_meeting(x, y, obj_pillow);
	
}
until (!_collidingwithFluff) && (!_collidingwithPillow)

