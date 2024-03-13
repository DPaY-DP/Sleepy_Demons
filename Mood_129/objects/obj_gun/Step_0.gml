///// @description Execute Code
//// simple weapon shooting
//	if (keyboard_check(_shoot) || mouse_check_button(mb_left)){
//	    if cooldown = 0 {
//	        repeat self.projectile_amount
//	        { 
//	            spread = random_range(0 ,projectile_spread)
        
//	            shoot_projectile = instance_create_depth(x,y,self.depth,self.projectile)
    
//	            shoot_projectile.speed = self.projectile_speed
    
//	            shoot_projectile.direction = point_direction(x,y,mouse_x+spread * 10 ,mouse_y +spread * 10)
//	            shoot_projectile.image_angle = point_direction(x,y,mouse_x+spread * 10 ,mouse_y +spread * 10)
        
//	        }
//	        cooldown = self.shot_cooldown * 60
// 	    }
//	}
//	if (cooldown > 0) cooldown = cooldown-1     
//	else{
//		}if x-50 < mouse_x
//	{
//		 image_yscale = 1
//	}else if x+50 > mouse_x
//	{
//		image_yscale = -1
//	}
//	else{    
//		if (instance_exists(shoot_projectile) && shoot_projectile.speed > 0) {
//			 _old_bullet_velocity = shoot_projectile.speed;
//			 with(obj_marshmallow)speed = 0
//		}
//		}