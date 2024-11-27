function array_append(_targetArray, _sourceArray, _indexStart = 0)
{
	var _lengthTarget = array_length(_targetArray);
	var _lengthSource = array_length(_sourceArray);
	
	for (var i = _indexStart; i < _lengthSource; i++)
	{
		_targetArray[_lengthTarget + i - _indexStart] = _sourceArray[i];
	}
}