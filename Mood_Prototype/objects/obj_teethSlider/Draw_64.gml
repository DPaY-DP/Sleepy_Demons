

draw_self();

draw_sprite_part_ext(spr_foam, 1, -8, 24, sprite_get_width(sprite_index) * value_-4, sprite_height-2, x-6 ,y-sprite_get_yoffset(sprite_index), 4, 4, c_white, 1);
draw_sprite_ext(spr_mouthBorder,0, xMouth, yMouth, 4, 4, 0, c_white, 1);
draw_sprite_ext(spr_brush, 0, xMouth+sprite_width*value_-40, yMouth+24, 4, 4, 0, c_white, 1);