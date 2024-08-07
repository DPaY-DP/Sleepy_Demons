//appearance
image_xscale = 4 * global.GUIScale;
image_yscale = 4 * global.GUIScale;


//values
picked = false;
droppable = false;
placed = false;

allNailed = false;

offsetXPicked = 0;
offsetYPicked = 0;


//methods
spawn_screws = function()
{
	var _x0 = x - sprite_width * 0.4;
	var _x1 = x + sprite_width * 0.4;
	var _y0 = y - sprite_height * 0.3;
	var _y1 = y + sprite_height * 0.3;
	
	myScrews = [];
	array_push(myScrews, instance_create_depth(_x0, _y0, depth - 10, obj_gamescrew, { owner : id }));
	array_push(myScrews, instance_create_depth(_x0, _y1, depth - 10, obj_gamescrew, { owner : id }));
	array_push(myScrews, instance_create_depth(_x1, _y0, depth - 10, obj_gamescrew, { owner : id }));
	array_push(myScrews, instance_create_depth(_x1, _y1, depth - 10, obj_gamescrew, { owner : id }));
}