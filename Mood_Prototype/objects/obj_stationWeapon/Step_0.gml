var _dist = point_distance(x, y, obj_player.x, obj_player.y);

if (_dist < 32)
{
	var _dir = point_direction(obj_player.x, obj_player.y, x, y);
	obj_player.hvel += lengthdir_x(0.05 * _dist, _dir);
	obj_player.vvel += lengthdir_y(0.05 * _dist, _dir);
	
	timerReuse = intervalReuse;
}
else
{
	if (timerReuse > 0) timerReuse--;
	else 
	{
		used = false;
		if(stationReloadDone)
		{
			audio_play_sound(Weapon_station_reloading_itself_finish,1,false);	//LUIZSOUND Trying to create a way to only play the sound when station is done reloading
			stationReloadDone = false;
		}
	}
}

if (_dist < 16) && (!used)
{
	if (timerCollect > 0) timerCollect--;
	else
	{
		if (!collected)
		{
			obj_weapon.pickup_gun(image_index);
			collected = true;
			audio_play_sound(weapon_station_give_weapon,1,false)	//LUIZSOUND
		}
		else 
		{
				obj_weapon.restock_ammo(image_index);
				audio_play_sound(weapon_station_give_weapon,1,false) //LUIZSOUND
		}
		used = true;
		
	}
}
else timerCollect = intervalCollect;

if (used) image_blend = c_dkgray;
else image_blend = c_white;

while(used=true && !audio_is_playing(Weapon_station_reloading_itself_rattata) && !audio_is_playing(weapon_station_give_weapon)) 
{
	audio_play_sound(Weapon_station_reloading_itself_rattata,1,false)	//LUIZSOUND plays the charging sound while it is charging
}