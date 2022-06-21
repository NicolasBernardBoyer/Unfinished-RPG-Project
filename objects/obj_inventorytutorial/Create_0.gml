swapTab = false;
hasText = true;
portrait_index = 0;
voice = snd_typewriter;
name = "";
text = ["Using your bag, you can check party stats, switch out your party, and use items!",
		"In the Party tab, you can add and remove party members from your active party. You can have up to 4 characters in your party at once.",
		"In the Consumables tab, you can use items that have a one-time use.",
		"In the Key Items tab, you can use items that have specific uses in the overworld.",
		"You'll get a hint as to when to use these items. They will not do anything when not used at the right time.",
		"Above the 3 main tabs, you can hover over your party members' portraits to view information about them.",
		"That's all you need to know about your bag. Simple, isn't it?",
		"..."];
speakers = [id, id, id, id, id, id, id, id];
next_line = [0,0,0,0,0,0,0,0];
scripts = [[swap_party_tab],[swap_consumables_tab],[swap_keyitems_tab],-1,[swap_stats_tab],-1, [delete_tutorial],-1];