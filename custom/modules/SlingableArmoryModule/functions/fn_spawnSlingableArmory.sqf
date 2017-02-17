/*
	_trackingInfo = ["iconType", "iconColor"]
*/
if(!isDedicated) exitWith {};

params ["_spawnMarker", ["_trackingInfo", []]];
private ["_spawnPosition", "_spawnDirection", "_armory"];

_spawnPosition = markerPos _spawnMarker;
_spawnDirection = markerDir _spawnMarker;
_armory = "B_Slingload_01_Cargo_F" createVehicle _spawnPosition;

_armory allowDamage false;
_armory setDir _spawnDirection;
_armory setVariable ["markerTag", _spawnMarker];

[_armory] remoteExecCall ["SLA_fnc_addTransferCargoAction", -2, true];

if(count _trackingInfo == 2) then {
	[["Remote calling: %1", "CTICLN_fnc_trackObjectWithIconOnMap"]] call CTISHR_fnc_ctiLog;
	[_armory, _spawnMarker, _trackingInfo select 0, _trackingInfo select 1] remoteExecCall ["CTICLN_fnc_trackObjectWithIconOnMap", -2, true];
};

[_armory] execVm "custom\modules\SlingableArmoryModule\slingableArmoryMonitor.sqf";

_armory