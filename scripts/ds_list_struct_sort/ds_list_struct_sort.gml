// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function ds_list_struct_sort(_list, _int, _asc){
	function ds_list_struct_sort(_list, _int, _asc) {
    ///@desc    the passed list contains structs, sort the list via the passed struct in the passed order.
    ///            returns the list id if successful, otherwise returns -1 if the passed number is not a valid struct variable
    ///@arg    list       real      ds_list
    ///@arg    int        integer   struct variable to sort as an integer
    ///@arg    asc        boolean    sort ascending(true) or descending(false)
 
    //put all struct variables into list, and sort it, then loop it and match the name to the struct, placing that back into a list
    var _size = ds_list_size(_list);
    var _dsp_agilities = ds_priority_create();
    var _dsl_new_list = ds_list_create();
    for (var i = 0; i < _size; ++i) {
        //get next struct
        var _stt = _list[|i];
        //get string from struct if exists
        if variable_struct_exists(_stt, _int) {
            var _number = variable_struct_get(_stt, _int);
        } else {
            ds_priority_destroy(_dsp_agilities);  
            ds_list_destroy(_dsl_new_list);  
            show_debug_message("ds_list_struct_sort for " + _int + " has failed as int does not exist in passed struct");
            return -1;
        }
        ds_priority_add(_dsp_agilities, i, _number);
    }
  
    //get names in order and place them into list
    _size = ds_priority_size(_dsp_agilities);
    for (var i = 0; i < _size; ++i) {
        //get the i value from the priority order, and move these to a new list in this new order
        if _asc {
            var _ability = ds_priority_find_max(_dsp_agilities);
            var _index = ds_priority_find_priority(_dsp_agilities, _ability);
            _index = ds_priority_delete_max(_dsp_agilities);
        } else var _index = ds_priority_delete_min(_dsp_agilities);
        ds_list_add(_dsl_new_list, _list[|_index]);
    }
  
    //now we can copy and overwrite the original list, with this newly sorted list
    ds_list_copy(_list, _dsl_new_list);
  
    //cleanup
    ds_priority_destroy(_dsp_agilities);
    ds_list_destroy(_dsl_new_list);
  
    //success
    return _list;
}
}