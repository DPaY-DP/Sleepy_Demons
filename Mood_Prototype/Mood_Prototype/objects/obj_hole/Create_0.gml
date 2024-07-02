image_xscale = 1.4;
image_yscale = 1.4;

var _viewWidth = view_get_wport(0);
var _viewHeight = view_get_hport(0);

x = _viewWidth * 0.1 + random(_viewWidth * 0.8);
y = _viewHeight * 0.1 + random(_viewHeight * 0.8);

//do 
//{
	
//	var _collidingWithHole = place_meeting(x, y, obj_hole);
//	var _collidingWithForm = place_meeting(x, y, obj_form);
	
//	show_debug_message($"_collidingWithHole: {_collidingWithHole}, _collidingWithForm: {_collidingWithForm}")
//}
//until (!_collidingWithHole && !_collidingWithForm)

sprite_index = asset_get_index("spr_" + form + "Hole");