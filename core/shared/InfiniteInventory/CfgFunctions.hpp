#define addFunction(fncName)		class fncName { headerType = -1; }
#define addFunctionPre(fncName)		class fncName { headerType = -1; preInit = 1; }
#define addFunctionPost(fncName)	class fncName { headerType = -1; postInit = 1; }

class InfInv {
	class client {
		file = "core\shared\InfiniteInventory\functions\gui";

		addFunction(addItemToContainer);
		addFunction(addItemToPlayer);
		addFunction(addAllItemsToContainer);
		addFunction(takeItemFromContainer);
		addFunction(setFilter);
		addFunction(openInventory);
		addFunction(getPlayerContainers);
		addFunction(getContentsFromPlayerContainer);
		addFunction(getPlayerInventoryContents);
		addFunction(loadListBoxFromData);
		addFunction(loadFilterData);
		addFunction(loadEquipmentContainer);
		addFunction(loadInventoryContainerData);
		addFunction(loadInventoryContainer);
		addFunction(toggleControls);
		addFunction(showError);
		addFunction(removeItemFromPlayer);
		addFunction(getWeaponType);
		addFunction(canAttachWeaponItem);
	};

	class server {
		file = "core\shared\InfiniteInventory\functions\server";

		addFunction(register);
		addFunction(setContents);		
		addFunction(getContainerContents);
		addFunction(takeFromContainerContents);
		addFunction(addToContainerContents);
		addFunction(addAllToContainerContents);
		addFunction(moveContentsFromOtherContainer);
	};
};