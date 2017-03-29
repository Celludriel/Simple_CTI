if(!isDedicated) exitWith {};

params ["_armory"];
private ["_contents", "_saveKey", "_markerTag"];

_markerTag = _armory getVariable "markerTag";
_saveKey = format ["slingableArmory_%1", _markerTag];
_contents = [_saveKey] call CTISRV_fnc_loadDataBlockInSaveContainer;

if(count _contents > 0) then {
    [_armory, _contents] remoteExecCall ["InfInv_fnc_setContents", 2];
};
