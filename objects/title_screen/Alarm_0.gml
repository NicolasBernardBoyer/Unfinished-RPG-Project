instance_destroy(title_screen_text);
global.textvisible = !global.textvisible;
instance_create_layer(0,0, "Instances", title_screen_text);