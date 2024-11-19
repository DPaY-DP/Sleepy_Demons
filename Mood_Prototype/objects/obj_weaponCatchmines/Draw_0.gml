if (grappling)
{
	draw_line_color(obj_player.x, obj_player.y, targetGrapple[0], targetGrapple[1], c_black, c_black);
	draw_sprite_simple(spr_projectileCatchmineGrapple, 0, targetGrapple[0], targetGrapple[1], { angle : dirGrapple });
	show_debug_message(dirGrapple)
}

if (active) draw_self();