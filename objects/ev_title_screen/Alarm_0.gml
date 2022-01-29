instance_destroy(ev_title_screen_text);
global.textvisible = !global.textvisible;
instance_create_layer(0,0, "Instances", ev_title_screen_text);