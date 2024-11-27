event_inherited();

linkEnd = "";
creditName = collision_point(x,y,OBJ_backgroundParent,false,true)

switch creditName.name
{
	case "Eve":
		linkEnd = "eve-zaglanikis-9a674a254/"
	break;
	
	case "Joseph":
		linkEnd = "";
	break;
	
	case "Dennis":
		linkEnd = "dennis-pfannenstiel-7bb0501b9/";
	break;
	
	case "Paul":
		linkEnd = "paul-fauland-4114a3321/";
	break;
	
	case "Luiz":
		linkEnd = "";
	break;
	
	case "Amanda":
		linkEnd = "";
	break;
	
	case "Laszlo":
		linkEnd = "";
	break;
	
	case "V":
		linkEnd = "";
	break;
	
	case "Olivia":
		linkEnd = "";
	break;
	
	case "Enno":
		linkEnd = "enno-hartmann-885062320/";
	break;
}

func = function()
{
	url_open("https://www.linkedin.com/in/"+linkEnd)
}