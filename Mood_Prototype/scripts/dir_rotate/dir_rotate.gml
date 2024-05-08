function dir_rotate(dir, factor)
{
	var newdir = dir + factor;
	newdir = loop(newdir, 0, 360);
	
	return newdir;
}
