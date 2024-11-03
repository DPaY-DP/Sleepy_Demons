if (!active) exit;

if (instance_number(obj_projectilePortal_lingering) == 2)
{
	var _id = id;
	var _portal = undefined;
	with (object_index) if (id != _id) _portal = id;
	
	other.x = _portal.x;
	other.y = _portal.y;
	
	_portal.image_blend = c_grey;
	_portal.active = false;
	_portal.timerActive = _portal.intervalActive;
}