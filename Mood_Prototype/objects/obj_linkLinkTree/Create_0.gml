event_inherited();

linkEnd = "";
creditName = collision_point(x,y,OBJ_backgroundParent,false,true)

switch creditName.name
{
	case "Eve":
		linkEnd = ""
	break;
	
	case "Joseph":
		linkEnd = "followthemaelstrom";
	break;
	
	case "Dennis":
		linkEnd = "";
	break;
	
	case "Paul":
		linkEnd = "";
	break;
	
	case "Luiz":
		linkEnd = "Xadadron";
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
	url_open("https://linktr.ee/"+linkEnd)
}