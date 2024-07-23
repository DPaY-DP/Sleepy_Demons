image_xscale = 1.4;
image_yscale = 1.4;

image_speed = 0;

sprite_index = asset_get_index("spr_" + form);

do 
{
	x = GUIWidth * 0.1 + random(GUIWidth * 0.8);
	y = GUIHeight * 0.1 + random(GUIHeight * 0.8);

	var _collidingWithHole = place_meeting(x, y, obj_hole);
	var _collidingWithForm = place_meeting(x, y, obj_form);
	
	show_debug_message($"collisions for {form}: \nHole: {_collidingWithHole}\nForm: {_collidingWithForm}")
}
until (!_collidingWithHole) && (!_collidingWithForm)