/// @description Init
event_inherited();

title_text = string_hash_to_newline("brightness");
info_text = string_hash_to_newline("Brightness:##This shader changes brightness##1: brightness level -1: black | 1: white#2 -3#: -");

sprite_1 = spr_box_noborder;

shader = sh_brightness;
u_brightness = shader_get_uniform(shader, "brightness");


