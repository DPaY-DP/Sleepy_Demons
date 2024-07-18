draw_self();

if (slowed)
{
	timerSlowed--;
	if (timerSlowed <= 20) && (slowedStarFrame mod 4 == 0) slowedStarAlpha *= -1;
	if (timerSlowed <= 0)
	{
		slowed = false;
		slowedStarAlpha = 1;
	}
	
	slowedStarFrame++;
	draw_sprite_simple(spr_stun, floor(slowedStarFrame / 20), x, y - 20, { alpha : slowedStarAlpha });
}


if (variable_instance_exists(id, "drawArrow"))
{
	if (drawArrow != false)
	{
		draw_sprite_simple(spr_arrow, 0, x, y, { angle : drawArrow.goal, color : c_black });
		draw_sprite_simple(spr_arrow, 0, x, y, { angle : drawArrow.move, color : c_green });
		draw_sprite_simple(spr_arrow, 0, x, y, { angle : drawArrow.target, color : c_red });
	}
}


draw_text_simple(x, y, state.name, { color : c_red, size : 2 });
if (state.name == "Walk") draw_text_simple(x, y + 64, intent, { color : c_red, size : 1 });