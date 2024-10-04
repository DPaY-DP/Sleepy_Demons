var _sprSide = spr_tunnel_side;
var _sprMiddle = spr_tunnel_middle;

if (tunnel.sabotaged)
{
	var _sprSide = spr_tunnel_side_blocked;
	var _sprMiddle = spr_tunnel_middle_blocked;
}

if (tunnel.orientation == "vertical")
{
	draw_sprite_simple(_sprSide, 0, x, y + 32, { angle : 180, xscale : -1 });
	for (var i = 1; i < image_xscale - 1; i++)
	{
		draw_sprite_simple(_sprMiddle, 0, x + 32 * i, y + 32, { yscale : -1 });
	}
	draw_sprite_simple(_sprSide, 0, x + 32 * image_xscale, y + 32, { angle : 180 });
	
	draw_sprite_simple(_sprSide, 0, x, y + 32, { });
	for (var i = 1; i < image_xscale - 1; i++)
	{
		draw_sprite_simple(_sprMiddle, 0, x + 32 * i, y + 32, { });
	}
	draw_sprite_simple(_sprSide, 0, x + 32 * image_xscale, y + 32, { xscale : -1 });
}
else
{
	draw_sprite_simple(_sprSide, 0, x + 32, y, { angle : 270 });
	for (var i = 1; i < image_yscale - 1; i++)
	{
		draw_sprite_simple(_sprMiddle, 0, x + 32, y + 32 * i, { angle : 270 });
	}
	draw_sprite_simple(_sprSide, 0, x + 32, y + 32 * image_yscale, { xscale : -1, angle : 270 });
	
	draw_sprite_simple(_sprSide, 0, x + 32, y, { xscale : -1, angle : 90 });
	for (var i = 1; i < image_yscale - 1; i++)
	{
		draw_sprite_simple(_sprMiddle, 0, x + 32, y + 32 + 32 * i, { angle : 90 });
	}
	draw_sprite_simple(_sprSide, 0, x + 32, y + 32 * image_yscale, { angle : 90 });
}

if (tunnel.sabotaged) && (point_distance(tunnel.xCenter, tunnel.yCenter, obj_player.x, obj_player.y) < 120) draw_sprite_simple(spr_UI_button, 3, tunnel.xCenter, tunnel.yCenter);