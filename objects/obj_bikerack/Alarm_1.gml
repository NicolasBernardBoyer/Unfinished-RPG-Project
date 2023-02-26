/// @description Use this after player falls over
// remove textbox and create a new one after player falls
instance_destroy(obj_textbox);
create_textbox(alttext2,altspeakers2,altnext_line2,altscripts2);
fallEvent = false;
