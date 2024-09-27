event_inherited();

linkEnd = "";
creditName = collision_point(x,y,OBJ_backgroundParent,false,true)

switch creditName.name
{
	case "Eve":
		linkEnd = "lifewith_sam"
	break;
	
	case "Joseph":
		linkEnd = "";
	break;
	
	case "Dennis":
		linkEnd = "";
	break;
	
	case "Paul":
		linkEnd = "";
	break;
	
	case "Luiz":
		linkEnd = "";
	break;
	
	case "Amanda":
		linkEnd = "morrighan_shadow";
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
	url_open("https://www.instagram.com/"+linkEnd)
}