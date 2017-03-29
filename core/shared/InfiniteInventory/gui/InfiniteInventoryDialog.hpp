#include "..\InfiniteInventoryControlIdcList.h"

class INFINV_Dialog {
	idd = INFINVDIALOG;
	movingEnable = false;
	enableSimulation = 1;	
	onLoad = "";
	onUnload = "";
	controlsBackground[] = { "InfiniteInventoryFrame", "InventoryFilter", "EquipmentFilter",
	"InventoryContainer", "EquipmentContainer", "AddSingleItemButton", "TakeSingleItemButton", "AddAllButton" };
	
	#include "InfiniteInventoryGui.hpp" 
};