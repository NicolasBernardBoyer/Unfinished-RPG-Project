
function create_facetextbox(){
	
	var tbox = instance_create_layer(0,0, "Text", obj_facetextbox);
	
	with(tbox){
		text = argument[0];
		speakers = argument[1];
		next_line = argument[2];
		scripts = argument[3];
		
		var len = array_length(text);
		var i = 0; repeat(len){
			names[i]		 = speakers[i].name;
			portrait_imgs[i] = speakers[i].portrait;
			voices[i]		 = speakers[i].voice;
			i++;
		}
		event_perform(ev_other, ev_user1);
	}
	
	return tbox;
}