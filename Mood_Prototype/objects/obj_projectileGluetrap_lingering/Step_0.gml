if (size != sizeTarget)
{
	size += factorSize;
}

image_xscale = size;
image_yscale = size;

if (timerDespawn > 0) timerDespawn--;
else
{
	timerDecay--;
	image_alpha = timerDecay / intervalDecay;
	if (timerDecay == 0) instance_destroy();
}