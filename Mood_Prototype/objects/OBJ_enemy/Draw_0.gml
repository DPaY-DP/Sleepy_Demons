draw_self();
state.draw();

//hp bar
draw_hpbar(1);

if (global.debugmode)
{	
	draw_text_simple(x, y, state.name, { color : c_red, font : font_upheaval_scalable, size : fontscale * 4 });
	if (state.name == "Playing") draw_text_simple(x, y + 64, $"{timerPlaying}\n{timerReady}", { color : c_red, font : font_upheaval_scalable, size : fontscale * 1 });
	if (state.name == "Walk") draw_text_simple(x, y + 64, intent, { color : c_red, font : font_upheaval_scalable, size : fontscale * 2 });
	if (state.name == "Sabotage") 
	{
		if (timerCackle < 300)		draw_text_simple(x, y + 64, "cackling", { color : c_red, font : font_upheaval_scalable, size : fontscale * 1 });
		else if (inSaboPosition)	draw_text_simple(x, y + 64, "READY", { color : c_red, font : font_upheaval_scalable, size : fontscale * 1 });
		else						draw_text_simple(x, y + 64, "not ready to sabotage", { color : c_red, font : font_upheaval_scalable, size : fontscale * 1 });
	}
	if (state.name == "Instigate") 
	{
		if (timerInstigate < 300) && (!done)	draw_text_simple(x, y + 64, "active", { color : c_red, font : font_upheaval_scalable, size : fontscale * 1 });
		if (done)								draw_text_simple(x, y + 64, "catching breath", { color : c_red, font : font_upheaval_scalable, size : fontscale * 1 });
	}
	
	draw_text_simple(x, y + 128, inRoom.number, { color : c_green, font : font_upheaval_scalable, size : fontscale * 2 });
}