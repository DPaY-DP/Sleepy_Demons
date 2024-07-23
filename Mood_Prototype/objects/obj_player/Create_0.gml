#region IMMUTABLE VALUES
accDefault = 1.25;
velMaxDefault = 7;

frictionStandingDefault = 0.75;
frictionWalkingDefault = 0.5;
			//knockback is LESS effective while moving to incentivize the player to keep moving
			//instead of standing still like an idiot

accWater = 0.99;
velMaxWater = 5.5;

frictionStandingWater = 0.55;
frictionWalkingWater = 0.4;

spdRepair = 1;
#endregion


#region GAME VALUES
acc = accDefault;
velMax = velMaxDefault;

frictionStanding = frictionStandingDefault;
frictionWalking = frictionWalkingDefault;

orientation = 0;

dir = 0;

vel = 0;
hvel = 0;
vvel = 0;
#endregion


#region METHODS
do_effect_dust = function(_x, _y)
{
	var _lifeMax = 20;
	
	//ef_dust
	ps = part_system_create();
	part_system_draw_order(ps, true);

	//Emitter
	ptype1 = part_type_create();
	part_type_shape(ptype1, pt_shape_cloud);
	part_type_size(ptype1, 1, 2, 0, 0);
	part_type_scale(ptype1, 0.25, 0.25);
	part_type_speed(ptype1, 5, 5, 0, 0);
	part_type_direction(ptype1, 0, 360, 0, 0);
	part_type_gravity(ptype1, 0, 270);
	part_type_orientation(ptype1, 0, 0, 0, 0, false);
	part_type_colour3(ptype1, $FFFFFF, $FFFFFF, $FFFFFF);
	part_type_alpha3(ptype1, 1, 1, 1);
	part_type_blend(ptype1, false);
	part_type_life(ptype1, 10, _lifeMax);

	pemit1 = part_emitter_create(ps);
	part_emitter_region(ps, pemit1, -32, 32, -32, 32, ps_shape_rectangle, ps_distr_linear);
	part_emitter_burst(ps, pemit1, ptype1, 5);
	part_emitter_delay(ps, pemit1, 2, 0, time_source_units_frames)
	
	part_system_depth(ps, depth - 1);

	part_system_position(ps, _x, _y);
	
	alarm[0] = _lifeMax;
}
#endregion


#region SPAWNING AND SETUP
instance_create_depth(x, y, depth - 2, obj_playerHand);
instance_create_depth(x, y, depth - 1, obj_weapon);
#endregion

#region DEBUG
#endregion