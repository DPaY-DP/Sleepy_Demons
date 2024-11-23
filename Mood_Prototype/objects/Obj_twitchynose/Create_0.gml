randomize();

instance_create_depth(x,y,2,Obj_feather)

x = irandom_range(GUIwidth *  0.2, GUIwidth *  0.8);
y = irandom_range(GUIheight * 0.2, GUIheight * 0.8);

image_yscale = 6 * global.GUIScale;
image_xscale = 6 * global.GUIScale;

ticklescore = 0