if (timerAlive > 0)
{
	timerAlive--;
	
	x += lengthdir_x(spd, dir);
	y += lengthdir_y(spd, dir);
}
else
{
	timerFade--;
	alpha -= alphaFactor;
	
	if (alpha <= 0) instance_destroy();
}