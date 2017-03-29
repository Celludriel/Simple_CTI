////////////////////////////////////////////////////////
// GUI EDITOR OUTPUT START (by Celludriel, v1.063, #Femuby)
////////////////////////////////////////////////////////

class InfiniteInventoryFrame: RscFrame
{
	idc = INFINVFRAME;
	x = 0 * GUI_GRID_W + GUI_GRID_X;
	y = 0 * GUI_GRID_H + GUI_GRID_Y;
	w = 40 * GUI_GRID_W;
	h = 25 * GUI_GRID_H;
};
class InventoryFilter: RscCombo
{
	idc = INFINVINVENTORYFILTER;
	x = 0.5 * GUI_GRID_W + GUI_GRID_X;
	y = 0.5 * GUI_GRID_H + GUI_GRID_Y;
	w = 13.5 * GUI_GRID_W;
	h = 1 * GUI_GRID_H;
	tooltip = "Filter Items"; //--- ToDo: Localize;
    onLBSelChanged = "[] call InfInv_fnc_setFilter;";
};
class EquipmentFilter: RscCombo
{
	idc = INFINVEQUIPMENTFILTER;
	x = 26 * GUI_GRID_W + GUI_GRID_X;
	y = 0.5 * GUI_GRID_H + GUI_GRID_Y;
	w = 13.5 * GUI_GRID_W;
	h = 1 * GUI_GRID_H;
	tooltip = "Filter items"; //--- ToDo: Localize;
    onLBSelChanged = "[] call InfInv_fnc_setFilter;";
};
class InventoryContainer: RscListbox
{
	idc = INFINVINVENTORYCONTAINER;
	x = 0.5 * GUI_GRID_W + GUI_GRID_X;
	y = 2 * GUI_GRID_H + GUI_GRID_Y;
	w = 13.5 * GUI_GRID_W;
	h = 22.5 * GUI_GRID_H;
    class ListScrollBar
    {
        width = 0;
        height = 0;
        scrollSpeed = 0.01;

        arrowEmpty = "\A3\ui_f\data\gui\cfg\scrollbar\arrowEmpty_ca.paa"; // Arrow
        arrowFull = "\A3\ui_f\data\gui\cfg\scrollbar\arrowFull_ca.paa"; // Arrow when clicked on
        border = "\A3\ui_f\data\gui\cfg\scrollbar\border_ca.paa"; // Slider background (stretched vertically)
        thumb = "\A3\ui_f\data\gui\cfg\scrollbar\thumb_ca.paa"; // Dragging element (stretched vertically)

        color[] = {1,1,1,1};
    };
};
class EquipmentContainer: RscListbox
{
	idc = INFINVEQUIPMENTCONTAINER;
	x = 26 * GUI_GRID_W + GUI_GRID_X;
	y = 2 * GUI_GRID_H + GUI_GRID_Y;
	w = 13.5 * GUI_GRID_W;
	h = 22.5 * GUI_GRID_H;
    class ListScrollBar
    {
        width = 0;
        height = 0;
        scrollSpeed = 0.01;

        arrowEmpty = "\A3\ui_f\data\gui\cfg\scrollbar\arrowEmpty_ca.paa"; // Arrow
        arrowFull = "\A3\ui_f\data\gui\cfg\scrollbar\arrowFull_ca.paa"; // Arrow when clicked on
        border = "\A3\ui_f\data\gui\cfg\scrollbar\border_ca.paa"; // Slider background (stretched vertically)
        thumb = "\A3\ui_f\data\gui\cfg\scrollbar\thumb_ca.paa"; // Dragging element (stretched vertically)

        color[] = {1,1,1,1};
    };
};
class AddSingleItemButton: RscButton
{
	idc = INFINVADDSINGLEBUTTON;
	text = "<"; //--- ToDo: Localize;
	x = 15.5 * GUI_GRID_W + GUI_GRID_X;
	y = 11.5 * GUI_GRID_H + GUI_GRID_Y;
	w = 4 * GUI_GRID_W;
	h = 1.5 * GUI_GRID_H;
	tooltip = "Add"; //--- ToDo: Localize;
	action = "[] call InfInv_fnc_addItemToContainer;";
};
class TakeSingleItemButton: RscButton
{
	idc = INFINVTAKESINGLEBUTTON;
	text = ">"; //--- ToDo: Localize;
	x = 20 * GUI_GRID_W + GUI_GRID_X;
	y = 11.5 * GUI_GRID_H + GUI_GRID_Y;
	w = 4 * GUI_GRID_W;
	h = 1.5 * GUI_GRID_H;
	tooltip = "Take"; //--- ToDo: Localize;
	action = "[] call InfInv_fnc_takeItemFromContainer;";
};
class AddAllButton: RscButton
{
	idc = INFINVADDALLBUTTON;
	text = "<<<"; //--- ToDo: Localize;
	x = 15.5 * GUI_GRID_W + GUI_GRID_X;
	y = 13.5 * GUI_GRID_H + GUI_GRID_Y;
	w = 8.5 * GUI_GRID_W;
	h = 1.5 * GUI_GRID_H;
	tooltip = "Add all"; //--- ToDo: Localize;
    action = "[] call InfInv_fnc_addAllItemsToContainer;";
};
////////////////////////////////////////////////////////
// GUI EDITOR OUTPUT END
////////////////////////////////////////////////////////
