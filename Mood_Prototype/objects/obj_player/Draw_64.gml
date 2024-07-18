draw_text_simple(20, 20, $"hvel: {hvel}", { size : 1, halign : fa_left, valign : fa_top, color : c_white, font : Font1 });
draw_text_simple(20, 40, $"vvel: {vvel}", { size : 1, halign : fa_left, valign : fa_top, color : c_white, font : Font1 });


draw_text_simple(device_mouse_x_to_gui(0) + 16, device_mouse_y_to_gui(0) + 16, $"{mouse_x}, {mouse_y}", { size : 0.5, color : c_red });