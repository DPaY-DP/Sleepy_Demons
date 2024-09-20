draw_text_simple(GUIwidth * 0.5, GUIheight * 0.15, "Hit the Bars", { size : global.GUIScale, color : c_white, font : font_menu });

draw_sprite_simple(spr_horseshoe, 0, xHorse, yHorse, { size : size });

if (indicator > 3) indicator = 3;
draw_sprite_simple(spr_horseshoeIndicator, indicator, xHorse, yHorse, { size : size });