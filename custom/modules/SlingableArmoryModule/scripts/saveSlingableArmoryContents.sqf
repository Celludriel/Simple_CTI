if(!isDedicated) exitWith {};

[["Saving Slignable Armories"]] call CTISHR_fnc_ctiLog;

private ["_contents", "_markerTag", "_saveKey", "_slingableArmories"];

_slingableArmories = missionNamespace getVariable ["slingableArmories", []];
[["_slingableArmories: %1", _slingableArmories]] call CTISHR_fnc_ctiLog;
{
	_contents = [_x] remoteExecCall ["InfInv_fnc_getContents", 2];
	_markerTag = _x getVariable "markerTag";
	_saveKey = format ["slingableArmory_%1", _markerTag];

	[_saveKey, _contents] call CTISRV_fnc_storeDataBlockInSaveContainer;
} forEach _slingableArmories;