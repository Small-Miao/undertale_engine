/// @description Insert description here
// You can write your code in this editor
Battle_SetEnemyName(_enemy_slot,"* "+global.EnemyName);
Battle_SetEnemyActionNumber(_enemy_slot,global.EnemyActslot);
_enemy_hp_max = global.EnemyHp;
_enemy_hp = global.EnemyHp;
Player_SetLv(global.PlayerLv);
Player_SetHpMax(global.PlayerHp);
Player_SetHp(global.PlayerHp);
Player_SetAtk(global.PlayerAtk);
var proc = 0;
repeat(global.EnemyActslot){
	Battle_SetEnemyActionName(_enemy_slot,proc,global.EnemyActslotArray[proc])
	proc++;
}
Battle_SetMenuMercyFleeEnabled(bool(global.EnemyFleeEnable));
var num = 8;
var proc = 0;
repeat(num){
	if(global.ItemList[proc]!=noone){
		switch(global.ItemList[proc]){
			case "item1" :
				Item_Add(item_item0);
				break;
			case "item2" :
				Item_Add(item_item1);
				break;
			case "item3" :
				Item_Add(item_item2);
				break;
			case "item4" :
				Item_Add(item_item3);
				break;
			case "item5" :
				Item_Add(item_item4);
				break;
			case "item6" :
				Item_Add(item_item5);
				break;
			case "item7" :
				Item_Add(item_item6);
				break;
			case "item8" :
				Item_Add(item_item7);
				break;
		}
	}
	proc++;
}
_spr = Lang_GetSprite("battle.enemyspr",spr_default);
sprite_collision_mask(_spr,true,0,0,0,0,0,0,0);
sprite_index = _spr;
image_yscale = 2;
image_xscale = 2;