//modes
switch (mode)
{
	case "main":		
	break;
	
	case "play":			//draw RETURN button at bottom of screen
						var _x = GUIwidth * 0.86;
						var _y = GUIheight * 0.92;
						
						var _xscale = 2 * global.GUIScale;
						var _yscale = 0.5 * global.GUIScale;
							
						var _width = sprite_get_width(spr_buttonBlankSlim) * _xscale;
						var _height = sprite_get_height(spr_buttonBlankSlim) * _yscale;
						
						var _xTop = _x - _width / 2;
						var _yTop = _y - _height / 2;
							
						var _hover = 0;
						if (mouse_in_area_GUI(_xTop, _yTop, _width, _height))
						{
							_hover = 1;
							if (mouse_check_button_pressed(mb_left)) 
							{										
								mode = "main";
							}
						}
						
						draw_sprite_simple(spr_buttonBlankSlim, _hover, _x, _y, { xscale : _xscale, yscale : _yscale })
						draw_text_simple(_x, _y, "Return", { font : font_upheaval_scalable, size : fontscale * 5 });
						
						
							//draw HEADER with LEVEL CATEGORY (Tutorial, Level, Challenge)
						var _lengthLevelSelect = [4, 13, 0];
						
						var _x = GUIwidth / 2;
						var _y = GUIheight * 0.14;
						
						var _xscale = 3.8 * global.GUIScale;
						var _yscale = 0.8 * global.GUIScale;
						
						draw_sprite_simple(spr_buttonBlank, 0, GUIwidth / 2, GUIheight * 0.14, { xscale : _xscale, yscale : _yscale })
						draw_text_simple(_x, _y, selectModes[selectMode], { font : font_upheaval_scalable, size : fontscale * 8 });
						
						
							//draw ARROWS to navigate CATEGORIES
						var _xMouseGUI = device_mouse_x_to_gui(0);
						var _yMouseGUI = device_mouse_y_to_gui(0);
							
						if (selectMode > 0) 
						{
							var _xArrow = _x - 135 * 1.9 * global.GUIScale - 10 * global.GUIScale;
							
							var _sizeArrow = 0.5 * global.GUIScale;
							
							var _width = sprite_get_width(spr_arrow) * _sizeArrow;
							var _height = sprite_get_height(spr_arrow) * _sizeArrow;
							var _xTop = _xArrow - _width;
							var _yTop = _y - _height / 2;
							
							var _hover = 0;
							if (mouse_in_area_GUI(_xTop, _yTop, _width, _height)) || (keyboard_check_pressed(ord("A")))
							{
								_hover = 1;
								if (mouse_check_button_pressed(mb_left)) || (keyboard_check_pressed(ord("A"))) 
								{
									selectMode--;
									selectPage = 0;
								}
							}
							
							draw_sprite_simple(spr_arrow, _hover, _xArrow, _y, { size : -0.5 * global.GUIScale }); //yscale : 0.5 * global.GUIScale });
						}
						
						if (selectMode < 2)
						{
							var _xArrow = _x + 135 * 1.9 * global.GUIScale + 10 * global.GUIScale;
							
							var _sizeArrow = 0.5 * global.GUIScale;
							
							var _width = sprite_get_width(spr_arrow) * _sizeArrow;
							var _height = sprite_get_height(spr_arrow) * _sizeArrow;
							var _xTop = _xArrow;
							var _yTop = _y - _height / 2;
							
							var _hover = 0;
							if (mouse_in_area_GUI(_xTop, _yTop, _width, _height)) || (keyboard_check_pressed(ord("D")))
							{
								_hover = 1;
								if (mouse_check_button_pressed(mb_left)) || (keyboard_check_pressed(ord("D"))) 
								{
									selectMode++;
									selectPage = 0;
								}
							}
							
							draw_sprite_simple(spr_arrow, _hover, _xArrow, _y, { size : 0.5 * global.GUIScale });
						}
						
						
							//draw ARROWS to navigate LEVELS if levels per page > 6
						var _pagesMax = floor((_lengthLevelSelect[selectMode] - 1) / 6);
						
						if (selectPage < _pagesMax) 
						{
							var _xArrow = GUIwidth * 0.87;
							var _yArrow = GUIheight / 2;
							
							var _sizeArrow = 0.5 * global.GUIScale;
							
							var _width = sprite_get_width(spr_arrow) * _sizeArrow;
							var _height = sprite_get_height(spr_arrow) * _sizeArrow;
							var _xTop = _xArrow;
							var _yTop = _yArrow - _width / 2;
							
							var _hover = 0;
							if (mouse_in_area_GUI(_xTop, _yTop, _width, _height))
							{
								_hover = 1;
								if (mouse_check_button_pressed(mb_left))
								{
									selectPage++;
								}
							}
							
							draw_sprite_simple(spr_arrow, _hover, _xArrow, _yArrow, { size : 0.5 * global.GUIScale }); //yscale : 0.5 * global.GUIScale });
						}
						
						if (selectPage > 0) 
						{
							var _xArrow = GUIwidth * 0.13;
							var _yArrow = GUIheight / 2;
							
							var _sizeArrow = 0.5 * global.GUIScale;
							
							var _width = sprite_get_width(spr_arrow) * _sizeArrow;
							var _height = sprite_get_height(spr_arrow) * _sizeArrow;
							var _xTop = _xArrow - _width;
							var _yTop = _yArrow - _width / 2;
							
							var _hover = 0;
							if (mouse_in_area_GUI(_xTop, _yTop, _width, _height))
							{
								_hover = 1;
								if (mouse_check_button_pressed(mb_left))
								{
									selectPage--;
								}
							}
							
							draw_sprite_simple(spr_arrow, _hover, _xArrow, _yArrow, { size : -0.5 * global.GUIScale }); //yscale : 0.5 * global.GUIScale });
						}
						
						
							//draw LEVELS
						var _indexLevel = 0;
						for (var i = selectMode; i > 0; i--)
						{
							_indexLevel += _lengthLevelSelect[i - 1];
						}
						
						var _column = 0;
						var _row = 0;
						for (var i = _indexLevel + selectPage * 6; i < _indexLevel + _lengthLevelSelect[selectMode]; i++)
						{
							var _levelData = global.save.levels[i];
							
							var _x = GUIwidth * 0.25 + GUIwidth * 0.25 * _column;
							var _y = GUIheight * 0.37 + GUIheight * 0.305 * _row;
							
							var _xscale = 2 * global.GUIScale;
							var _yscale = 1.3 * global.GUIScale;
							
							var _width = sprite_get_width(spr_buttonBlankSlimEmpty) * _xscale;
							var _height = sprite_get_height(spr_buttonBlankSlimEmpty) * _yscale;
							
							var _xscaleFactor = _width / sprite_get_width(_levelData.sprite);
							var _yscaleFactor = _height / sprite_get_height(_levelData.sprite);
								
									//Check for COMPLETION
							var _unlocked = _levelData.unlocked;
							var _completed = _levelData.completed;
							
							var _color = c_white;
							if (!_unlocked) _color = c_grey;							
							
									//BUTTON behavior
								var _xTop = _x - _width / 2;
								var _yTop = _y - _height / 2;
							
								var _hover = 0;
								if (mouse_in_area_GUI(_xTop, _yTop, _width, _height)) && (_unlocked)
								{
									_hover = 1;
									if (mouse_check_button_pressed(mb_left)) 
									{										
										room_goto(room_loadout);
										global.roomTo = _levelData.room;
									}
								}
							
									//DRAW the actual LEVEL
							draw_sprite_simple(_levelData.sprite, 0, _x, _y, { xscale : _xscaleFactor, yscale : _yscaleFactor, color : _color });
							draw_sprite_simple(spr_buttonBlankSlimEmpty, _hover, _x, _y, { xscale : _xscale, yscale : _yscale });
							
								//Display LEVEL TIME				//edge case: chooting range doesnt need a timer
							if (selectMode > 0) && (_completed) && (_levelData.room != room_shootingRange)
							{
								var _xClock = _x - _width / 2 + 14 * global.GUIScale;
								var _yClock = _y - _height / 2 + 14 * global.GUIScale;
							
								var _sizeClock = 1.5 * global.GUIScale;
							
								var _xOffsetTime = sprite_get_width(spr_clock) * _sizeClock * 1.2;
								var _yOffsetTime = sprite_get_height(spr_clock) * _sizeClock / 2;
							
								draw_sprite_simple(spr_clock, 0, _xClock, _yClock, { size : _sizeClock });
								draw_text_simple(_xClock + _xOffsetTime, _yClock + _yOffsetTime, $"{_levelData.time / 1000}", { font : font_upheaval_scalable, size : fontscale * 4, color : c_red, halign : fa_left } );
							}
							
							draw_text_simple(_x, _y + _height / 2 + global.GUIScale * 20, _levelData.name, { font : font_upheaval_scalable, size : fontscale * 3 } );
							
							_column++;
							if (_column == 3)
							{
								_column = 0;
								_row++;
								if (_row == 2) break;
							}
						}
	break;
	
	case "settings":		//draw RETURN button at bottom of screen
						var _x = GUIwidth * 0.86;
						var _y = GUIheight * 0.92;
						
						var _xscale = 2 * global.GUIScale;
						var _yscale = 0.5 * global.GUIScale;
							
						var _width = sprite_get_width(spr_buttonBlankSlim) * _xscale;
						var _height = sprite_get_height(spr_buttonBlankSlim) * _yscale;
						
						var _xTop = _x - _width / 2;
						var _yTop = _y - _height / 2;
							
						var _hover = 0;
						if (mouse_in_area_GUI(_xTop, _yTop, _width, _height))
						{
							_hover = 1;
							if (mouse_check_button_pressed(mb_left)) 
							{										
								mode = "main";
							}
						}
						
						draw_sprite_simple(spr_buttonBlankSlim, _hover, _x, _y, { xscale : _xscale, yscale : _yscale })
						draw_text_simple(_x, _y, "Return", { font : font_upheaval_scalable, size : fontscale * 5 });
						
							//draw FULLSCREEN TOGGLE button
						var _x = GUIwidth * 0.755;
						var _y = GUIheight * 0.81;
						
						var _xscale = 4 * global.GUIScale;
						var _yscale = 0.5 * global.GUIScale;
							
						var _width = sprite_get_width(spr_buttonBlankSlim) * _xscale;
						var _height = sprite_get_height(spr_buttonBlankSlim) * _yscale;
						
						var _xTop = _x - _width / 2;
						var _yTop = _y - _height / 2;
							
						var _hover = 0;
						if (mouse_in_area_GUI(_xTop, _yTop, _width, _height))
						{
							_hover = 1;
							if (mouse_check_button_pressed(mb_left)) 
							{										
								obj_camera.toggle_fullscreen();
							}
						}
						
						draw_sprite_simple(spr_buttonBlankSlim, _hover, _x, _y, { xscale : _xscale, yscale : _yscale })
						draw_text_simple(_x, _y, "Toggle Fullscreen", { font : font_upheaval_scalable, size : fontscale * 5 });

						draw_text_simple(x + 30, y + 30, "Settings", { font : font_upheaval_scalable, size : 15 * fontscale, halign : fa_left, valign : fa_top })
	break;
}