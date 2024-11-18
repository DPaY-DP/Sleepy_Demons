draw_self();

if (applyDamage)
if (point_distance(x, y, obj_player.x, obj_player.y) < rangeInteract)
{
	draw_sprite_simple(spr_UI_button, 0, x, y - 16, { size : 0.8 });
}