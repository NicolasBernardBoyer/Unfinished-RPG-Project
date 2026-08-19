instance_deactivate_all(true);

units = [];
turn = 0;
unit_turn_order = [];
unit_render_order = [];

//Make targeting cursor
cursor = 
{
	active_user: noone,
	active_target: noone,
	action_action: -1,
	target_index: 0,
	target_all: false,
	confirm_delay : 0,
	active : false
};

turn_count = 0;
round_count = 0;
battle_wait_time_frames = 30;
battle_wait_time_remaining = 0;
battle_text = "";
current_user = noone;
current_action = -1;
current_targets = noone;


for (var i = 0; i < array_length(enemies); i++){
	// Don't use magic numbers later in development. This is important.
	enemy_units[i] = instance_create_depth(x+500+(i*20), y+136+(i*40), depth-10, obj_battle_unit_enemy, enemies[i]);
	array_push(units, enemy_units[i]);
}

//Make party
for (var i = 0; i < array_length(global.party); i++){
	// Don't use magic numbers later in development. This is important.
	party_units[i] = instance_create_depth(x+140+(i*20), y+136+(i*40), depth-10, obj_battle_unit_pc, global.party[i]);
	array_push(units, party_units[i]);
}

//Shuffle turn order
unit_turn_order = array_shuffle(units);

//Get render order
refresh_render_order = function()
{
	unit_render_order = [];
	array_copy(unit_render_order,0,units,0,array_length(units));
	array_sort(unit_render_order,function(_1, _2)
	{
		return _1.y - _2.y;	
	});
}

refresh_render_order();

function battle_state_select_action()
{
	if (!instance_exists(obj_menu))
	{
		//Get current unit
		var _unit = unit_turn_order[turn];
	
		if (!instance_exists(_unit) || _unit.hp <= 0)
		{
			battle_state = battle_state_victory_check;
			exit;
		}
	
		//begin_action(_unit.id, global.action_library.attack, _unit.id);
	
		//if unit is player controlled:
		if (_unit.object_index == obj_battle_unit_pc){
			//Compile the action menu
			
			var _menu_options = [];
			var _sub_menus = {};
		
			var _action_list = _unit.actions;
		
			for (var i = 0; i < array_length(_action_list); i++)
			{
				var _action = _action_list[i];
				var _available = true;
				var _name_and_count = _action.name;
				if (_action.submenu == -1)
				{
					array_push(_menu_options, [_name_and_count, menu_select_action, [_unit, _action], _available]);
				}
				else
				{
					//create or add to a submenu
					if (is_undefined(_sub_menus[$ _action.submenu]))
					{
						variable_struct_set(_sub_menus, _action.submenu, [[_name_and_count, menu_select_action, [_unit, _action], _available]]);
					}
					else
					{
						array_push(_sub_menus[$ _action.submenu], [_name_and_count, menu_select_action, [_unit, _action], _available]);
					}
				}
			}
		
			//turn sub menus into an array
			var _sub_menus_array = variable_struct_get_names(_sub_menus);
			for (var i = 0; i < array_length(_sub_menus_array); i++)
			{
				//sort submenu if needed
				//(here)
				
				//add back option at the end of each submenu
				array_push(_sub_menus[$ _sub_menus_array[i]], ["Back", menu_go_back, -1, true]);
				//add submenu into main menu
				array_push(_menu_options, [_sub_menus_array[i], sub_menu, [_sub_menus[$ _sub_menus_array[i]]], true]);
			}
		
			menu(x+10, y+110, _menu_options, , 74, 60);
		}
		else
		{
			//if unit is AI controlled
			var _enemy_action = _unit.ai_script();
			if (_enemy_action != -1) begin_action(_unit.id, _enemy_action[0], _enemy_action[1]);
		}
	}
}

function begin_action(_user, _action, _targets)
{
	current_user = _user;
	current_action = _action;
	current_targets = _targets;
	battle_text = string_ext(_action.description, [_user.name]);
	if (!is_array(current_targets)) current_targets = [current_targets];
	battle_wait_time_remaining = battle_wait_time_frames;
	with (_user) 
	{
		acting = true;
		//play user animation if it is defined for that action, and that user
		if (!is_undefined(_action[$ "user_animation"])) && (!is_undefined(_user.sprites[$ _action.user_animation]))
		{
			sprite_index = sprites[$ _action.user_animation];	
		}
	}
	battle_state = battle_state_perform_action;
}

function battle_state_perform_action()
{
	if (current_user.acting)
	{
		//when it ends, perform action effect if it exists
		if (current_user.image_index >= current_user.image_number - 1)
		{
			with (current_user)
			{
				sprite_index = sprites.idle;
				image_index = 0;
				acting = false;
			}
			
			if (variable_struct_exists(current_action, "effect_sprite"))
			{
				if (current_action.effect_on_target == MODE.ALWAYS) || ((current_action.effect_on_target == MODE.VARIES) && (array_length(current_targets) <= 1))
				{
					for (var i = 0; i < array_length(current_targets); i++)
					{
						instance_create_depth(current_targets[i].x,current_targets[i].y,current_targets[i].depth-1,obj_battle_effect,{sprite_index : current_action.effect_sprite});
					}
				}
				else //play it at 0,0
				{
					var _effect_sprite = current_action.effect_sprite;
					if (variable_struct_exists(current_action, "effect_sprite_no_target")) _effect_sprite = current_action.effect_sprite_no_target;
					instance_create_depth(x,y,depth-100,obj_battle_effect,{sprite_index : _effect_sprite});
				}
			}
			current_action.func(current_user, current_targets);
		}
	}
	else //wait for delay and then end the turn
	{
		if (!instance_exists(obj_battle_effect))
		{
			battle_wait_time_remaining--;
			if (battle_wait_time_remaining == 0)
			{
				battle_state = battle_state_victory_check;
			}
		}
	}
}

function battle_state_victory_check()
{
	battle_state = battle_state_turn_progression;
}

function battle_state_turn_progression()
{
	battle_text = ""; // reset battle text
	turn_count++;
	turn++;
	//Loop turns
	if (turn > array_length(unit_turn_order) - 1)
	{
		turn = 0;
		round_count++;
	}
	battle_state = battle_state_select_action;
}

battle_state = battle_state_select_action;

show_debug_message("Started a battle!");

//instance_activate_object(obj_game);
instance_activate_object(obj_camera);