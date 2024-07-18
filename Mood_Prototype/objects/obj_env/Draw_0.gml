draw_self();

draw_sprite_simple(spr_env, stage + 1, x, y + sprite_height, { size : 2, yscale : 0 - (hpStage - hp) * (100 / hpStage) / 50 });

if	(stage > 0) && 
	(point_distance(x, y, obj_player.x, obj_player.y) < distInteract)
{
	draw_sprite_simple(spr_UI_button, 1, x + 32, y + 32, { size : 0.8 });
}

//DEBUG
draw_debug(stage);