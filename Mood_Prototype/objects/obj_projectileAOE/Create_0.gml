timerAlive = 0;
timerDespawn = 60;

timerDraw = 0;

xStart = x;
yStart = y;

boundary = 200;

active = true;

drawExplosion = false;

timerExplode = 45;
segmentExplode = timerExplode / 3;

//show_debug_message(image_angle)

explode = function()
{	
	audio_play_sound_at(snd_rocketExplode, x, y, 0, 100, 150, 1, 0, 0);
	
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