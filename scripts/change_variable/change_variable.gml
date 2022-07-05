// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
///@arg id
///@arg var_name_string
///@arg value


function change_variable(){
		if (argument_count >= 3){
		with(argument0){
			variable_instance_set(id,argument1,argument2);
		}}
		if (argument_count >= 6){
		with(argument3){
		variable_instance_set(id,argument4,argument5);
		}}
		if (argument_count >= 9){
		with(argument6){
		variable_instance_set(id,argument7,argument8);
		}}
		if (argument_count = 12){
		with(argument9){
		variable_instance_set(id,argument10,argument11);
		}}
}