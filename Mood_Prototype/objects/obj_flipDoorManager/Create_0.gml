currentDoor = "Red"
thisDoor = "";

flipDoor = function()
{
	if(currentDoor == "Red") 
	{
		currentDoor = "Blue";
		instance_deactivate_object(obj_flipDoorRed);
		instance_activate_object(obj_flipDoorBlue);
	}
	else if (currentDoor == "Blue") 
	{
		currentDoor = "Red";
		instance_deactivate_object(obj_flipDoorBlue);
		instance_activate_object(obj_flipDoorRed);
	}
}