// inventory functions, use when inventory is fleshed out
function inventory_search(root_object, item_type)
{
	for (var i = 0; i < INVENTORY_SLOTS; i += 1)
	{
		if (root_object.inventory[i] == item_type)
		{
			return(i);
		}
	}
	return(-1);
}

function inventory_remove(root_object, item_type) {
	var slot = inventory_search(root_object,item_type);
	if (slot != -1)
	{
		with(root_object) inventory[slot] = -1;
		return true;
	}
	else return false;
}

function inventory_consume(root_object, item_type) {
	var slot = inventory_search(root_object,item_type);
	if (slot != -1)
	{
		with(root_object) inventory[slot] = -1;
		return true;
	}
	else return false;
}

function inventory_add(root_object,item_type) {
	var slot = inventory_search(root_object,-1);
	if (slot != 1)
	{
		with (root_object) inventory[slot] = item_type;
		return true;
	}
	else return false;
}


