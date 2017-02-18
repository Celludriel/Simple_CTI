if(!isDedicated) exitWith {};

private ["_contents", "_markerTag", "_saveKey", "_slingableArmories"];

_slingableArmories = missionNamespace getVariable ["slingableArmories", []];
{
	_contents = [_x] call CTISRV_fnc_fetchContentOfInventory;
	_markerTag = _x getVariable "markerTag";
	_saveKey = format ["slingableArmory_%1", _markerTag];

	[_saveKey, _contents] call CTISRV_fnc_storeDataBlockInSaveContainer;
} forEach _slingableArmories;