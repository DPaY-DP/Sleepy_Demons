var _portWidth = view_get_wport(0);
var _portHeight = view_get_hport(0);
		
//draw game
switch (game)
{
	case "tunnel":		draw_sprite_simple(spr_window, 0, _portWidth * 0.05, _portHeight * 0.05, 
						{ xscale : _portWidth * 0.9, yscale : _portHeight * 0.9 });
	
						if (!spawnedScrews)
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
	
	case "horseshoe":	draw_sprite_simple(spr_window, 0, _portWidth * 0.05, _portHeight * 0.05, 
						{ xscale : _portWidth * 0.9, yscale : _portHeight * 0.9 });
						
						if (gameover)
						{
							timerDespawn++;
							if (timerDespawn >= intervalDespawn)
							{
								instance_destroy(obj_horseshoe);
								instance_destroy(obj_horseshoeColliderLeft);
								instance_destroy(obj_horseshoeColliderRight);
								instance_destroy();
							
								if (won)
								{
									instance_destroy(enemy);
								}
								else with (enemy) 
								{
									hp = hpMax / 2;
									switch_state(stateFlee);
								}
							}
						}
	break;
	
	case "squarehole":	draw_sprite_simple(spr_window, 0, _portWidth * 0.05, _portHeight * 0.05, 
						{ xscale : _portWidth * 0.9, yscale : _portHeight * 0.9 });
						
						if (formsLeft <= 0) && (!instance_exists(obj_form))
						{							
							with (obj_hole) instance_destroy();
							instance_destroy(enemy);
							instance_destroy();
						}
	break;
	
	case "tuck":		draw_sprite_simple(spr_window, 0, _portWidth * 0.05, _portHeight * 0.05, 
						{ xscale : _portWidth * 0.9, yscale : _portHeight * 0.9 });
						
						if (babySleep)
						{
							instance_destroy(obj_blanket);
							instance_destroy(obj_demonbaby);
							instance_destroy(obj_bed);
							instance_destroy(enemy);
							instance_destroy();
						}
	break;
	
	case "lightswitch":	draw_sprite_simple(spr_window, 0, _portWidth * 0.05, _portHeight * 0.05, 
						{ xscale : _portWidth * 0.9, yscale : _portHeight * 0.9 });
						
						if (switchesActivated == totalSwitches)
						{
							instance_destroy(obj_lightswitch);
							instance_destroy(enemy);
							instance_destroy();
						}
	break;
}