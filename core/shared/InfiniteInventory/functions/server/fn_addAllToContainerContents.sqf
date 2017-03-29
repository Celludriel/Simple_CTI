if(!isServer) exitWith {};

params ["_container", "_items", "_clientID"];
{
    private ["_contents"];

    _contents = _container getVariable ["INFINV_CONTENTS", []];
    [_contents, _x select 0, _x select 1] call BIS_fnc_addToPairs;
    _container setVariable ["INFINV_CONTENTS", _contents];
} forEach _items;

_container setVariable ["NeedsRefresh", true, true];
[true] remoteExecCall ["InfInv_fnc_toggleControls", _clientID];