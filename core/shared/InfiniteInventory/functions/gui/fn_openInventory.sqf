#include <..\..\InfiniteInventoryControlIdcList.h>

params ["_container"];

private ["_ok", "_display", "_lb"];

INFINV_CURRENT_CONTAINER = _container;

_ok = createDialog "INFINV_Dialog";
if (!_ok) then {hint "Dialog couldn't be opened!"};

//Load inventory combobox
_display = findDisplay INFINVDIALOG;
_lb = _display displayCtrl INFINVEQUIPMENTFILTER;
[_lb] call InfInv_fnc_loadFilterData;

//Load equipment combobox
_lb = _display displayCtrl INFINVINVENTORYFILTER;
[_lb] call InfInv_fnc_loadFilterData;

INFINV_CURRENT_CONTAINER setVariable ["NeedsRefresh", true];

[] spawn {
  disableSerialization;
  while { dialog } do {
    sleep 0.1;
    _needsRefresh = INFINV_CURRENT_CONTAINER getVariable ["NeedsRefresh", false];
    if(_needsRefresh) then {
        INFINV_CURRENT_CONTAINER setVariable ["NeedsRefresh", false];
        [] call InfInv_fnc_loadEquipmentContainer;
        [] call InfInv_fnc_loadInventoryContainerData;
    };
  };
};
