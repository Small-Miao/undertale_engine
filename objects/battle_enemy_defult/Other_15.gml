switch(Battle_GetMenuChoiceButton()){
		case 1:
				switch(Battle_GetMenuChoiceAction()){
					case 0:
						Dialog_Add(global.EnemyActslotReturenDialogArray[0]);
					break;
					case 1:
						Dialog_Add(global.EnemyActslotReturenDialogArray[1]);
					break;
					case 2:
						Dialog_Add(global.EnemyActslotReturenDialogArray[2]);
					break;
					case 3:
						Dialog_Add(global.EnemyActslotReturenDialogArray[3]);
					break;
				}
			break;
	}