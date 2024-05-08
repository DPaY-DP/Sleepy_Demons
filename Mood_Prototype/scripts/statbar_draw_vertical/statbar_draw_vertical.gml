function statbar_draw_vertical(_x, _y, _value, _maxValue, length)
{
	//draw settings
	var barAlign = fa_bottom;
	var valign = fa_middle;
	var color1 = c_black;
	var color2 = c_red;
	var displayText = true;
	var displayTextAlign = fa_bottom;
	var width = length / 10;
	var overflow = false;
	
	var i = 5;
	if (is_struct(argument[i]))
	{
		var structStatbarInfo = argument[i];
		if (variable_struct_exists(structStatbarInfo, "barAlign")) barAlign = structStatbarInfo[$ "barAlign"];
		if (variable_struct_exists(structStatbarInfo, "valign")) valign = structStatbarInfo[$ "valign"];
		if (variable_struct_exists(structStatbarInfo, "color1")) color1 = structStatbarInfo[$ "color1"];
		if (variable_struct_exists(structStatbarInfo, "color2")) color2 = structStatbarInfo[$ "color2"];
		if (variable_struct_exists(structStatbarInfo, "displayText")) displayText = structStatbarInfo[$ "displayText"];
		if (variable_struct_exists(structStatbarInfo, "displayTextAlign")) displayTextAlign = structStatbarInfo[$ "displayTextAlign"];
		if (variable_struct_exists(structStatbarInfo, "width")) width = structStatbarInfo[$ "width"];
		if (variable_struct_exists(structStatbarInfo, "overflow")) overflow = structStatbarInfo[$ "overflow"];
	}
	
	//positioning
	var xDraw = _x - width / 2;
	var yDraw = _y - length / 2;
	
	switch(valign)
	{
		case fa_bottom:
		yDraw = _y - length;
		break;
		
		case fa_top:
		yDraw = _y;
		break;
	}
	
	var x2 = xDraw + width;
	var y2 = yDraw + length;
	
	draw_rectangle_color(xDraw, yDraw, x2, y2, color1, color1, color1, color1, false);
	
	var _valueFactor = (_value / _maxValue);
	if (!overflow) _valueFactor = clamp(_valueFactor, 0, 1);
	
	switch(barAlign)
	{
		case fa_bottom:
		var yStat = y2 - length * _valueFactor;
	
		if (_valueFactor != 0) draw_rectangle_color(x2, y2, xDraw, yStat, color2, color2, color2, color2, false);
		break;
		
		case fa_top:
		var yStat = yDraw + length * _valueFactor;
	
		if (_valueFactor != 0) draw_rectangle_color(xDraw, yDraw, x2, yStat, color2, color2, color2, color2, false);
		break;
	}
	
	if (displayText)
	{
		var yText = y2;
		var structTextInfo = {};
		if (is_struct(argument[i + 1])) structTextInfo = argument[i + 1];
		
		if (!variable_struct_exists(structTextInfo, "valign")) structTextInfo[$ "valign"] = fa_bottom;
		if (!variable_struct_exists(structTextInfo, "color")) structTextInfo[$ "color"] = c_white;
		
		switch (displayTextAlign)
		{
			case fa_middle:
			yText = y2 - length / 2;
			structTextInfo[$ "valign"] = fa_middle;
			break;
			
			case fa_top:
			yText = y2 - length;
			structTextInfo[$ "valign"] = fa_top;
			break;
		}
		
		draw_text_simple(_x, yText, string(_value) + " / " + string(_maxValue), structTextInfo);
	}
	
}