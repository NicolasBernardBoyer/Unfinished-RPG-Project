if (obj_player.canMove and global.canPause){
	walk = obj_player.spd;
	dir = point_direction(x,y,obj_player.x,obj_player.y);
	
	if (x <= obj_player.x - 50 or x >= obj_player.x + 50){
		x = Approach(x, obj_player.x, walk);
		y = Approach(y, obj_player.y, walk);
		
		image_index = obj_player.image_index;
		walking1 = true;
	}  else { walking1 = false; }
	if (y <= obj_player.y - 50 or y >= obj_player.y + 50){
		x = Approach(x, obj_player.x, walk);
		y = Approach(y, obj_player.y, walk);
		
		image_index = obj_player.image_index;
		walking2 = true;
	} else { walking2 = false; }
	
	if (walking1 = false and walking2 = false){
		image_index = 0;
	}
	
	if (walking1 = true or walking2 = true){
		if (obj_player.sprite_index = spr_player_walk_coat){
			sprite_index = spr_kat_walk;
		}
		else if (obj_player.sprite_index = spr_player_upwalk_coat){
			sprite_index = spr_kat_upwalk;
		}
		else if (obj_player.sprite_index = spr_player_leftwalk_coat){
			sprite_index = spr_kat_leftwalk;
		}
		else if (obj_player.sprite_index = spr_player_rightwalk_coat){
			sprite_index = spr_kat_rightwalk;
		}
	}
}



