 switch(Battle_GetMenu()){
	case BATTLE_MENU.FIGHT_DAMAGE:
			var animdamage	= instance_create_depth(Battle_GetEnemyCenterPosX(_enemy_slot),Battle_GetEnemyCenterPosY(_enemy_slot),0,battle_damage);
			_damage =Battle_GetMenuFightDamage();
				animdamage.damage =_damage;
				animdamage.bar_hp_max = _enemy_hp_max;
				animdamage.bar_hp_original = _enemy_hp;
				animdamage.bar_hp_target = _enemy_hp-_damage<0?0:_enemy_hp-_damage;
				_enemy_hp=_enemy_hp - _damage;
				if(_damage>0&&_enemy_hp>0){
					audio_play_sound(snd_damage,0,0);
					var shanke = instance_create_depth(x,y,depth,shaker);
					shanke.target = self;
					shanke.var_name = "x";
					shanke.shake_distance=15;
					shanke.shake_random = true;
				}else if(_enemy_hp<0){
						sprite_index = noone;
						audio_play_sound(snd_vaporize,0,0);
					var Sfx = instance_create_depth(x,y,depth,battle_death_particle);
						Sfx.sprite = _spr;
						Sfx.scale_x = 2;
						Sfx.scale_y = 2;
						alarm[0]=50;
				}
		break;
	case BATTLE_MENU.FIGHT_ANIM:
	break;
	case BATTLE_MENU.FIGHT_AIM:
		instance_create_depth(x,y,DEPTH_UI.ENCOUNTER_ANIM,battle_menu_fight_knife);
}

