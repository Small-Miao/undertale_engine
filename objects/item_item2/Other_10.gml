/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
Dialog_Add(global.ItemUseDialogArray[2]);
Dialog_Start();
if(global.ItemHealArray[2]>0){
	Player_Heal(global.ItemHealArray[2]);
}else{
	Player_Hurt(global.ItemHealArray[2]);
}
audio_play_sound(snd_item_heal,0,0);
Item_Remove(_item_slot);
event_inherited();

