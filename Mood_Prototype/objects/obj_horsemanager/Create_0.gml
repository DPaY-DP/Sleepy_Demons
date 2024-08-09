size = 4 * global.GUIScale;

xHorse = GUIWidth * 0.5;
yHorse = GUIHeight * 0.35;

indicator = 0;

instance_create_depth(xHorse, yHorse, depth - 11, obj_horseslider01, { size : size });
instance_create_depth(xHorse, yHorse, depth - 10, obj_horsecollider, { image_xscale : size, image_yscale : size });
instance_create_depth(xHorse, yHorse, depth - 10, obj_horsecolliderCrit, { image_xscale : size, image_yscale : size });