image_speed = 0;

var _viewWidth = view_get_wport(0);
var _viewHeight = view_get_hport(0);

x = _viewWidth * 0.1 + random(_viewWidth * 0.8);
y = _viewHeight * 0.1 + random(_viewHeight * 0.8);

sprite_index = asset_get_index("spr_" + form);