draw_self();

draw_text_simple(x + sprite_width / 2, y + sprite_height / 2, numberEnv, { color : c_white, halign : fa_left, valign : fa_top });

draw_sprite_simple(spr_env, stage + 1, x, y + sprite_height, { size : 2, yscale : 0 - (hpStage - hp) * (100 / hpStage) / 50 });

global.envHP -= hpDrain;

draw_debug(stage);

if	(hp < hpStage) && 
	(!broken) &&
	(point_distance(x, y, obj_player.x, obj_player.y) < distInteract)
{
	draw_sprite_simple(spr_UI_button, 1, x + 32, y + 32, { size : 0.8 });
	
	if (keyboard_check(ord("E"))) hp += 0.25;
}

if (hp > hpStage) && (stage != 0)
{
	switch_stage(-1);
	hp = 0.25;
}

if (!broken)
if (hp <= 0)
{	
	switch_stage(1);
	hp = hpStage;
}