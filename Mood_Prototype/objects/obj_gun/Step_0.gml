/// @DnDAction : YoYo Games.Common.Execute_Code
/// @DnDVersion : 1
/// @DnDHash : 7D36B5A1
/// @DnDArgument : "code" "// simple weapon shooting$(13_10)	if (keyboard_check(_shoot) || mouse_check_button(mb_left)){$(13_10)	    if cooldown = 0 {$(13_10)	        repeat self.projectile_amount$(13_10)	        { $(13_10)	            spread = random_range(0 ,projectile_spread)$(13_10)        $(13_10)	            shoot_projectile = instance_create_depth(x,y,self.depth,self.projectile)$(13_10)    $(13_10)	            shoot_projectile.speed = self.projectile_speed$(13_10)    $(13_10)	            shoot_projectile.direction = point_direction(x,y,mouse_x+spread * 10 ,mouse_y +spread * 10)$(13_10)	            shoot_projectile.image_angle = point_direction(x,y,mouse_x+spread * 10 ,mouse_y +spread * 10)$(13_10)        $(13_10)	        }$(13_10)	        cooldown = self.shot_cooldown * 60$(13_10) 	    }$(13_10)	}$(13_10)	if (cooldown > 0) cooldown = cooldown-1     $(13_10)	else{$(13_10)		}if x-50 < mouse_x$(13_10)	{$(13_10)		 image_yscale = 1$(13_10)	}else if x+50 > mouse_x$(13_10)	{$(13_10)		image_yscale = -1$(13_10)	}$(13_10)	else{    $(13_10)		if (instance_exists(shoot_projectile) && shoot_projectile.speed > 0) {$(13_10)			 _old_bullet_velocity = shoot_projectile.speed;$(13_10)			 with(obj_marshmallow)speed = 0$(13_10)		}$(13_10)		}"
// simple weapon shooting
	if (keyboard_check(_shoot) || mouse_check_button(mb_left)){
	    if cooldown = 0 {
	        repeat self.projectile_amount
	        { 
	            spread = random_range(0 ,projectile_spread)
        
	            shoot_projectile = instance_create_depth(x,y,self.depth,self.projectile)
    
	            shoot_projectile.speed = self.projectile_speed
    
	            shoot_projectile.direction = point_direction(x,y,mouse_x+spread * 10 ,mouse_y +spread * 10)
	            shoot_projectile.image_angle = point_direction(x,y,mouse_x+spread * 10 ,mouse_y +spread * 10)
        
	        }
	        cooldown = self.shot_cooldown * 60
 	    }
	}
	if (cooldown > 0) cooldown = cooldown-1     
	else{
		}if x-50 < mouse_x
	{
		 image_yscale = 1
	}else if x+50 > mouse_x
	{
		image_yscale = -1
	}
	else{    
		if (instance_exists(shoot_projectile) && shoot_projectile.speed > 0) {
			 _old_bullet_velocity = shoot_projectile.speed;
			 with(obj_marshmallow)speed = 0
		}
		}