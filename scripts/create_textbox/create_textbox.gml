
function create_textbox(){
	if (variable_struct_exists(self, "portrait")){
		var hasPort = true;
	} else { var hasPort = false; }
	
	var tbox = instance_create_layer(0,0, "Text", obj_textbox);
	
	with(tbox){
		text = argument[0];
		speakers = argument[1];
		next_line = argument[2];
		scripts = argument[3];
		
		var len = array_length_1d(text);
		var i = 0; repeat(len){
			names[i]	 = speakers[i].name;
			if (hasPort){
				if (speakers[i].portrait != noone){
				portrait_imgs[i] = speakers[i].portrait;
				} else {
				portrait_imgs[i] = noone;
				}
			} else {
				portrait_imgs[i] = noone;
			}
			voices[i]	 = speakers[i].voice;
			i++;
		}
		event_perform(ev_other, ev_user1);
	}
	
	return tbox;
}