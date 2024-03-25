function dir_split(dir)
{	
	if (dir > 90) && (dir <= 180)
	{
		return (dir - 180) * -1;
	}
	if (dir > 180) && (dir <= 270)
	{
		return (dir - 180);
	}
	if (dir > 270)
	{
		return (dir - 360) * -1;
	}
	return dir;
}
