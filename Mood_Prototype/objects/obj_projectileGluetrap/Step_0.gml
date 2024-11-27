x += lengthdir_x(spd, image_angle);
y += lengthdir_y(spd, image_angle);

spd *= 1.03;

timerDuration--;
if (timerDuration == 0)
{
	burst();
}