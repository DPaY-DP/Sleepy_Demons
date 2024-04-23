//initialize game
switch (game)
{
	case "tunnel":		//values
						holdingBoard = false;
						spawnedScrews = false;
						
						//spawn tunnel and boards
						var _portWidth = view_get_wport(0);
						var _portHeight = view_get_hport(0);

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
	
	case "finisher":	game = choose("horseshoe", "squarehole", "tuck", "lightswitch");
	
						switch (game)
						{
							case "horseshoe":	var _size = 5;
												var _xSpawn = view_get_wport(0) / 2 + sprite_get_width(spr_horseshoe) * _size / 2;
												var _ySpawn = view_get_hport(0) / 2 - sprite_get_height(spr_horseshoe) * _size / 2;
	
												instance_create_depth(_xSpawn, _ySpawn, depth - 10, obj_horseshoe, { size : _size });
						
												gameover = false;
												won = false;
						
												timerDespawn = 0;
												intervalDespawn = 30;
							break;
	
							case "squarehole":	grabbedObject = noone;
												formsLeft = 4;
						
												instance_create_depth(x, y, depth - 10, obj_form, { form : "circle" });
												instance_create_depth(x, y, depth - 10, obj_form, { form : "square" });
												instance_create_depth(x, y, depth - 10, obj_form, { form : "star" });
												instance_create_depth(x, y, depth - 10, obj_form, { form : "triangle" });
						
												instance_create_depth(x, y, depth - 5, obj_hole, { form : "circle" });
												instance_create_depth(x, y, depth - 5, obj_hole, { form : "square" });
												instance_create_depth(x, y, depth - 5, obj_hole, { form : "star" });
												instance_create_depth(x, y, depth - 5, obj_hole, { form : "triangle" });
							break;
	
							case "tuck":		babySleep = false;
												timerDespawn = 120;
						
												var _size = 5;
												var _xSpawn = view_get_wport(0) / 4;
												var _ySpawn = view_get_hport(0) / 2;
						
												instance_create_depth(_xSpawn, _ySpawn, depth - 10, obj_blanket, { size : _size });
												instance_create_depth(_xSpawn * 3, _ySpawn, depth - 5, obj_demonbaby, { size : _size });
							break;
	
							case "lightswitch":	switchesActivated = 0;
												totalSwitches = 5 + irandom(2);
						
												repeat (totalSwitches)
												{
													var _x = view_get_wport(0) * 0.15 + random(view_get_wport(0) * 0.7);
													var _y = view_get_hport(0) * 0.15 + random(view_get_hport(0) * 0.7);

													instance_create_depth(_x, _y, depth - 20, obj_lightswitch);
												}
							break;
						}
	break;
}