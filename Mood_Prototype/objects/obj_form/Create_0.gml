image_xscale = 1.6 * global.GUIScale;
image_yscale = 1.6 * global.GUIScale;

image_speed = 0;

sprite_index = asset_get_index("spr_" + form);

dropTolerance = 100;




canBeGrabbed = true;

//do 
//{
//	x = GUIwidth * 0.1 + random(GUIwidth * 0.8);
//	y = GUIheight * 0.1 + random(GUIheight * 0.8);


//	var _collidingWithHole = place_meeting(x, y, obj_hole);
//	var _collidingWithForm = place_meeting(x, y, obj_form);
	
//	show_debug_message("do until obj_form")
//	show_debug_message($"collisions for {form}: \nHole: {_collidingWithHole}\nForm: {_collidingWithForm}")
//}
//until (!_collidingWithHole) && (!_collidingWithForm)