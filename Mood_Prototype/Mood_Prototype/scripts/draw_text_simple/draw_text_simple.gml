function draw_text_simple(x, y, stringDisplay)
{
	var color = c_black;
	var size = 1;
	var halign = fa_center;
	var valign = fa_middle;
	var alpha = 1;
	var angle = 0;
	var drawShadow = false;
	var font = undefined;
	
	var i = 3;
	if (argument_count > i)
	{
		var structTextInfo = argument[i];
		if (variable_struct_exists(structTextInfo, "size")) size = structTextInfo[$ "size"];
		if (variable_struct_exists(structTextInfo, "color")) color = structTextInfo[$ "color"];
		if (variable_struct_exists(structTextInfo, "halign")) halign = structTextInfo[$ "halign"];
		if (variable_struct_exists(structTextInfo, "valign")) valign = structTextInfo[$ "valign"];
		if (variable_struct_exists(structTextInfo, "alpha")) alpha = structTextInfo[$ "alpha"];
		if (variable_struct_exists(structTextInfo, "angle")) angle = structTextInfo[$ "angle"];
		if (variable_struct_exists(structTextInfo, "font")) font = structTextInfo[$ "font"];
		if (variable_struct_exists(structTextInfo, "shadow"))
		{
			drawShadow = true;
			
			var structShadow = structTextInfo.shadow;
			if (variable_struct_exists(structShadow, "offset"))
			{
				var shadowOffsetX = structShadow.offset;
				var shadowOffsetY = structShadow.offset;
			}
			else
			{
				var shadowOffsetX = structShadow.offsetX;
				var shadowOffsetY = structShadow.offsetY;
			}				
			var shadowColor = c_dkgray;
			if (variable_struct_exists(structShadow, "color")) shadowColor = structShadow[$ "color"];
			var shadowAlpha = 1;
			if (variable_struct_exists(structShadow, "alpha")) shadowAlpha = structShadow[$ "alpha"];
		}
	}
	
	draw_set_halign(halign);
	draw_set_valign(valign);
	
	if (font != undefined) draw_set_font(font);
	
	if (drawShadow) draw_text_transformed_color(x + shadowOffsetX, y + shadowOffsetY, stringDisplay, 1, 1, angle, shadowColor, shadowColor, shadowColor, shadowColor, shadowAlpha);
	draw_text_transformed_color(x, y, stringDisplay, size, size, angle, color, color, color, color, alpha);
}