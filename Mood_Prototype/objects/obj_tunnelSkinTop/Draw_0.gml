draw_self();

if(tunnel.sabotaged)
{
	var _curIndex = image_index;
	sprite_index = spr_tunnelTopStuffed;
	image_index = _curIndex;
}
else 
{
	var _curIndex = image_index;
	sprite_index = spr_tunnelTop;
	image_index = _curIndex;
}