function menu(_x, _y, _options, _description = -1, _width = undefined, _height = undefined)
{
	with (instance_create_depth(_x,_y,-99999,obj_menu))
	{
		options = _options
		var _options_count = array_length(_options);
		visible_options_max = _options_count;
		
		//size setup
		xmargin = 10;
		ymargin = 8;
		draw_set_font(fnt_8bit);
		height_line = 12;
		
		//Auto width
		if (_width == undefined)
		{
			width = 1;
			for (var i = 0; i < _options_count; i++)
			{
				width = max(width, string_width(_options[i][0]));
			}
			width_full = width + xmargin * 2;
		} else width_full = _width;
		
		//Auto height
		if (_height == undefined)
		{
			height = height_line * (_options_count);
			height_full = height + ymargin * 2;
		}
		else
		{
			height_full = _height;
			//scrolling?
			if (height_line * (_options_count) > _height - (ymargin*2))
			{
				scrolling = true;
				visible_options_max = (_height - ymargin * 2) div height_line;
			}
		}
	}
}

function sub_menu(_options)
{
	options_above[sub_menu_level] = options;
	sub_menu_level++;
	options = _options;
	hover = 0;
}

function menu_go_back()
{
	sub_menu_level--;
	options = options_above[sub_menu_level];
	hover = 0;
}

function menu_select_action(_user, _action)
{
	with (obj_menu) active = false;	
	
	//Activate the targetting cursor if needed, or simply being action
	with (obj_battle) {
		if (_action.target_required)
		{
			with (cursor)
			{
				active = true;
				active_action = _action;
				target_all = _action.target_all;
				if (target_all == MODE.VARIES) target_all = true; //"toggle" starts as true
				active_user = _user;
				
				//Which side to target by default?
				if (_action.target_enemy_by_default) //target enemy by default
				{
					target_index = 0;
					target_side = obj_battle.enemy_units;
					active_target = obj_battle.enemy_units[target_index];
				}
				else //target self by default
				{
					target_side = obj_battle.party_units;
					active_target = active_user;
					var _find_self = function(_element)
					{
						return (_element == active_target)
					}
					target_index = array_find_index(obj_battle.party_units, _find_self);
				}
			}
		}
		else 
		{
			//If no target needed, being the action and end the menu
			begin_action(_user, _action,-1);
			with (obj_menu) instance_destroy();
		}
	}
}

function use_item(_name) {
	// Get an item from the array, use it up, so delete it.
	for (var i = 0; i < array_length(global.party); i++) {
		var _index = array_get_index(global.party[i].actions, _name);
		array_delete(global.party[i].actions, _index, 1);
	}
}
