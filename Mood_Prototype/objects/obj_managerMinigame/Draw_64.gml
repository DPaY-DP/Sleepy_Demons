//draw bg
draw_sprite_simple(spr_window, 0, GUIwidth * 0.05, GUIheight * 0.05, { xscale : GUIwidth * 0.9, yscale : GUIheight * 0.9, alpha : 0.5 });
						
//draw game
switch (game)
{
	case "tunnel":		if (!spawnedScrews)
						{
							var _spawnedScrews = true;
							with (obj_gameboard) if (!placed) _spawnedScrews = false;

							if (_spawnedScrews) 
							{
								with (obj_gameboard) spawn_screws();
								spawnedScrews = true;
							}
						}
						else
						{
							var _allNailed = true;
							with (obj_gameboard) if (!allNailed) _allNailed = false;
	
							if (_allNailed) 
							{
								instance_destroy(obj_gametunnel);
								instance_destroy(obj_gametunnelBumperLeft);
								instance_destroy(obj_gametunnelBumperRight);
								instance_destroy(obj_gameboard);
								instance_destroy(obj_gamescrew);
								instance_destroy();
		
								tunnel.sabotaged = true;
							}
						}
	break;
	
	case "horseshoe":	if (gameover)
						{
							timerDespawn++;
							if (timerDespawn >= intervalDespawn)
							{
								instance_destroy(obj_horsemanager);
								instance_destroy(obj_horsecollider);
								instance_destroy(obj_horsecolliderCrit);
								instance_destroy();
							
								with (enemy) switch_state(stateSleep);
							}
						}
						
						draw_text_simple(GUIwidth * 0.5, GUIheight * 0.15, "Stop at center", { size : 5 * fontscale, color : c_white, font : font_upheaval_scalable });
	break;
	
	case "squarehole":	if (formsLeft <= 0) && (!instance_exists(obj_form))
						{							
							with (obj_hole) instance_destroy();
							instance_destroy();
							
							with (enemy) switch_state(stateSleep);
						}
						
						draw_text_simple(GUIwidth * 0.5, GUIheight * 0.9, "White to Gray", { size : 5 * fontscale, color : c_white, font : font_upheaval_scalable });
	break;
	
	case "tuck":		if (babySleep)
						{
							instance_destroy(obj_blanket);
							instance_destroy(obj_demonbaby);
							instance_destroy(obj_bed);
							instance_destroy();
							
							with (enemy) switch_state(stateSleep);
						}
						
						draw_text_simple(GUIwidth * 0.5, GUIheight * 0.15, "Tuck In", { size : 5 * fontscale, color : c_white, font : font_upheaval_scalable });
	break;
	
	case "lightswitch":	if (switchesActivated == totalSwitches)
						{
							instance_destroy(obj_lightswitch);
							instance_destroy();
							
							with (enemy) switch_state(stateSleep);
						}
						
						draw_text_simple(GUIwidth * 0.5, GUIheight * 0.9, "Press Red", { size : 5 * fontscale, color : c_white, font : font_upheaval_scalable });
	break;
}