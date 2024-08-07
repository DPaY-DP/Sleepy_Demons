if (counterStepsMove < amountStepsMove) 
{
	counterStepsMove++;
	if (directionMove == "down") y += stepMove;
	else y -= stepMove;
}
else
{
	if (directionMove == "up")
	{
		instance_create_depth(x, y, depth, obj_horseslider02, { size : size });
		instance_destroy();
	}
	else
	{
		if (counterStepsRotate < amountStepsRotate)
		{
			counterStepsRotate++;
			image_angle += stepRotate;
		}
		else
		{
			counterStepsMove = 0;
			directionMove = "up"
		}
	}
}