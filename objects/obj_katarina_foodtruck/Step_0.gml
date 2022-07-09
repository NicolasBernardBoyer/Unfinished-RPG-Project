if (instance_exists(obj_facetextbox)){
	if (obj_facetextbox.portrait = noone){
		obj_facetextbox.portrait = spr_kat_faces;
	}
	obj_facetextbox.portrait_index = portrait_index;
	obj_facetextbox.portrait = portrait;
	obj_facetextbox.name = name;
}

if (run2ndTextbox = true){
	instance_destroy(obj_textbox);
	create_textbox(text2, speakers2, next_line2, scripts2);
	run2ndTextbox = false;
}

if (run3rdTextbox = true){
	instance_destroy(obj_textbox);
	create_facetextbox(text3, speakers3, next_line3, scripts3);
	run3rdTextbox = false;
}

if (run4thTextbox = true){
	instance_destroy(obj_textbox);
	create_facetextbox(text4, speakers4, next_line4, scripts4);
	run4thTextbox = false;
}

