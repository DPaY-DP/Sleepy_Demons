show_debug_message("manager minigame spawned")
randomize()

//initialize game
switch (game)
{
	case "tunnel":		//values
						holdingBoard = false;
						spawnedScrews = false;
						
						//spawn tunnel and boards
						var _portWidth = GUIwidth;
						var _portHeight = GUIheight;

						instance_create_depth(_portWidth * 0.5, _portHeight * 0.5, depth - 5, obj_gametunnel);

						repeat (3) 
						{
							do
							{
							var _xSpawn = _portWidth * 0.1 + random(_portWidth) * 0.8;
							var _ySpawn = _portHeight * 0.1 + random(_portHeight) * 0.8;
	
							var _board = instance_create_depth(_xSpawn, _ySpawn, depth - 10, obj_gameboard);
	
							var _spawnedCorrectly = true;
							with (_board) if (place_meeting(x, y, obj_gametunnel))
								{
									_spawnedCorrectly = false;
									instance_destroy();
								}
							}
							until (_spawnedCorrectly)
						}
	break;
	
	case "finisher":	//game = choose("horseshoe", "tuck", "lightswitch", "squarehole");


						
						var _randomminigame = irandom( ds_list_size(obj_managerGame.dslistminigames) - 1 );
						var _minigame = ds_list_find_value(obj_managerGame.dslistminigames, _randomminigame );
						game = _minigame //"lightswitch"
						var _minigame_value = ds_list_find_index(obj_managerGame.dslistminigames, _randomminigame )
						ds_list_delete(obj_managerGame.dslistminigames, _minigame_value );

						show_debug_message(_minigame_value)
						show_debug_message(_randomminigame)
						show_debug_message(ds_list_size(obj_managerGame.dslistminigames))
						
						show_debug_message($"case finisher, game selected: {game}");
						
						//game = "fastclick"
						
						switch (game)
						{
							case "horseshoe":	var _size = 5;
	
												instance_create_depth(0, 0, depth - 10, obj_horsemanager, { size : _size });
						
												gameover = false;
												won = false;
						
												timerDespawn = 0;
												intervalDespawn = 30;
							break;
	
							case "squarehole":	grabbedObject = noone;
												formsLeft = 3;
												
												_xSpawn = GUIwidth
												_ySpawn = GUIheight
												
												forms = ["circle", "square", "star"];
												//array_delete(forms, irandom(3), 1);
												
												xpos_start = [_xSpawn * 0.2,_xSpawn * 0.5,_xSpawn * 0.8,]
		
												for (i = 0; i < 3; i++)
												{

													var chosen_index = irandom( array_length(xpos_start) - 1 );
													var chosen_option_x = xpos_start[chosen_index]
		
	

													instance_create_depth(chosen_option_x,_ySpawn * 0.2, 10, obj_hole, { form : forms[i] });
													array_delete(xpos_start, chosen_index, 1)
												}
		
												xpos_end = [_xSpawn * 0.2,_xSpawn * 0.5,_xSpawn * 0.8,]
		
												for (i = 0; i < 3; i++)
												{

													var chosen_index = irandom( array_length(xpos_end) - 1 );
													var chosen_option_x = xpos_end[chosen_index]
		
	

													instance_create_depth(chosen_option_x,_ySpawn * 0.8, 5, obj_form, { form : forms[i] });
													array_delete(xpos_end, chosen_index, 1)
												}
		
												//instance_create_depth(500, 500, depth - 5, obj_hole, { form : forms[0] });
												//instance_create_depth(700, 700, depth - 5, obj_hole, { form : forms[1] });
												//instance_create_depth(1000, 700, depth - 5, obj_hole, { form : forms[2] });
						
												//instance_create_depth(800, 800, depth - 10, obj_form, { form : forms[0] });
												//instance_create_depth(450, 450, depth - 10, obj_form, { form : forms[1] });
												//instance_create_depth(200, 200, depth - 10, obj_form, { form : forms[2] });
							break;
	
							case "tuck":		babySleep = false;
												timerDespawn = 120;
						
												var _size = 5;
												var _xSpawn = GUIwidth / 4;
												var _ySpawn = GUIheight / 2;
						
												instance_create_depth(_xSpawn, _ySpawn, depth - 10, obj_blanket, { size : _size });
												instance_create_depth(_xSpawn * 3, _ySpawn, depth - 5, obj_demonbaby, { size : _size });
												instance_create_depth(_xSpawn * 3, _ySpawn, depth - 4, obj_bed, { size : _size });
							break;
	
							case "lightswitch":	switchesActivated = 0;
												totalSwitches = 7 //5 + irandom(2);
						
												//repeat (totalSwitches)
												//{
												//	var _x = GUIwidth * 0.2 + random(GUIwidth * 0.6);
												//	var _y = GUIheight * 0.2 + random(GUIheight * 0.6);

												//	instance_create_depth(_x, _y, depth - 20, obj_lightswitch);
												//}
												instance_create_depth(400, 400, depth - 20, obj_lightswitch);
												instance_create_depth(600, 600, depth - 20, obj_lightswitch);
												instance_create_depth(800, 800, depth - 20, obj_lightswitch);
												instance_create_depth(450, 450, depth - 20, obj_lightswitch);
												instance_create_depth(200, 200, depth - 20, obj_lightswitch);
												instance_create_depth(650, 650, depth - 20, obj_lightswitch);
												instance_create_depth(800, 600, depth - 20, obj_lightswitch);
											
							break;
							
							case "brush":		brushed = 0;
							
												
												var _xSpawn = GUIwidth / 2;
												var _ySpawn = GUIheight /2;
												instance_create_depth(_xSpawn, _ySpawn, depth -20, obj_teethSlider);
							
							break;
							
							case "cablegame":	
							
																						
								instance_create_depth(0, 0, depth -20, obj_admincable);
								instance_create_depth(0, 0, depth -20, obj_cable_parent);
							
							break;
							
							case "stuffthepillow":	
								var _xSpawn = GUIwidth / 4;
								var _ySpawn = GUIheight / 3;
																						
								instance_create_depth(x, y, depth -20, obj_stuffthepillowadmin);
								instance_create_depth(_xSpawn * 0.5, _ySpawn, depth -20, obj_pillow);
							
							break;
							
							case "ticklenose":	
														
								instance_create_depth(x, y, depth -20, Obj_twitchynose);
								instance_create_depth(x, y, depth -20, Obj_feather);
							
							break;
							
							case "inputgame":	
														
								instance_create_depth(x, y, depth -20, obj_anim);
								instance_create_depth(x, y, depth -20, obj_inputs);
								var _x = GUIwidth / 2 ;
								var _y = GUIheight / 2;
								instance_create_depth(_x, _y, depth -20, obj_guentheranim,);
								
								
							
							break;
							
							case "fastclick":	
														
								var _x = GUIwidth / 2 ;
								var _y = GUIheight / 2;
								instance_create_depth(_x, _y, depth -20, obj_bubble,);

							
							break;
						}
												
						show_debug_message("setup minigame complete")
	break;
}