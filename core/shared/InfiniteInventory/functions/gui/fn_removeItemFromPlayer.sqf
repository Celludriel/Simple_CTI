params ["_item"];

private ["_deleteDone"];

_deleteDone = false;

_detachWeaponItem = {
    params ["_weaponItem"];
    if(typeName _weaponItem == "ARRAY") then {
        if(count _weaponItem > 0) then {
            _weaponItem = _weaponItem select 0;
        } else {
            _weaponItem = "";
        };
    };

    if(_weaponItem != "") then {
        if(player canAdd _weaponItem) then {
            player addItem _weaponItem;
        } else {
            _ground = "GroundWeaponHolder" createVehicle (position player);
            _ground addItemCargo [_weaponItem, 1];
        };
    };
};

_hasAttachment = {
    params ["_haystack", "_needle"];
    _result = false;
    {
        if(typeName _x == "ARRAY") then {
            if(count _x > 0) then {
                _x = _x select 0;
            } else {
                _x = "";
            };
        };

        if(_needle == _x) exitWith {
            _result = true;
        };
    } forEach _haystack;
    _result
};

//check if is primary weapon
if( _item == primaryWeapon player) exitWith {
    //if primary weapon and has attachments put attachments in inventory if they can't fit on the ground
    _weaponItems = primaryWeaponItems player;
    removeAllPrimaryWeaponItems player;
    {
        [_x] call _detachWeaponItem;
    } forEach _weaponItems;
    //remove primary weapon
    player removeWeapon (primaryWeapon player);
};

//check if is secondary weapon
if( _item == secondaryWeapon player) exitWith {
    //if secondary weapon and has attachements put attachments in inventory if they can't fit on the ground
    _weaponItems = secondaryWeaponItems player;
    {
        player removeSecondaryWeaponItem _x;
    } forEach _weaponItems;

    {
        [_x] call _detachWeaponItem;
    } forEach _weaponItems;
    //remove secondary weapon
    player removeWeapon (secondaryWeapon player);
};

//check if is handgun
if( _item == handgunWeapon player) exitWith {
    //if handgun and has attachements put attachements in inventory if they can't fit on the ground
    _weaponItems = handgunItems player;
    removeAllHandgunItems player;
    {
        [_x] call _detachWeaponItem;
    } forEach _weaponItems;
    //remove handgun
    player removeWeapon (handgunWeapon player);
};

//remove weapon from uniform if present, put attachments in inventory if they can't put on the ground
_uniform = uniformContainer player;
if(!(isNull _uniform)) then {
    _weaponItems = weaponsItems _uniform;
    {
        if((_item call BIS_fnc_baseWeapon) == ((_x select 0) call BIS_fnc_baseWeapon)) exitWith {
            {
                if(_forEachIndex == 0) then {
                    player removeItemFromUniform _x;
                } else {
                    [_x] call _detachWeaponItem;
                };
            } forEach _x;
            _deleteDone = true;
        };
    } forEach _weaponItems;
};

if(_deleteDone) exitWith { true };

//remove weapon from vest if present, put attachments in inventory if they can't put on the ground
_vest = vestContainer player;
if(!(isNull _vest)) then {
    _weaponItems = weaponsItems _vest;
    {
        if((_item call BIS_fnc_baseWeapon) == ((_x select 0) call BIS_fnc_baseWeapon)) exitWith {
            {
                if(_forEachIndex == 0) then {
                    player removeItemFromVest _x;
                } else {
                    [_x] call _detachWeaponItem;
                };
            } forEach _x;
            _deleteDone = true;
        };
    } forEach _weaponItems;
};

if(_deleteDone) exitWith { true };

//remove weapon from backpack if present, put attachments in inventory if they can't put on the ground
_backpack = backpackContainer player;
if(!(isNull _backpack)) then {
    _weaponItems = weaponsItems _backpack;
    {
        if((_item call BIS_fnc_baseWeapon) == ((_x select 0) call BIS_fnc_baseWeapon)) exitWith {
            {
                if(_forEachIndex == 0) then {
                    player removeItemFromBackpack _x;
                } else {
                    [_x] call _detachWeaponItem;
                };
            } forEach _x;
            _deleteDone = true;
        };
    } forEach _weaponItems;
};

if(_deleteDone) exitWith { true };

//check for attachment
//check if attachment on primary weapon
_weaponItems = primaryWeaponItems player + primaryWeaponMagazine player;
if(_weaponItems find _item >= 0) exitWith {
    //remove attachment from primary weapon
    player removePrimaryWeaponItem _item;
};

//check if attachment on secondary weapon
_weaponItems = secondaryWeaponItems player + secondaryWeaponMagazine player;
if(_weaponItems find _item >= 0) exitWith {
    //remove attachment from secondary weapon
    player removeSecondaryWeaponItem _item;
};

//check if attachment on handgun
_weaponItems = handgunItems player + handgunMagazine player;
if(_weaponItems find _item >= 0) exitWith {
    //remove attachment from handgun
    player removeHandgunItem _item;
};

//check if attachment on any of the carried weapons in inventory
_weaponItems = [];
if(!(isNull _uniform)) then {
    _weaponItems = _weaponItems + (weaponsItems _uniform);
};

if(!(isNull _vest)) then {
    _weaponItems = weaponsItems _vest;
};

if(!(isNull _backpack)) then {
    _weaponItems = _weaponItems + (weaponsItems _backpack);
};

{
    if([_x, _item] call _hasAttachment) exitWith {
        _dataToRemove = _x select 0;
        //delete the weapon
        player removeItem _dataToRemove;
        {
            //only way is to fake disassembling the weapon and adding each part again except the one we don't want
            if(typeName _x == "ARRAY") then {
                if(count _x > 0) then {
                    _x = _x select 0;
                } else {
                    _x = "";
                };
            };

            if(_x != _item && _x != "") then {
                if(_forEachIndex == 0) then {
                    player addItem (_x call BIS_fnc_baseWeapon);
                } else {
                    player addItem _x;
                };
            };
        } forEach _x;
        _deleteDone = true;
    };
} forEach _weaponItems;

if(_deleteDone) exitWith { true };

//item is only in inventory, remove it
//regular item delete from inventory
player removeItem _item;
true