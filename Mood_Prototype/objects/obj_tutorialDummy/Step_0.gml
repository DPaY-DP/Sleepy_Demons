switch(currentRoom)
{
	case "room_tutorialShooting":
		
		if(timesShot >= 3 && timesMelee >= 3)
		{
			instance_destroy(self)
		}
	break;
	
	case "room_tutorialExecutie":
		
	break;
	
	case "room_tutorialEnvironment":
		
	break;
}
