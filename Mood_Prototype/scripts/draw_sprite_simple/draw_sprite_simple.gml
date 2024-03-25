function draw_sprite_simple(sprite, subimg, x, y)
{
	var xsize = 1;
	var ysize = 1;
	var alpha = 1;
	var angle = 0;
	var color = c_white;
	
	var i = 4;
	if (is_struct(argument[i]))
	{
		var structTextInfo = argument[i];
		if (variable_struct_exists(structTextInfo, "size")) 
		{
			xsize = structTextInfo[$ "size"];
			ysize = structTextInfo[$ "size"];
		}
		if (variable_struct_exists(structTextInfo, "xscale")) xsize = structTextInfo[$ "xscale"];
		if (variable_struct_exists(structTextInfo, "yscale")) ysize = structTextInfo[$ "yscale"];
		if (variable_struct_exists(structTextInfo, "color")) color = structTextInfo[$ "color"];
		if (variable_struct_exists(structTextInfo, "alpha")) alpha = structTextInfo[$ "alpha"];
		if (variable_struct_exists(structTextInfo, "angle")) angle = structTextInfo[$ "angle"];
	}
	
	draw_sprite_ext(sprite, subimg, x, y, xsize, ysize, angle, color, alpha);
}