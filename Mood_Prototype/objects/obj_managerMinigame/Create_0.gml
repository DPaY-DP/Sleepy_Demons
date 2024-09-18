#macro GUIWidth display_get_gui_width()
#macro GUIHeight display_get_gui_height()

//initialize game
switch (game)
{
	case "tunnel":		//values
						holdingBoard = false;
						spawnedScrews = false;
						
						//spawn tunnel and boards
						var _portWidth = GUIWidth;
						var _portHeight = GUIHeight;

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
	
	case "finisher":	game = choose("horseshoe", "tuck", "lightswitch", "squarehole");
						//game = "squarehole";
						
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
												formsLeft = 4;
						
												instance_create_depth(x, y, depth - 5, obj_hole, { form : "circle" });
												instance_create_depth(x, y, depth - 5, obj_hole, { form : "square" });
												instance_create_depth(x, y, depth - 5, obj_hole, { form : "star" });
												instance_create_depth(x, y, depth - 5, obj_hole, { form : "triangle" });
						
												instance_create_depth(x, y, depth - 10, obj_form, { form : "circle" });
												instance_create_depth(x, y, depth - 10, obj_form, { form : "square" });
												instance_create_depth(x, y, depth - 10, obj_form, { form : "star" });
												instance_create_depth(x, y, depth - 10, obj_form, { form : "triangle" });
							break;
	
							case "tuck":		babySleep = false;
												timerDespawn = 120;
						
												var _size = 5;
												var _xSpawn = GUIWidth / 4;
												var _ySpawn = GUIHeight / 2;
						
												instance_create_depth(_xSpawn, _ySpawn, depth - 10, obj_blanket, { size : _size });
												instance_create_depth(_xSpawn * 3, _ySpawn, depth - 5, obj_demonbaby, { size : _size });
												instance_create_depth(_xSpawn * 3, _ySpawn, depth - 4, obj_bed, { size : _size });
							break;
	
							case "lightswitch":	switchesActivated = 0;
												totalSwitches = 5 + irandom(2);
						
												repeat (totalSwitches)
												{
													var _x = GUIWidth * 0.2 + random(GUIWidth * 0.6);
													var _y = GUIHeight * 0.2 + random(GUIHeight * 0.6);

													instance_create_depth(_x, _y, depth - 20, obj_lightswitch);
												}
							break;
						}
	break;
}