if (applyDamage)
{
	global.envHP -= hpDrain;
	
	if (point_distance(x, y, obj_player.x, obj_player.y) < rangeInteract)
	{
		if (keyRepair) 
		{
			image_index = 0;
			image_speed = 0;
			applyDamage = false;
		
			with (owner)
			{
				var _length = array_length(POIsBroken);
				for (var i = 0; i < _length; i++)
				{
					if (POIsBroken[i] == other.id)
					{
						array_push(POIs, POIsBroken[i]);
						array_delete(POIsBroken, i, 1);
						break;
					}
				}
			}
		}
	}
}