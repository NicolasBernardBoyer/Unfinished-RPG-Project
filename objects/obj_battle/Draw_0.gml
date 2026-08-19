//Draw background art
draw_sprite(battleBackground,0,x,y);

//Draw units
var _unit_with_current_turn = unit_turn_order[turn].id
for (var i = 0; i < array_length(unit_render_order); i++)
{
	with (unit_render_order[i])
	{
		draw_self();
	}
}

//Draw ui boxes
draw_sprite_stretched(spr_box,0,x+150,y+240,490,120);
draw_sprite_stretched(spr_box,0,x,y+240,148,120);

//Positions
#macro COLUMN_ENEMY 30
#macro COLUMN_NAME 180
#macro COLUMN_HP 320
#macro COLUMN_MP 440

//Draw headings
draw_set_font(fnt_8bit);
draw_set_halign(fa_left);
draw_set_valign(fa_top);
draw_set_color(c_gray);
draw_text(x+COLUMN_ENEMY,y+250,"ENEMY");
draw_text(x+COLUMN_NAME,y+250,"NAME");
draw_text(x+COLUMN_HP,y+250,"HP");
draw_text(x+COLUMN_MP,y+250,"MP");

//Draw enemy names
draw_set_font(fnt_8bit);
draw_set_halign(fa_left);
draw_set_valign(fa_top);
draw_set_color(c_white);
var _draw_limit = 3;
var _drawn = 0;
for (var i = 0; (i < array_length(enemy_units)) && (_drawn < _draw_limit); i++)
{
	var _char = enemy_units[i];
	if (_char.hp > 0)
	{
		_drawn++;
		draw_set_color(c_white);
		if (_char.id == _unit_with_current_turn) draw_set_color(c_yellow);
		draw_text(x+COLUMN_ENEMY,y+270+(i*12),_char.name);
	}
}

for (var i = 0; i < array_length(party_units); i++)
{
	draw_set_halign(fa_left);
	draw_set_color(c_white);
	var _char = party_units[i];
	if (_char.id == _unit_with_current_turn) draw_set_color(c_yellow);
	if (_char.hp <= 0) draw_set_color(c_red);
	draw_text(x+COLUMN_NAME,y+270+(i*12),_char.name);
	draw_set_halign(fa_right);
	
	draw_set_color(c_white);
	if (_char.hp < (_char.hp_max * 0.5)) draw_set_color(c_orange);
	if (_char.hp <= 0) draw_set_color(c_red);
	draw_text(x+COLUMN_HP+50,y+270+(i*12),string(_char.hp) + "/" + string(_char.hp_max));
	
	draw_set_color(c_white);
	if (_char.mp < (_char.mp_max * 0.5)) draw_set_color(c_orange);
	if (_char.hp <= 0) draw_set_color(c_red);
	draw_text(x+COLUMN_MP+50,y+270+(i*12),string(_char.mp) + "/" + string(_char.mp_max));
	
	draw_set_color(c_white);
}	

//Draw target cursor
if (cursor.active)
{
	with (cursor)
	{
		if (active_target != noone)
		{
			if (!is_array(active_target))
			{
				draw_sprite(spr_arrow,0,active_target.x,active_target.y);
			}
			else 
			{
				draw_set_alpha(sin(get_timer()/50000)+1);
				for (var i = 0; i < array_length(active_target); i++)
				{
					draw_sprite(spr_arrow,0,active_target[i].x,active_target[i].y);
				}
				draw_set_alpha(1.0);
			}
		}
	}
}

//Draw battle text
if (battle_text != "")
{
	var _w = string_width(battle_text)+20;
	draw_sprite_stretched(spr_box,0,x+160-(_w*0.5),y+5,_w,25);
	draw_set_halign(fa_center);
	draw_set_color(c_white);
	draw_text(x+160,y+10,battle_text);
}