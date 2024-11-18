amount=5;
randomize();

repeat(amount)
{
	instance_create_depth(x, y, depth - 20, obj_fluff);
}

