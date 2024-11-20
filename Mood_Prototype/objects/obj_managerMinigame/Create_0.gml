randomize();

with (OBJ_weapon) canShoot = false;

//initialize game
if (!variable_instance_exists(id, "game"))
game = array_pop(obj_managerGame.arrayMinigames);

switch (game)
{	
	case enumMinigame.HORSESHOE:	var _size = 5;
	
									instance_create_depth(0, 0, depth - 10, obj_horsemanager, { size : _size });
						
									gameover = false;
									won = false;
						
									timerDespawn = 0;
									intervalDespawn = 30;
	break;
	
	
	case enumMinigame.SQUAREHOLE:	grabbedObject = noone;
									formsLeft = 3;
												
									_xSpawn = GUIwidth
									_ySpawn = GUIheight
												
									var forms = ["circle", "square", "star"];
									//array_delete(forms, irandom(3), 1);
												
									var xpos_start = [_xSpawn * 0.2,_xSpawn * 0.5,_xSpawn * 0.8,]
		
									for (i = 0; i < 3; i++)
									{

										var chosen_index = irandom( array_length(xpos_start) - 1 );
										var chosen_option_x = xpos_start[chosen_index]
		
	

										instance_create_depth(chosen_option_x,_ySpawn * 0.2, 10, obj_hole, { form : forms[i] });
										array_delete(xpos_start, chosen_index, 1)
									}
		
									var xpos_end = [_xSpawn * 0.2,_xSpawn * 0.5,_xSpawn * 0.8,]
		
									for (i = 0; i < 3; i++)
									{

										var chosen_index = irandom( array_length(xpos_end) - 1 );
										var chosen_option_x = xpos_end[chosen_index]
		
										instance_create_depth(chosen_option_x,_ySpawn * 0.8, 5, obj_form, { form : forms[i] });
										array_delete(xpos_end, chosen_index, 1)
									}
	break;
	
	
	case enumMinigame.TUCK:			babySleep = false;
									timerDespawn = 120;
									
									var _size = 5;
									var _xSpawn = GUIwidth / 4;
									var _ySpawn = GUIheight / 2;
									
									instance_create_depth(_xSpawn, _ySpawn, depth - 10, obj_blanket, { size : _size });
									instance_create_depth(_xSpawn * 3, _ySpawn, depth - 5, obj_demonbaby, { size : _size });
									instance_create_depth(_xSpawn * 3, _ySpawn, depth - 4, obj_bed, { size : _size });
	break;							
			
			
	case enumMinigame.LIGHTSWITCH:	switchesActivated = 0;
									totalSwitches = 9 //5 + irandom(2);
									
									_xSpawn = GUIwidth
									_ySpawn = GUIheight
																										
									xpos_start = [_xSpawn * 0.2,_xSpawn * 0.5,_xSpawn * 0.8,_xSpawn * 0.2,_xSpawn * 0.5,_xSpawn * 0.8,_xSpawn * 0.2,_xSpawn * 0.5,_xSpawn * 0.8]
									ypos_start = [_ySpawn * 0.2,_ySpawn * 0.2,_ySpawn * 0.2,_ySpawn * 0.5,_ySpawn * 0.5,_ySpawn * 0.5,_ySpawn * 0.8,_ySpawn * 0.8,_ySpawn * 0.8]
									
									for (i = 0; i < 9; i++)
									{
									
										var chosen_index = irandom( array_length(xpos_start) - 1 );
										var chosen_option_x = xpos_start[chosen_index]
										var chosen_option_y = ypos_start[chosen_index]
									
									
									
										instance_create_depth(chosen_option_x,chosen_option_y, 10, obj_lightswitch);
										array_delete(xpos_start, chosen_index, 1)
										array_delete(ypos_start, chosen_index, 1)
									}
															
									//instance_create_depth(400, 400, depth - 20, obj_lightswitch);
									//instance_create_depth(600, 600, depth - 20, obj_lightswitch);
									//instance_create_depth(800, 800, depth - 20, obj_lightswitch);
									//instance_create_depth(450, 450, depth - 20, obj_lightswitch);
									//instance_create_depth(200, 200, depth - 20, obj_lightswitch);
									//instance_create_depth(650, 650, depth - 20, obj_lightswitch);
									//instance_create_depth(800, 600, depth - 20, obj_lightswitch);
														
	break;							
			
			
	case enumMinigame.BRUSH:		brushed = 0;	
															
									var _xSpawn = GUIwidth / 2;
									var _ySpawn = GUIheight /2;
									instance_create_depth(_xSpawn, _ySpawn, depth -20, obj_teethSlider);
							
	break;
				
				
	case enumMinigame.CABLE:		instance_create_depth(0, 0, depth -20, obj_admincable);
									instance_create_depth(0, 0, depth -20, obj_cable_parent);
							
	break;
				
				
	case enumMinigame.STUFF:		repeat(5) instance_create_depth(x, y, depth - 20, obj_fluff);
									instance_create_depth(camX, camY + camHeight * 0.5, depth -20, obj_pillow);
	break;
					
					
	case enumMinigame.TICKLE:		instance_create_depth(x, y, depth -20, Obj_twitchynose);
									instance_create_depth(x, y, depth -20, Obj_feather);					
	break;
					
					
	case enumMinigame.INPUTS:		var _y = GUIheight / 2;	var _x = GUIwidth / 2 ;
									instance_create_depth(_x, _y, depth -20, obj_guentheranim);	
									instance_create_depth(x, y, depth -20, obj_inputs);
	break;			
					
					
	case enumMinigame.INPUTS_RAW:	instance_create_depth(x, y, depth -20, obj_inputs_raw);
	break;						
	
	
	case enumMinigame.FASTCLICK:	var _y = GUIheight / 2;	var _x = GUIwidth / 2 ;
									instance_create_depth(_x, _y, depth -20, obj_guentheranim,);				
									instance_create_depth(_x, _y, depth -20, obj_bubble);	
	break;
}