draw_self();

if (slowed)
{
	timerSlowed--;
	if (timerSlowed <= 20) && (frame mod 4 == 0) alpha *= -1;
	if (timerSlowed <= 0)
	{
		slowed = false;
		alpha = 1;
	}
	
	frame++;
	draw_sprite_simple(spr_stun, floor(frame / 20), x, y, { alpha : alpha })
}