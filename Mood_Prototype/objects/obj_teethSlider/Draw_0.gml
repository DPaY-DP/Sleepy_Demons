/// @description Draw Slider

draw_self();

draw_sprite_part_ext(spr_foam, 1, -6, 24, 4*  sprite_width * value_-24, sprite_height-2, x-6 ,y-sprite_get_yoffset(sprite_index), 4, 4, c_white, 1);
draw_sprite_ext(spr_mouthBorder,0, xMouth, yMouth, 4, 4, 0, c_white, 1);
draw_sprite_ext(spr_brush, 0, xMouth+sprite_width*value_, yMouth, 4, 4, 0, c_white, 1);

show_debug_message(value_);