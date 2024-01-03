// show textbox when first opening inventory
if (global.inventory_open = true and !instance_exists(obj_textbox)){
	create_textbox(text, speakers, next_line, scripts);
}