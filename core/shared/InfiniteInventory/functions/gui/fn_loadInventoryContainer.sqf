#include <..\..\InfiniteInventoryControlIdcList.h>

params ["_contents"];

private ["_display", "_lb", "_filter"];

_display = findDisplay INFINVDIALOG;
_lb = _display displayCtrl INFINVINVENTORYCONTAINER;
_filter = _display displayCtrl INFINVINVENTORYFILTER;
if(count _contents > 0) then {
    [_lb, _contents, _filter] call InfInv_fnc_loadListBoxFromData;
} else {
    lbClear _lb;
};