// deactivate all instances other than the camera
instance_deactivate_all(true);
instance_activate_object(camera);

// units in battle
units = [];
// the distance party units move forward when it is their turn
unitsApproach = [];
// the current turn
turn = 0;
// order in which units do their turn
unitTurnOrder = [];
// order in which unit are rendered one on top of the other
unitRenderOrder = [];

turnCount = 0;
roundCount = 0;
battleWaitTimeFrames = 30;
battleWaitTimeRemaining = 0;
currentUser = noone;
currentAction = -1;
currentTargets = noone;

// Space offsets for enemy units
eXOffset	= 480;
eXCharSpace = 20;
eYOffset	= 190;
eYCharSpace = 75;

// Space offsets for party units
pXOffset	= 160;
pXCharSpace = 20;
pYOffset	= 190;
pYCharSpace = 75;



//Make enemies
for (var i = 0; i < array_length(enemies); i++)
{
	// go back to shawn's video for info on specific rows
	if (i != 2) {
		if (i = 0 and array_length(enemies) = 1){
			enemyUnits[i] = instance_create_depth(x+480-(i*eXCharSpace), y+eYOffset+38, depth-10, obj_battle_unit_enemy, enemies[i]);
		} else { 
			enemyUnits[i] = instance_create_depth(x+480-(i*eXCharSpace), y+eYOffset+(i*75), depth-10, obj_battle_unit_enemy, enemies[i]);
		}
	}
	else {
		enemyUnits[i] = instance_create_depth(x+520, y+eYOffset+((i-1)*38), depth-10, obj_battle_unit_enemy, enemies[i]);
	}
	array_push(units, enemyUnits[i]);
}


//Make party
for (var i = 0; i < array_length(global.party); i++)
{
	partyUnits[i] = instance_create_depth(x+160-(i*pXCharSpace), y+pYOffset+(i*70), depth-10, obj_battle_unit_pc, global.party[i]);
	array_push(units, partyUnits[i]);
}

//Determine turn order
array_copy(unitTurnOrder, 0, units, 0, array_length(units));

//bubble sort the contents of array based off agility
var n = array_length(unitTurnOrder);
// Traverse through all array elements
for (var i = 0; i < n - 1; i++){
	// Last i elements are already in place
	for (var j = 0; j < n - i - 1; j++){
		// Traverse the array from 0 to n - i - 1
		// Swap if the element found is greater than the next element
		if (unitTurnOrder[j].agility < unitTurnOrder[j+1].agility){
			temp = unitTurnOrder[j];
			unitTurnOrder[j] = unitTurnOrder[j+1];
			unitTurnOrder[j+1] = temp;
		}
		
	}
}

changePartyPos = true;
partyStartPos = unitTurnOrder[turn].x;
partyTurnPos = unitTurnOrder[turn].x+64;

// Where the menu box is created
menuBoxX = partyTurnPos-32;
menuBoxY = unitTurnOrder[turn].y-160;

//Get render order
refresh_render_order = function(){
	unitRenderOrder = [];
	array_copy(unitRenderOrder,0,units,0,array_length(units));
	array_sort(unitRenderOrder, function(_1, _2){
		return _1.y - _2.y;
	});
}
refresh_render_order();

voice = snd_typewriter;
name = "";
text = ["This is a test box"];
portrait_index = noone;
speakers = [id];
next_line = [0];
scripts = [-1];

global.highbox = true;
//create_textbox(text, speakers, next_line, scripts);

