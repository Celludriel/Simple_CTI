if(!isServer) exitWith {};

params ["_container", "_items", "_player", "_clientID"];

{
    private ["_contents", "_currentAmount"];

    _contents = _container getVariable ["INFINV_CONTENTS", []];
    _currentAmount = [_contents, _x] call BIS_fnc_getFromPairs;
    if(!isNil "_currentAmount") then {
        if(_currentAmount == 1) then {
            [_contents, _x] call BIS_fnc_removeFromPairs;
        } else {
            [_contents, _x, -1] call BIS_fnc_addToPairs;
        };
        [_x] remoteExecCall ["InfInv_fnc_addItemToPlayer", _clientID];
        _container setVariable ["INFINV_CONTENTS", _contents];
        _container setVariable ["NeedsRefresh", true, true];
    };
} forEach _items;

[true] call InfInv_fnc_toggleControls;

