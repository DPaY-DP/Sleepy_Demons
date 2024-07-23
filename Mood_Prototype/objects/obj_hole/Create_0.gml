image_xscale = 1.4;
image_yscale = 1.4;

sprite_index = asset_get_index("spr_" + form + "Hole");

do 
{
	x = GUIWidth * 0.1 + random(GUIWidth * 0.8);
	y = GUIHeight * 0.1 + random(GUIHeight * 0.8);

	var _collidingWithHole = place_meeting(x, y, obj_hole);
}
until (!_collidingWithHole)