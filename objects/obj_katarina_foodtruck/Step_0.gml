if (instance_exists(obj_facetextbox)){
	if (obj_facetextbox.portrait = noone){
		obj_facetextbox.portrait = spr_kat_faces;
	}
	obj_facetextbox.portrait_index = portrait_index;
	obj_facetextbox.portrait = portrait;
	obj_facetextbox.name = name;
}