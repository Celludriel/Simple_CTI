#include <..\..\InfiniteInventoryControlIdcList.h>

private ["_lb", "_display", "_filter", "_contents"];

//Load listbox
_contents = [] call InfInv_fnc_getPlayerInventoryContents;

_display = findDisplay INFINVDIALOG;
_lb = _display displayCtrl INFINVEQUIPMENTCONTAINER;
_filter = _display displayCtrl INFINVEQUIPMENTFILTER;
[_lb, _contents, _filter] call InfInv_fnc_loadListBoxFromData;