timer++;

if (timer > intervalGrowth)
{
	var _size = sizeMax;
	var _timer = timer - intervalGrowth;
	
	var _rot = ease_out(_timer, rotDefault, rotChange, intervalLife + intervalFade);
		
	if (_timer > intervalLife)
	{
		_timer -= intervalLife;
	
		image_alpha = ease_out(_timer, 1, -1, intervalFade);
		if (image_alpha <= 0) instance_destroy();
	}
}
else 
{
	var _size = ease_out(timer, sizeDefault, sizeChange, intervalGrowth);
	var _rot = rotDefault;
}

image_xscale = _size;
image_yscale = _size;
image_angle += _rot;