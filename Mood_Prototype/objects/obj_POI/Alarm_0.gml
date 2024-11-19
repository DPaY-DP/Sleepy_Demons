with (obj_env) 
{
	
		show_debug_message($"Attempting POI setup: room POI: {other.inRoom}; env: {inRoom}")
		
	if (inRoom == other.inRoom) 
	{
		array_push(POIs, other.id);
		other.owner = id;
	}
}