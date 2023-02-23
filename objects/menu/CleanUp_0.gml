// clean up pages by destroying them
var i = 0, array_len = array_length_1d(menu_pages);
repeat(array_len){
	page = i;
	ds_grid_destroy(page);
	i++;
}