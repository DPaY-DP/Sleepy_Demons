draw_self();
state.draw();

//hp bar
draw_hpbar(2);

if (global.debugmode)
{	
	draw_text_simple(x, y - 16, inRoom.number, { color : c_red, font : font_upheaval_scalable, size : fontscale * 4 });
	
	draw_text_simple(x, y, state.name, { color : c_red, font : font_upheaval_scalable, size : fontscale * 4 });
	if (state.name == "Playing") draw_text_simple(x, y + 64, $"{timerPlaying}\n{timerReady}", { color : c_red, font : font_upheaval_scalable, size : fontscale * 1 });
	if (state.name == "Walk") draw_text_simple(x, y + 64, intent, { color : c_red, font : font_upheaval_scalable, size : fontscale * 2 });
	if (state.name == "Instigate") 
	{
		if (timerInstigate < 300) && (!done) draw_text_simple(x, y + 64, "active", { color : c_red, font : font_upheaval_scalable, size : fontscale * 1 });
		if (done) draw_text_simple(x, y + 64, "catching breath", { color : c_red, font : font_upheaval_scalable, size : fontscale * 1 });
	}
	
	draw_text_simple(x, y + 128, inRoom.number, { color : c_green, font : font_upheaval_scalable, size : fontscale * 2 });
}