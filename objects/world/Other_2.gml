Console_Init();
Console_SetStatusNumber(3);
Console_SetStatusRatio(0,2/11);
Console_SetStatusRatio(1,8/11);
Console_SetStatusRatio(2,11/11);

Input_Init();
Input_Bind(INPUT.CONFIRM,INPUT_TYPE.KEYBOARD,0,vk_enter);
Input_Bind(INPUT.CONFIRM,INPUT_TYPE.KEYBOARD,0,ord("Z"));
Input_Bind(INPUT.CANCEL,INPUT_TYPE.KEYBOARD,0,vk_shift);
Input_Bind(INPUT.CANCEL,INPUT_TYPE.KEYBOARD,0,ord("X"));
Input_Bind(INPUT.MENU,INPUT_TYPE.KEYBOARD,0,vk_control);
Input_Bind(INPUT.MENU,INPUT_TYPE.KEYBOARD,0,ord("C"));
Input_Bind(INPUT.UP,INPUT_TYPE.KEYBOARD,0,vk_up);
Input_Bind(INPUT.DOWN,INPUT_TYPE.KEYBOARD,0,vk_down);
Input_Bind(INPUT.LEFT,INPUT_TYPE.KEYBOARD,0,vk_left);
Input_Bind(INPUT.RIGHT,INPUT_TYPE.KEYBOARD,0,vk_right);

Lang_Init();
Lang_LoadList();
Lang_LoadString(0);
Lang_LoadSprite(0);
Lang_LoadFont(0);

Flag_Init();



BGM_Init();

Dialog_Init();

instance_create_depth(0,0,0,camera);
instance_create_depth(0,0,0,fader);
instance_create_depth(0,0,0,border);
instance_create_depth(0,0,0,closed_captions);

application_surface_draw_enable(false);

//Border_SetEnabled(true);
Console_SetVisible(true);
Console_OutputLine("UNDERTALE by Toby Fox");
Console_OutputLine("UNDERTALE Engine by TML");
Console_OutputLine("UNDERTALE EngineCust by Small_Miao")
Console_OutputLine("Engine Version: "+ENGINE_VERSION);
Console_OutputLine("EngineCust Version: "+"0.1B");
Console_OutputLine("Game Name: "+GAME_NAME);
Console_OutputLine("Game Author: "+GAME_AUTHOR);
Console_OutputLine("Game Version: "+GAME_VERSION);
Console_OutputLine("Game GUID: "+GAME_GUID);

