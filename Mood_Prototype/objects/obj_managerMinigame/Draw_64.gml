//draw bg

						
//draw game
switch (game)
{	
	case enumMinigame.HORSESHOE:	draw_sprite_simple(spr_window, 0, GUIwidth * 0.05, GUIheight * 0.05, { xscale : GUIwidth * 0.9, yscale : GUIheight * 0.9, alpha : 0.5 });
	
									if (gameover)
									{
										timerDespawn++;
										if (timerDespawn >= intervalDespawn)
										{
											instance_destroy(obj_horsemanager);
											instance_destroy(obj_horsecollider);
											instance_destroy(obj_horsecolliderCrit);
											instance_destroy();
											
										var _target = enemy.object_index
										
										if(object_is_ancestor(_target, OBJ_enemy))
										{
											with (enemy) switch_state(stateSleep);
										}
										else if(_target == obj_tutorialDummy)
										{										
											_target.executedDummy = true;	
										}
										}
									}
									
									draw_text_simple(GUIwidth * 0.5, GUIheight * 0.15, "Stop at center", { size : 5 * fontscale, color : c_white, font : font_upheaval_scalable });
	break;							
	
	
	case enumMinigame.SQUAREHOLE:	draw_sprite_simple(spr_window, 0, GUIwidth * 0.05, GUIheight * 0.05, { xscale : GUIwidth * 0.9, yscale : GUIheight * 0.9, alpha : 0.5 });
	
									if (formsLeft <= 0) && (!instance_exists(obj_form))
									{							
										with (obj_hole) instance_destroy();
										instance_destroy();
										
										var _target = enemy.object_index
										
										if(object_is_ancestor(_target, OBJ_enemy))
										{
											with (enemy) switch_state(stateSleep);
										}
										else if(_target == obj_tutorialDummy)
										{										
											_target.executedDummy = true;	
										}
									}
									
									draw_text_simple(GUIwidth * 0.5, GUIheight * 0.9, "Drop blocks in holes", { size : 5 * fontscale, color : c_white, font : font_upheaval_scalable });
	break;							
	
	
	case enumMinigame.TUCK:			draw_sprite_simple(spr_window, 0, GUIwidth * 0.05, GUIheight * 0.05, { xscale : GUIwidth * 0.9, yscale : GUIheight * 0.9, alpha : 0.5 });
	
									if (babySleep)
									{
										instance_destroy(obj_blanket);
										instance_destroy(obj_demonbaby);
										instance_destroy(obj_bed);
										
										var _target = enemy.object_index
										
										if(object_is_ancestor(_target, OBJ_enemy))
										{
											with (enemy) switch_state(stateSleep);
										}
										else if(_target == obj_tutorialDummy)
										{											
											_target.executedDummy = true;	
										}
										
										instance_destroy();
									}
									
									draw_text_simple(GUIwidth * 0.5, GUIheight * 0.15, "Tuck In", { size : 5 * fontscale, color : c_white, font : font_upheaval_scalable });
	break;							
	
	
	case enumMinigame.LIGHTSWITCH:	draw_sprite_simple(spr_window, 0, GUIwidth * 0.05, GUIheight * 0.05, { xscale : GUIwidth * 0.9, yscale : GUIheight * 0.9, alpha : 0.5 });
	
									if (switchesActivated == totalSwitches)
									{
										instance_destroy(obj_lightswitch);
										instance_destroy();
										
										var _target = enemy.object_index
										
										if(object_is_ancestor(_target, OBJ_enemy))
										{
											with (enemy) switch_state(stateSleep);
										}
										else if(_target == obj_tutorialDummy)
										{										
											_target.executedDummy = true;	
										}
									}
									
									draw_text_simple(GUIwidth * 0.5, GUIheight * 0.9, "Press Red", { size : 5 * fontscale, color : c_white, font : font_upheaval_scalable });
	break;							
	
	
	case enumMinigame.CABLE:		draw_sprite_simple(spr_window, 0, GUIwidth * 0.05, GUIheight * 0.05, { xscale : GUIwidth * 0.9, yscale : GUIheight * 0.9, alpha : 0.5 });
	
									if (global.number_of_cables == 4)
									{
										
										instance_destroy(obj_admincable)
										instance_destroy(obj_cable_parent)
										instance_destroy(obj_cable_red_end)
										instance_destroy(obj_cable_yellow_end)
										instance_destroy(obj_cable_green_end)
										instance_destroy(obj_cable_blue_end)
										instance_destroy()
										
										if(enemy == OBJ_enemy)
										{
											with (enemy) switch_state(stateSleep);
										}
										else if(enemy == obj_tutorialDummy)
										{
											var _target = layer_instance_get_instance(enemy)
											_target.executedDummy = true;	
										}
									}
									
									draw_text_simple(GUIwidth * 0.5, GUIheight * 0.9, "Connect Cables", { size : 5 * fontscale, color : c_white, font : font_upheaval_scalable });
	break;							
	
	
	case enumMinigame.BRUSH:		draw_sprite_simple(spr_window, 0, GUIwidth * 0.05, GUIheight * 0.05, { xscale : GUIwidth * 0.9, yscale : GUIheight * 0.9, alpha : 0.5 });
	
									if (obj_teethSlider.brushed == 4)
									{
										instance_destroy(obj_teethSlider);
										instance_destroy(obj_teethAnimation);
										instance_destroy();
										
										var _target = enemy.object_index
										
										if(object_is_ancestor(_target, OBJ_enemy))
										{
											with (enemy) switch_state(stateSleep);
										}
										else if(_target == obj_tutorialDummy)
										{											
											_target.executedDummy = true;	
										}
									}
									
									draw_text_simple(GUIwidth * 0.5, GUIheight * 0.9, "Brush", { size : 5 * fontscale, color : c_white, font : font_upheaval_scalable });
	break;							
	
	
	case enumMinigame.STUFF:		draw_sprite_simple(spr_window, 0, GUIwidth * 0.05, GUIheight * 0.05, { xscale : GUIwidth * 0.9, yscale : GUIheight * 0.9, alpha : 0.5 });
	
									if instance_number(obj_fluff)=0
									{
										instance_destroy(obj_pillow);
										instance_destroy();
										
										var _target = enemy.object_index
										
										if(object_is_ancestor(_target, OBJ_enemy))
										{
											with (enemy) switch_state(stateSleep);
										}
										else if(_target == obj_tutorialDummy)
										{											
											_target.executedDummy = true;	
										}
									}
									
									
									draw_text_simple(GUIwidth * 0.5, GUIheight * 0.9, "Stuff the Pillow", { size : 5 * fontscale, color : c_white, font : font_upheaval_scalable });
	break;							
	
	
	case enumMinigame.TICKLE:		draw_sprite_simple(spr_window, 0, GUIwidth * 0.05, GUIheight * 0.05, { xscale : GUIwidth * 0.9, yscale : GUIheight * 0.9, alpha : 0.5 });
	
									if Obj_twitchynose.ticklescore = 5
									{
										instance_destroy(Obj_feather);
										instance_destroy(Obj_twitchynose);
										instance_destroy();
										
										var _target = enemy.object_index
										
										if(object_is_ancestor(_target, OBJ_enemy))
										{
											with (enemy) switch_state(stateSleep);
										}
										else if(_target == obj_tutorialDummy)
										{									
											_target.executedDummy = true;	
										}
									}
									
									draw_text_simple(GUIwidth * 0.5, GUIheight * 0.9, "Tickle", { size : 5 * fontscale, color : c_white, font : font_upheaval_scalable });
	break;							
	
	
	case enumMinigame.INPUTS_RAW:	draw_sprite_simple(spr_window, 0, GUIwidth * 0.05, GUIheight * 0.8, { xscale : GUIwidth * 0.9, yscale : GUIheight * 0.15, alpha : 0.5 });
									
									show_debug_message($" true? {obj_inputs_raw.inputgameend}")
									if obj_inputs_raw.inputgameend = true
									{
										instance_destroy(obj_inputs_raw);
										instance_destroy();
											
										with (broken) fix();
									}
									
									draw_text_simple(GUIwidth * 0.5, GUIheight * 0.9, "Press the Inputs", { size : 5 * fontscale, color : c_white, font : font_upheaval_scalable });
	break;
	
	
	case enumMinigame.INPUTS:		draw_sprite_simple(spr_window, 0, GUIwidth * 0.05, GUIheight * 0.05, { xscale : GUIwidth * 0.9, yscale : GUIheight * 0.9, alpha : 0.5 });
	
									if obj_inputs.inputgameend = true
									{
										instance_destroy(obj_guentheranim);
										instance_destroy(obj_inputs);
										instance_destroy(obj_anim);
										instance_destroy();
											
										var _target = enemy.object_index
										
										if(object_is_ancestor(_target, OBJ_enemy))
										{
											with (enemy) switch_state(stateSleep);
										}
										else if(_target == obj_tutorialDummy)
										{									
											_target.executedDummy = true;	
										}
									}
									
									draw_text_simple(GUIwidth * 0.5, GUIheight * 0.9, "Press the Inputs", { size : 5 * fontscale, color : c_white, font : font_upheaval_scalable });
	break;							
			
	
	case enumMinigame.FASTCLICK:	draw_sprite_simple(spr_window, 0, GUIwidth * 0.05, GUIheight * 0.05, { xscale : GUIwidth * 0.9, yscale : GUIheight * 0.9, alpha : 0.5 });
	
									if 	obj_bubble.fastclickwon = true
									{
										instance_destroy(obj_bubble);
										instance_destroy();
											
										var _target = enemy.object_index
										
										if(object_is_ancestor(_target, OBJ_enemy))
										{
											with (enemy) switch_state(stateSleep);
										}
										else if(_target == obj_tutorialDummy)
										{										
											_target.executedDummy = true;	
										}
									}
									
									draw_text_simple(GUIwidth * 0.5, GUIheight * 0.9, "Press Left Click", { size : 5 * fontscale, color : c_white, font : font_upheaval_scalable });
	break;
}