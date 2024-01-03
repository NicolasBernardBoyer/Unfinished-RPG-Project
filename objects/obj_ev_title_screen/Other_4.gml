// On room start display the "press any button" text
playsound = true;
title_menu = false;
global.can_pause = false;
instance_create_layer(0,0, "Instances", obj_ev_title_screen_text);
