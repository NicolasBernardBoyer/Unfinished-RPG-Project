
function create_textbox()// Feather disable GM1041
{
	if (variable_struct_exists(self, "portrait")){
		var has_port = true;
	} else { var has_port = false; }
	
	if (variable_struct_exists(self, "name_col")){
		var has_col = true;
	} else { var has_col = false; }
	
	var tbox = instance_create_layer(0,0, "Text", obj_textbox);
	
	with(tbox){
		text = argument[0];
		speakers = argument[1];
		next_line = argument[2];
		scripts = argument[3];
		
		var len = array_length(text);
		var i = 0; repeat(len){
			names[i]	 = speakers[i].name;
			if (has_port){
				if (speakers[i].portrait != noone){
				portrait_imgs[i] = speakers[i].portrait;
				} else {
				portrait_imgs[i] = noone;
				}
			} else {
				portrait_imgs[i] = noone;
			}
			if (has_col){
				if (speakers[i].name_col != noone){
				name_cols[i] = speakers[i].name_col;
				} else {
				name_cols[i] = noone;
				}
			} else {
				name_cols[i] = noone;
			}
			voices[i]	 = speakers[i].voice;
			i++;
		}
		event_perform(ev_other, ev_user1);
	}
	
	return tbox;
}