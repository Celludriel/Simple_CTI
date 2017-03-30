/*
	_trackingInfo = ["iconType", "iconColor"]
*/
if(!isDedicated) exitWith {};

params ["_spawnMarker", ["_trackingInfo", []]];
private ["_spawnPosition", "_spawnDirection", "_armory", "_slingableArmoryType", "_type"];

_spawnPosition = markerPos _spawnMarker;
_spawnDirection = markerDir _spawnMarker;

_slingableArmoryType = ["SlingableArmoryType", 0] call BIS_fnc_getParamValue;
_type = "B_Slingload_01_Cargo_F";
switch (_slingableArmoryType) do {
	case 1: { _type = "B_Truck_01_covered_F"; };
};

_armory = _type createVehicle _spawnPosition;

// empty the default inventory
clearWeaponCargoGlobal _armory;
clearMagazineCargoGlobal _armory;
clearItemCargoGlobal _armory;
clearBackpackCargoGlobal _armory;

// place armory in missionnamespace for save and load logic
_slingableArmories = missionNamespace getVariable ["slingableArmories", []];
_slingableArmories pushBack _armory;
missionNamespace setVariable ["slingableArmories", _slingableArmories];

_armory setDir _spawnDirection;
_armory setVariable ["markerTag", _spawnMarker];

[_armory] remoteExecCall ["SLA_fnc_addTransferCargoAction", -2, true];
[_armory, false] remoteExecCall ["allowDamage", 0, true];

if(count _trackingInfo == 2) then {
	[["Remote calling: %1", "CTICLN_fnc_trackObjectWithIconOnMap"]] call CTISHR_fnc_ctiLog;
	[_armory, _spawnMarker, _trackingInfo select 0, _trackingInfo select 1] remoteExecCall ["CTICLN_fnc_trackObjectWithIconOnMap", -2, true];
};

[_armory] execVM "custom\modules\SlingableArmoryModule\scripts\slingableArmoryMonitor.sqf";

_armory