if (room == room_test)
{
	var _viewportWidth = view_get_wport(0);
	var _viewportHeight = view_get_hport(0);
	
	var _barX = _viewportWidth * 0.2;
	
	if (global.envHP > 0) draw_sprite_simple(spr_envBar, 0, _barX, _viewportHeight * 0.02, 
							{ xscale : (_viewportWidth * 0.98 - _barX) * (global.envHP / 1000) })
	
	if (global.envHP <= 0) room_goto(room_lose);

	
	var _scaleMinimap = 0.12;
	
	var _offsetX = _viewportWidth * 0.02 - 128 * _scaleMinimap;
	var _offsetY = _viewportHeight * 0.02 - 96 * _scaleMinimap;
	
	with (obj_doorway) draw_sprite_simple(spr_doorOverlay, 0, _offsetX + x * _scaleMinimap, _offsetY + y * _scaleMinimap, { xscale : image_xscale * _scaleMinimap, yscale : image_yscale * _scaleMinimap })
	with (obj_tunnel) 
	{
		draw_sprite_simple(spr_tunnelOverlay, sabotaged, _offsetX + x * _scaleMinimap, _offsetY + y * _scaleMinimap, { xscale : image_xscale * _scaleMinimap, yscale : image_yscale * _scaleMinimap });
	}
	with (obj_room)	
	{
		draw_sprite_simple(spr_roomOverlay, 0, _offsetX + x * _scaleMinimap, _offsetY + y * _scaleMinimap, { xscale : image_xscale * _scaleMinimap, yscale : image_yscale * _scaleMinimap });
		
		if (flood) draw_sprite_simple(spr_roomFlooded, 0, _offsetX + x * _scaleMinimap, _offsetY + y * _scaleMinimap, { xscale : image_xscale * _scaleMinimap, yscale : image_yscale * _scaleMinimap, alpha : 0.5 * floodAmount });
	}
	with (obj_env)	
	{
		draw_sprite_simple(spr_envOverlay, image_index, _offsetX + x * _scaleMinimap, _offsetY + y * _scaleMinimap, { xscale : image_xscale * _scaleMinimap, yscale : image_yscale * _scaleMinimap })
	}
	with (obj_gunPickup)
	{
		draw_sprite_simple(spr_gunOverlay, image_index, _offsetX + x * _scaleMinimap, _offsetY + y * _scaleMinimap, { xscale : image_xscale * _scaleMinimap, yscale : image_yscale * _scaleMinimap })
	}
	
	if (global.debugmode)
	{
		var _partiesSimple = [];
		for (var i = 0; i < array_length(global.parties); i++)
		{
			array_push(_partiesSimple, { members : array_length(global.parties[i].members) });
		}
		draw_text_simple(10, 200, _partiesSimple, { halign : fa_left, valign : fa_top, color : c_red })	
	}
}

if (room == room_lose)
{
	timerLoss++;
	
	draw_text_simple(view_get_wport(0) * 0.2, view_get_hport(0) * 0.35, "L", { size : 50, color : c_white });
	if (timerLoss > 100) draw_text_simple(view_get_wport(0) * 0.8, view_get_hport(0) * 0.35, "Get owned,\nidiot.", { size : 10, color : c_white });
	if (timerLoss > 220) draw_text_simple(view_get_wport(0) * 0.5, view_get_hport(0) * 0.8, "(press R to restart)", { size : 6, color : c_white });
}

//###DEBUG
if (keyboard_check_pressed(vk_escape)) game_end();
if (keyboard_check_pressed(ord("R"))) game_restart();
if (keyboard_check_pressed(vk_f9)) with (OBJ_enemy) instance_destroy();
if (keyboard_check_pressed(vk_f7)) global.envHP = 0;