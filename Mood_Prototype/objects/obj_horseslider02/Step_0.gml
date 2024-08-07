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
		instance_destroy();
	}
	else
	{
		if (counterStepsRotate < amountStepsRotate)
		{
			counterStepsRotate++;
			image_angle -= stepRotate;
		}
		else
		{
			counterStepsMove = 0;
			directionMove = "up"
		}
	}
}

show_debug_message(y)