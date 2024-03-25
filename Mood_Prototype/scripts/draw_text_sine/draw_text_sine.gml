function draw_text_sine(x, y, stringDisplay, _factor, _spacing, _waveHeight, _kerning)
{
	static _counterReal = 0;
	_counterReal += _factor;
	
	var lengthString = string_length(stringDisplay) + 1;
	
	var l = 7;
	
	var _counterChar = _counterReal;
	for (var i = 1; i < lengthString; i++)
	{
		var _wave = sin(_counterChar) * _waveHeight;
		_counterChar += _spacing;
		
		var currentChar = string_char_at(stringDisplay, i);
		
		var _copyString = stringDisplay;
		var _restString = string_delete(_copyString, i, lengthString);
		var _stringWidth = string_width(_restString);
		draw_text_simple(x + _stringWidth + _kerning * i, y + _wave, currentChar, argument[l]);
	}
	
}