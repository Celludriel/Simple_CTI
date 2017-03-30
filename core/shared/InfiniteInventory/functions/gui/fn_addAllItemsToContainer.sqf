private ["_contents", "_contentsToAdd", "_data"];

_contents = [] call InfInv_fnc_getPlayerInventoryContents;

_contentsToAdd = [];

[false] call InfInv_fnc_toggleControls;
{
    for[{_i=0;}, {_i < _x select 1}, {_i=_i+1;}] do {
        _data = _x select 0;
        [_data] call InfInv_fnc_removeItemFromPlayer;

		if(([_data] call InfInv_fnc_getWeaponType) != "NO_WEAPON") then {
		    _baseWeapon = ([_data] call BIS_fnc_baseWeapon);
			_contentsToAdd pushBack [_baseWeapon, 1];
		} else {
			_contentsToAdd pushBack [_data, 1];
		};
    };
} forEach _contents;
[INFINV_CURRENT_CONTAINER, _contentsToAdd, clientOwner] remoteExecCall ["InfInv_fnc_addAllToContainerContents", 2];