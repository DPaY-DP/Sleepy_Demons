draw_self();

if (slowed)
{
	timerSlowed--;
	if (timerSlowed <= 20) && (slowedStarFrame mod 4 == 0) slowedStarAlpha *= -1;
	if (timerSlowed <= 0)
	{
		slowed = false;
		slowedStarAlpha = 1;
	}
	
	slowedStarFrame++;
	draw_sprite_simple(spr_stun, floor(slowedStarFrame / 20), x, y - 20, { alpha : slowedStarAlpha });
}