//show_debug_overlay(true);
ini_open("./enemy/enemy.ini");
global.EnemyName=ini_read_string("EnemySetting","EnemyName","NoName");
global.EnemyHp=ini_read_real("EnemySetting","EnemyHp",100);
global.EnemyActslot=ini_read_real("EnemySetting","EnemyActSlot",1);
global.EnemyFleeEnable = ini_read_string("EnemySetting","EnemyFleeEnabled","True");
global.EnemyMeetDialog = ini_read_string("EnemySetting","FirstDialog","* You encountered nothing!")
//ActSlot 初始化
global.EnemyActslotArray=array_create(global.EnemyActslot,noone)
global.EnemyActslotArray[0]=ini_read_string("ActSetting","ActSlotName0","*NotSet");
global.EnemyActslotArray[1]=ini_read_string("ActSetting","ActSlotName1","Disable");
global.EnemyActslotArray[2]=ini_read_string("ActSetting","ActSlotName2","Disable");
global.EnemyActslotArray[3]=ini_read_string("ActSetting","ActSlotName3","Disable");
//ActSlot 回应设置
global.EnemyActslotReturenDialogArray = array_create(global.EnemyActslot,noone);
global.EnemyActslotReturenDialogArray[0]=ini_read_string("ActSetting","ActSlotReturn0","*NotSet");
global.EnemyActslotReturenDialogArray[1]=ini_read_string("ActSetting","ActSlotReturn1","Disable");
global.EnemyActslotReturenDialogArray[2]=ini_read_string("ActSetting","ActSlotReturn2","Disable");
global.EnemyActslotReturenDialogArray[3]=ini_read_string("ActSetting","ActSlotReturn3","Disable");
//玩家设定
global.PlayerAtk = ini_read_real("PlayerSetting","PlayerAtk",10);
global.PlayerLv = ini_read_real("PlayerSetting","PlayerLv",1);
global.PlayerHp = ini_read_real("PlayerSetting","PlayerHp",20);
//Item设置
global.ItemList = array_create(8,noone);
global.ItemList[0]=ini_read_string("ItemSetting","ItemList1",noone);
global.ItemList[1]=ini_read_string("ItemSetting","ItemList2",noone);
global.ItemList[2]=ini_read_string("ItemSetting","ItemList3",noone);
global.ItemList[3]=ini_read_string("ItemSetting","ItemList4",noone);
global.ItemList[4]=ini_read_string("ItemSetting","ItemList5",noone);
global.ItemList[5]=ini_read_string("ItemSetting","ItemList6",noone);
global.ItemList[6]=ini_read_string("ItemSetting","ItemList7",noone);
global.ItemList[7]=ini_read_string("ItemSetting","ItemList8",noone);
Console_OutputLine("EnemyName:"+string(global.EnemyName));
Console_OutputLine("EnemyHp:"+string(global.EnemyHp));
Console_OutputLine("EnemyActSlot:"+string(global.EnemyActslot));
Console_OutputLine("EnemyActSlot0:"+string(global.EnemyActslotArray[0]));
Console_OutputLine("EnemyActSlot1:"+string(global.EnemyActslotArray[1]));
Console_OutputLine("EnemyActSlot2:"+string(global.EnemyActslotArray[2]));
Console_OutputLine("EnemyActSlot3:"+string(global.EnemyActslotArray[3]));
ini_close();
global.ItemNameArray = array_create(8,noone);
global.ItemHealArray = array_create(8,noone);
global.ItemUseDialogArray = array_create(8,noone);
///Item物品读取
ini_open("./Item/Item1.ini");
global.ItemNameArray[0]=ini_read_string("ItemSetting","ItemName","Item");
global.ItemHealArray[0]=ini_read_real("ItemSetting","ItemHeal","5");
global.ItemUseDialogArray[0]=ini_read_string("ItemSetting","ItemUseDialog","* You Use a Item.")
ini_close();
ini_open("./Item/Item2.ini");
global.ItemNameArray[1]=ini_read_string("ItemSetting","ItemName","Item");
global.ItemHealArray[1]=ini_read_real("ItemSetting","ItemHeal","5");
global.ItemUseDialogArray[1]=ini_read_string("ItemSetting","ItemUseDialog","* You Use a Item.")
ini_close();
ini_open("./Item/Item3.ini");
global.ItemNameArray[2]=ini_read_string("ItemSetting","ItemName","Item");
global.ItemHealArray[2]=ini_read_real("ItemSetting","ItemHeal","5");
global.ItemUseDialogArray[2]=ini_read_string("ItemSetting","ItemUseDialog","* You Use a Item.")
ini_close();
ini_open("./Item/Item4.ini");
global.ItemNameArray[3]=ini_read_string("ItemSetting","ItemName","Item");
global.ItemHealArray[3]=ini_read_real("ItemSetting","ItemHeal","5");
global.ItemUseDialogArray[3]=ini_read_string("ItemSetting","ItemUseDialog","* You Use a Item.")
ini_close();
ini_open("./Item/Item5.ini");
global.ItemNameArray[4]=ini_read_string("ItemSetting","ItemName","Item");
global.ItemHealArray[4]=ini_read_real("ItemSetting","ItemHeal","5");
global.ItemUseDialogArray[4]=ini_read_string("ItemSetting","ItemUseDialog","* You Use a Item.")
ini_close();
ini_open("./Item/Item6.ini");
global.ItemNameArray[5]=ini_read_string("ItemSetting","ItemName","Item");
global.ItemHealArray[5]=ini_read_real("ItemSetting","ItemHeal","5");
global.ItemUseDialogArray[5]=ini_read_string("ItemSetting","ItemUseDialog","* You Use a Item.")
ini_close();
ini_open("./Item/Item7.ini");
global.ItemNameArray[6]=ini_read_string("ItemSetting","ItemName","Item");
global.ItemHealArray[6]=ini_read_real("ItemSetting","ItemHeal","5");
global.ItemUseDialogArray[6]=ini_read_string("ItemSetting","ItemUseDialog","* You Use a Item.")
ini_close();
ini_open("./Item/Item8.ini");
global.ItemNameArray[7]=ini_read_string("ItemSetting","ItemName","Item");
global.ItemHealArray[7]=ini_read_real("ItemSetting","ItemHeal","5");
global.ItemUseDialogArray[7]=ini_read_string("ItemSetting","ItemUseDialog","* You Use a Item.")
ini_close();
Encounter_Init();
Encounter_Custom();
room_goto_next();