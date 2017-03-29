#include <..\..\InfiniteInventoryControlIdcList.h>

_display = findDisplay INFINVDIALOG;
_lb = _display displayCtrl INFINVINVENTORYCONTAINER;
_index = lbCurSel _lb;

if(_index != -1) then {
    _data = _lb lbData _index;

    if(_data != "") then {
        [false] call InfInv_fnc_toggleControls;

        _type = [_data] call InfInv_fnc_getWeaponType;

        if((primaryWeapon player == "" && _type == "PRIMARY")
            || (secondaryWeapon player == "" && _type == "SECONDARY")
            || (handgunWeapon player == "" && _type == "HANDGUN")) exitWith {
            [INFINV_CURRENT_CONTAINER, [_data], player, clientOwner] remoteExecCall ["InfInv_fnc_takeFromContainerContents", 2];
        };

        //possible attachment that can be added to weapon
        if([_data] call InfInv_fnc_canAttachWeaponItem) exitWith {
            [INFINV_CURRENT_CONTAINER, [_data], player, clientOwner] remoteExecCall ["InfInv_fnc_takeFromContainerContents", 2];
        };

        if (!(player canAdd _data)) exitWith {
            hint "Not enough inventory space";
            [true] call InfInv_fnc_toggleControls;
        };

        [INFINV_CURRENT_CONTAINER, [_data], player, clientOwner] remoteExecCall ["InfInv_fnc_takeFromContainerContents", 2];
    };
};