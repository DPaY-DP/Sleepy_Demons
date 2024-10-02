

draw_sprite_simple(spr_horseshoe, 0, xHorse, yHorse, { size : size });

if (indicator > 3) indicator = 3;
draw_sprite_simple(spr_horseshoeIndicator, indicator, xHorse, yHorse, { size : size });