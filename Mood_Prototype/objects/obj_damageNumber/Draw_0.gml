var _size = (0.2 + (damage * 0.1 / 6)) * 15 * fontscale;
_size = clamp(_size, 0, 2);

draw_text_simple(x, y, damage, { font : font_upheaval_scalable, color : color, alpha : alpha, size : _size });

//draw_self();