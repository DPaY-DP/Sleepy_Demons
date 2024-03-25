function array_shuffle(array)
{
	var copy = array;
	var length = array_length(copy);
	var shuffle = [];
	
	for (var i = 0; i < length; i++)
	{
		var _rand = irandom(array_length(copy) - 1);
		shuffle[i] = copy[_rand];
		array_delete(copy, _rand, 1);
	}
	
	return shuffle;
}
