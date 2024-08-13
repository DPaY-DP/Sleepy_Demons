//immutable values
	//projectile values
xStart = x;
yStart = y;

boundary = 200;
	
	
	//unique values
punch = 40;
			
damage = 4;
spd = 11;
acc = 1.05;
			
area = 300;
range = infinity;

launch = 200;				//player launch (secondary), currently unused



//game values
	//projectile values
timerAlive = 0;
timerDespawn = 60;
timerDraw = 0;

	//unique values
drawExplosion = false;

timerExplode = 45;
segmentExplode = timerExplode / 3;
active = true;


explode = function()
{	
	audio_play_sound(snd_rocketExplode, 0, 0);
	
	image_alpha = 0;
	spd = 0;
	
	drawExplosion = true;
	active = false;
	
	var _list = ds_list_create();
	var _numberHits = collision_circle_list(x, y, area / 2, OBJ_enemy, false, false, _list, false);
	
	var _arrayHit = list_to_array(_list);
	ds_list_destroy(_list);
	
	for (var i = 0; i < _numberHits; i++)
	{
		var _hit = _arrayHit[i];

		instance_create_layer(_hit.x, _hit.y, "Overlay", obj_damageNumber, { damage : damage, color : c_red });

		_hit.hvel += lengthdir_x(punch, point_direction(x, y, _hit.x, _hit.y));
		_hit.vvel += lengthdir_y(punch, point_direction(x, y, _hit.x, _hit.y));
		
		_hit.hp -= damage;
	}
}