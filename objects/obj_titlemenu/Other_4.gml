// player can't press at the start and the object deactivates it
// deactivation so that the blinking "press to start" can play
canPress = false;
alarm[0] = -1;
instance_deactivate_object(self);
