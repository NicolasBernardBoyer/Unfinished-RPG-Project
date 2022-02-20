// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function event_unregister(){
	with(obj_eventmanager){
		var ev = argument[0];
		var objID = argument[1];
		
		//Get listeners
		if (ds_map_exists(eventMap, ev)){
			var listenerList = eventMap[? ev];
			var len = ds_list_size(listenerList);
			
			var i = 0; repeat(len){
				var listenerInfo = listenerList[| i];
				if(listenerInfo[0] == objID){
					if(len == 1){
						ds_list_destroy(listenerList);
						ds_map_delete(eventMap, ev);
					} else ds_list_delete(listenerList, i);
					break;
				}
				i++;
			}
		}
	}
}