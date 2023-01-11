if (place_meeting(x,y,obj_player)){
	instance_create_layer(0,0,"Transitions",obj_item_get);
	instance_destroy(self);
}





