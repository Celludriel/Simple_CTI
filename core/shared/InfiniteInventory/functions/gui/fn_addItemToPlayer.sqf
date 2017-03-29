params ["_data"];

private ["_type"];

_type = [_data] call InfInv_fnc_getWeaponType;

if((primaryWeapon player == "" && _type == "PRIMARY")
        || (secondaryWeapon player == "" && _type == "SECONDARY")
        || (handgunWeapon player == "" && _type == "HANDGUN")) exitWith {
    player addWeapon _data;
    INFINV_CURRENT_CONTAINER setVariable ["NeedsRefresh", true, true];
};

if([_data] call InfInv_fnc_canAttachWeaponItem) exitWith {
    player addPrimaryWeaponItem _data;
    player addSecondaryWeaponItem _data;
    player addHandgunItem _data;
    INFINV_CURRENT_CONTAINER setVariable ["NeedsRefresh", true, true];
};

player addItem _data;
INFINV_CURRENT_CONTAINER setVariable ["NeedsRefresh", true, true];