function tick_to_frame(_tick, _maxticks, _endframe)
{
	var _tickProgress = _tick / _maxticks;
	
	return round(_endframe * _tickProgress);
}