/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
Dialog_Add(global.ItemUseDialogArray[1]);
Dialog_Start();
if(global.ItemHealArray[1]>0){
	Player_Heal(global.ItemHealArray[1]);
}else{
	Player_Hurt(global.ItemHealArray[1]);
}
audio_play_sound(snd_item_heal,0,0);
Item_Remove(_item_slot);
event_inherited();

