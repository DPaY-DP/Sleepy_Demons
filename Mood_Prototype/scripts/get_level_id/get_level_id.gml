function get_level_id(_room)
{
	var _length = array_length(global.save.levels);
	for (var i = 0; i < _length; i++)
	{
		if (_room == global.save.levels[i].room) return i
	}
}