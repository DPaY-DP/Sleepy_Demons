if (movementMods[enumMovementModsPlayer.MINIYUM].active)
{
	if (alpha < 1) alpha += 0.02;
}
else if (alpha > 0) alpha -= 0.02;

if (alpha > 0) draw_sprite_simple(spr_sugarRush, -1, 0, 0, { xscale : GUIwidth / 64, yscale : GUIheight / 64, alpha, });