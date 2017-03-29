#include <..\..\InfiniteInventoryControlIdcList.h>

params ["_toggle"];

_display = findDisplay INFINVDIALOG;

_addSingleItemButton = _display displayCtrl INFINVADDSINGLEBUTTON;
_takeSingleItemButton = _display displayCtrl INFINVTAKESINGLEBUTTON;
_takeAllButton = _display displayCtrl INFINVADDALLBUTTON;

_addSingleItemButton ctrlEnable _toggle;
_takeSingleItemButton ctrlEnable _toggle;
_takeAllButton ctrlEnable _toggle;