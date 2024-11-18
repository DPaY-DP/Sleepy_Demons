//IMMUTABLE VALUES
hpDrain = 0.1;

inRoom = instance_place(x, y, obj_room);
with (obj_env) if (inRoom == other.inRoom) 
{
	array_push(POIs, other.id);
	other.owner = id;
}

rangeInteract = 25;


//GAME VALUES
image_speed = 0;
applyDamage = false;


//METHODS



//STATES


