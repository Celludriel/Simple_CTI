params ["_weaponItem"];

private ["_retValue"];

_countAttachments = {
    params ["_attachments"];
    private ["_count"];

    _count = 0;

    {
        if(typeName _x == "ARRAY") then {
            if(count _x > 0) then {
                _count = _count + 1;
            }
        } else {
            if(_x != "") then {
                _count = _count + 1;
            }
        };
    } forEach _attachments;

    _count
};

_retValue = false;

_weaponItems = weaponsItems player;
{
    _weapon = _x select 0;
    _type = [_weapon] call InfInv_fnc_getWeaponType;
    if(!_retValue && _type == "PRIMARY") then {
        _checkWeaponItems = weaponsItems player;
        _currentWeaponItems = _checkWeaponItems select _forEachIndex;

        _count = [_currentWeaponItems] call _countAttachments;

         player addPrimaryWeaponItem _weaponItem;
        _checkWeaponItems = weaponsItems player;
        _currentWeaponItems = _checkWeaponItems select _forEachIndex;

        _newCount = [_currentWeaponItems] call _countAttachments;

        if(_newCount > _count) then {
            _retValue = true;
            player removePrimaryWeaponItem _weaponItem;
        };
    };

    if(!_retValue && _type == "SECONDARY") then {
        _checkWeaponItems = weaponsItems player;
        _currentWeaponItems = _checkWeaponItems select _forEachIndex;

        _count = [_currentWeaponItems] call _countAttachments;

         player addSecondaryWeaponItem _weaponItem;
        _checkWeaponItems = weaponsItems player;
        _currentWeaponItems = _checkWeaponItems select _forEachIndex;

        _newCount = [_currentWeaponItems] call _countAttachments;

        if(_newCount > _count) then {
            _retValue = true;
            player removeSecondaryWeaponItem _weaponItem;
        };
    };

    if(!_retValue && _type == "HANDGUN") then {
        _checkWeaponItems = weaponsItems player;
        _currentWeaponItems = _checkWeaponItems select _forEachIndex;

        _count = [_currentWeaponItems] call _countAttachments;

         player addHandgunItem _weaponItem;
        _checkWeaponItems = weaponsItems player;
        _currentWeaponItems = _checkWeaponItems select _forEachIndex;

        _newCount = [_currentWeaponItems] call _countAttachments;

        if(_newCount > _count) then {

            _retValue = true;
            player removeHandgunItem _weaponItem;
        };
    };

    if(_retValue) exitWith {};
} forEach _weaponItems;

_retValue