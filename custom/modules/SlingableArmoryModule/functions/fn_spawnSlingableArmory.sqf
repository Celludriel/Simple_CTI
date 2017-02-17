/*
	_trackingInfo = ["marker", "iconType", "iconColor"]
*/
if(!isDedicated) exitWith {};

<<<<<<< HEAD
params ["_spawnPosition", "_spawnDirection", ["_trackingInfo", []]];
=======
params ["_spawnMarker"];

_spawnPosition = markerPos _spawnMarker;
_spawnDirection = markerDir _spawnMarker;
>>>>>>> 11c16235d1d053eddcb0163f824a8077f3a08375

_armory = "B_Slingload_01_Cargo_F" createVehicle _spawnPosition;

_armory allowDamage false;
_armory setDir _spawnDirection;
_armory setVariable ["markerTag", _spawnMarker];
[_armory] remoteExecCall ["SLA_fnc_addTransferCargoAction", -2, true];

if(count _trackingInfo == 3) then {
	[_armory, _trackingInfo select 0, _trackingInfo select 1, _trackingInfo select 2] execVm "core\client\scripts\trackObjectWithIconOnMap.sqf";
};
[_armory] execVm "custom\modules\SlingableArmoryModule\slingableArmoryMonitor.sqf";

_armory