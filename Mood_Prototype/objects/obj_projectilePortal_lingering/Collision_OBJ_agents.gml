if (!active) exit;

if (instance_number(obj_projectilePortal_lingering) == 2)
{
	var _id = id;
	var _portal = undefined;
	with (object_index) if (id != _id) _portal = id;
	
	other.x = _portal.x;
	other.y = _portal.y;
	
	var _dir = 0;
	var _threshold = 48;
	
	for (var i = 0; i < 8; i++)
	{
		var _x = other.x + lengthdir_x(_threshold, _dir);
		var _y = other.y + lengthdir_y(_threshold, _dir);
		
		with (other) if (!place_meeting(_x, _y, obj_wall)) break;
		else _dir += 90;
		
		if (_dir == 360) _dir = 45;
	}
	
	with (other) 
	{
		while (place_meeting(x, y, obj_wall))
		{
			x += lengthdir_x(1, _dir);
			y += lengthdir_y(1, _dir);
		}
		
		hvel += lengthdir_x(20, _dir);
		vvel += lengthdir_y(20, _dir);
	}
	
	_portal.image_blend = c_grey;
	_portal.active = false;
	_portal.timerActive = _portal.intervalActive;
}