switch(timerAlive++)
{
	case 1 * 3:		image_yscale = size * 0.5;
	break;	 
			 
	case 2 * 3:		image_yscale = size * 1;
					image_xscale = 4;
					
					check_collision();
	break;	 
			 
	case 3 * 3:		image_yscale = size * 1.5;
					image_xscale = 8;
	break;	 
			 
	case 4 * 3:		image_yscale = size * 0.5;
					image_xscale = 12;
	break;
			 
	case 5 * 3:		image_yscale = size * 0.25;
					image_xscale = 16;
	break;	 
			 
	case 6 * 3:		instance_destroy();
	break;
}

var _dirBarrel = point_direction(0, 32, xBarrel, yBarrel);
var _distBarrel = point_distance(0, 32, xBarrel, yBarrel);


								
x = obj_weapon.x + lengthdir_x(_distBarrel, _dirBarrel + obj_weapon.image_angle);
y = obj_weapon.y + lengthdir_y(_distBarrel, _dirBarrel + obj_weapon.image_angle);