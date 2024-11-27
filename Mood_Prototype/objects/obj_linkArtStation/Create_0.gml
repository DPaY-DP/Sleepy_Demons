event_inherited();

linkEnd = "";
creditName = collision_point(x,y,OBJ_backgroundParent,false,true)

switch creditName.name
{
	case "Eve":
		linkEnd = ""
	break;
	
	case "Joseph":
		linkEnd = "";
	break;
	
	case "Dennis":
		linkEnd = "";
	break;
	
	case "Paul":
		linkEnd = "paulfauland";
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
		linkEnd = "";
	break;
}

func = function()
{
	url_open("https://www.artstation.com/"+linkEnd)
}