function BattleStateSelectAction()
{
	if (!instance_exists(obj_battle_menu)){
		// Get current unit
		var _unit = unitTurnOrder[turn];
		if (changePartyPos = true){
			partyStartPos = _unit.x;
			partyTurnPos = _unit.x+64;
			changePartyPos = false;
		}
	
		// is the unit dead or unable to act?
		if (!instance_exists(_unit)) || (_unit.hp <= 0)
		{
			battleState = BattleStateVictoryCheck;
			exit;
		}

		// if it isnt an enemy go through the process of creating a menu, otherwise perform action
		if (_unit.object_index == obj_battle_unit_pc){
			if (_unit.x <= partyTurnPos) _unit.x = Approach(_unit.x, partyTurnPos, 2);
			if (_unit.x >= partyTurnPos){
				// Create menu box based off unit's current turn
				menuBoxX = partyTurnPos-32;
				menuBoxY = _unit.y-160;
				//instance_create_depth(menuBoxX, menuBoxY, depth-10, obj_battle_menu);
				//Select an action to perform
				
				//Compile the action menu
				var _menuOptions = [];
				var _subMenus = {};
				
				var _actionList = _unit.actions;
				
				for (var i = 0; i < array_length(_actionList); i++)
				{
					var _action = _actionList[i];
					var _available = true; // later we'll check mp cost here
					var _nameAndCount = _action.name; // later we'll modify the name to include the item count, if the action is an item.
					if (_action.subMenu == -1)
					{
						array_push(_menuOptions, [_nameAndCount, MenuSelectAction, [_unit, _action], _available]);
					}
					else
					{
						//create or add to a submenu
						if (is_undefined(_subMenus[$ _action.subMenu]))
						{
							variable_struct_set(_subMenus, _action.subMenu, [[_nameAndCount, MenuSelectAction, [_unit, _action], _available]]);
						}
						else
						{
							array_push(_subMenus[$ _action.subMenu], [_nameAndCount, MenuSelectAction, [_unit, _action], _available]);
						}
					}
					
					//turn sub menus into an array
					var _subMenusArray = variable_struct_get_names(_subMenus);
					for (var i = 0; i < array_length(_subMenusArray); i++)
					{
						//sort submenu if needed
						//(here)
						
						//add back option at the end of each submenu
						array_push(_subMenus[$ _subMenusArray[i]], ["Back", MenuGoBack, -1, true]);
						//add submenu into main menu
						array_push(_menuOptions, [_subMenusArray[i], SubMenu, [_subMenus[$ _subMenusArray[i]]], true]);
					}
				}
				
				Menu(x+10, y+110, _menuOptions, , 74, 60);
			}
		} else {
			//BeginAction(_unit.id, global.actionLibrary.attack, _unit.id);
		
			// if the unit is AI controlled:
			var _enemyAction = _unit.AIscript();
			if (_enemyAction != -1) BeginAction(_unit.id, _enemyAction[0], _enemyAction[1]);
		}
	}
}

function BeginAction(_user, _action, _targets)
{
	currentUser = _user;
	currentAction = _action;
	currentTargets = _targets;
	if (!is_array(currentTargets)) currentTargets = [currentTargets];
	battleWaitTimeRemaining = battleWaitTimeFrames;
	with (_user)
	{
		acting = true;
		//play user animation if it is defined for that action, and that user
		if (!is_undefined(_action[$ "userAnimation"])) && (!is_undefined(_user.sprites[$ _action.userAnimation]))
		{
			sprite_index = sprites[$ _action.userAnimation];
			image_index = 0;
		}
	}
	battleState = BattleStatePerformAction;
}

function BattleStatePerformAction()
{
	//if animation etc is still playing
	if (currentUser.acting)
	{
		//when it ends, perform action effect if it exists
		if (currentUser.image_index >= currentUser.image_number -1)
		{
			with (currentUser)
			{
				sprite_index = sprites.idle;
				image_index = 0;
				acting = false;
			}
			
			if (variable_struct_exists(currentAction, "effectSprite"))
			{
				if (currentAction.effectOnTarget == MODE.ALWAYS) || ((currentAction.effectOnTarget == MODE.VARIES) && (array_length(currentTargets) <= 1))
				{
					for (var i = 0; i < array_length(currentTargets); i++)
					{
						instance_create_depth(currentTargets[i].x,currentTargets[i].y,currentTargets[i].depth-1,obj_battle_effect,{sprite_index : currentAction.effectSprite});
					}
				}
				else //play it at 0,0
				{
					var _effectSprite = currentAction.effectSprite;
					if (variable_struct_exists(currentAction, "effectSpriteNoTarget")) _effectSprite = currentAction.effectSpriteNoTarget;
					instance_create_depth(x,y,depth-100,obj_battle_effect,{sprite_index : _effectSprite});
				}
			}
			currentAction.func(currentUser, currentTargets);
		}
	}
	else //wait for delay and then end the turn
	{
		if (!instance_exists(obj_battle_effect))
		{
			battleWaitTimeRemaining--;
			if (battleWaitTimeRemaining == 0)
			{
				battleState = BattleStateVictoryCheck;
			}
		}
	}
}

function BattleStateVictoryCheck()
{
	battleState = BattleStateTurnProgression;
}

function BattleStateTurnProgression()
{
	if (unitTurnOrder[turn].object_index == obj_battle_unit_pc) {
		if (unitTurnOrder[turn].x >= partyStartPos) unitTurnOrder[turn].x = Approach(unitTurnOrder[turn].x, partyStartPos, 2);
		if (unitTurnOrder[turn].x <= partyStartPos){
			if (instance_exists(obj_battle_menu)) instance_destroy(obj_battle_menu);
			turnCount++;
			turn++;
			if (turn > array_length(unitTurnOrder) - 1)
			{
				turn = 0;
				roundCount++;
			}
			battleState = BattleStateSelectAction;
		}
	} else {
		turnCount++;
			turn++;
		if (turn > array_length(unitTurnOrder) - 1)
		{
			changePartyPos = true;
			turn = 0;
			roundCount++;
		}
		battleState = BattleStateSelectAction;
	}
}

battleState = BattleStateSelectAction;


