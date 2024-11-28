draw_self();

if(tunnel.sabotaged)
{
var _curIndex = image_index;
sprite_index = spr_tunnelSideStuffed;
image_index = _curIndex;

if(point_distance(tunnel.xCenter, tunnel.yCenter, obj_player.x, obj_player.y) < 120) draw_sprite_simple(spr_UI_button, 3, tunnel.xCenter, tunnel.yCenter);
}
else 
{
	var _curIndex = image_index;
	sprite_index = spr_tunnelSide;
	image_index = _curIndex;
}