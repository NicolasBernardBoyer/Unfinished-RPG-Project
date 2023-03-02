// On room start display the "press any button" text
playsound = true;
titleMenu = false;
global.canPause = false;
instance_create_layer(0,0, "Instances", ev_title_screen_text);;
