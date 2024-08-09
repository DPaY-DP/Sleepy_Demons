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
		check_horse_collider();
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

if (mouse_check_button_pressed(mb_left)) || (keyboard_check_pressed(vk_space)) check_horse_collider();