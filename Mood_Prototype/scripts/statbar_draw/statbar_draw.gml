function statbar_draw(_x, _y, _value, _maxValue, size)
{
	//draw settings
	var halign = fa_center;
	var color1 = c_black;
	var color2 = c_red;
	var displayText = true;
	var displayTextAlign = fa_right;
	var height = size / 10;
	
	var i = 5;
	if (is_struct(argument[i]))
	{
		var structStatbarInfo = argument[i];
		if (variable_struct_exists(structStatbarInfo, "halign")) halign = structStatbarInfo[$ "halign"];
		if (variable_struct_exists(structStatbarInfo, "color1")) color1 = structStatbarInfo[$ "color1"];
		if (variable_struct_exists(structStatbarInfo, "color2")) color2 = structStatbarInfo[$ "color2"];
		if (variable_struct_exists(structStatbarInfo, "displayText")) displayText = structStatbarInfo[$ "displayText"];
		if (variable_struct_exists(structStatbarInfo, "displayTextAlign")) displayTextAlign = structStatbarInfo[$ "displayTextAlign"];
		if (variable_struct_exists(structStatbarInfo, "height")) height = structStatbarInfo[$ "height"];
	}
	
	//positioning
	var xDraw = _x - size / 2;
	var yDraw = _y - height / 2;
	switch(halign)
	{
		case fa_left:
		xDraw = _x;
		break;
		
		case fa_right:
		xDraw = _x + size;
		break;
	}
	
	var x2 = xDraw + size;
	var y2 = yDraw + height;
	
	draw_rectangle_color(xDraw, yDraw, x2, y2, color1, color1, color1, color1, false);
	
	var xStat = xDraw + size * (_value / _maxValue);
	
	draw_rectangle_color(xDraw, yDraw, xStat, y2, color2, color2, color2, color2, false);
	
	if (displayText)
	{
		var xText = x2;
		var structTextInfo = {};
		if (is_struct(argument[i + 1])) structTextInfo = argument[i + 1];
		
		if (!variable_struct_exists(structTextInfo, "halign")) structTextInfo[$ "halign"] = fa_right;
		if (!variable_struct_exists(structTextInfo, "color")) structTextInfo[$ "color"] = c_white;
		
		switch (displayTextAlign)
		{
			case fa_middle:
			xText = x2 - size / 2;
			structTextInfo[$ "halign"] = fa_center;
			break;
			
			case fa_left:
			xText = x2 - size;
			structTextInfo[$ "halign"] = fa_left;
			break;
		}
		
		draw_text_simple(xText , _y, string(_value) + " / " + string(_maxValue), structTextInfo);
	}
	
}