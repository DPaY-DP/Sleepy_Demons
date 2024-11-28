with (OBJ_env) 
{
	if (inRoom == other.inRoom) 
	{
		array_push(POIs, other.id);
		other.owner = id;
	}
}