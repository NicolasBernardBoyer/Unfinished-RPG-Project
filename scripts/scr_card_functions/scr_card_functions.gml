function shuffle_deck() {
	var _size = ds_list_size(global.size);
	
	for (var i = _size - 1; i > 0; i--) {
		 var j = irandom(i); // random index from 0 to i
		 
		 // swap entries and i and j
		 var _temp = global.deck[| j];
		 global.deck[| i] = global.deck[| j];
		 global.deck[| j] = _temp;
	}
}

function reshuffle_discard() {
	// move all discard cards back into deck
	for (var i = 0; i < ds_list_size(global.discard); i++) {
		ds_list_add(global.deck, global.discard[| i]);
	}
	ds_list_clear(global.discard);
	shuffle_deck();
}

function draw_cards(amount) {
	repeat (amount) { 
		if (ds_list_size(global.deck) == 0) {
			reshuffle_discard(); // if deck has no cards reshuffle discard back into the deck
		}
	
		var _card = global.deck[| 0];
		ds_list_delete(global.deck, 0); // remove top card from deck
	
		if (ds_list_size(global.hand) >= 10) {
			ds_list_add(global.discard, _card); // add the card to discard pile if hand is full
		} else {
			ds_list_add(global.hand, _card); // add the card to hand
		}
	}
}

function add_cards(list, card_constructor, amount) {
	repeat (amount) {
		ds_list_add(list, new card_constructor());	
	}
}