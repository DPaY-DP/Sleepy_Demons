var _font = draw_get_font();
draw_text_simple(x, y, damage, { font : font_dmg, color : color, alpha : alpha, size : 0.2 + (damage * 0.1 / 6) });
draw_set_font(_font)

//draw_self();