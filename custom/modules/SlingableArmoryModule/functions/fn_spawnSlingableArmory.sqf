/*
	_trackingInfo = ["marker", "iconType", "iconColor"]
*/
if(!isDedicated) exitWith {};

params ["_spawnPosition", "_spawnDirection", ["_trackingInfo", []]];

_armory = "B_Slingload_01_Cargo_F" createVehicle _spawnPosition;
_armory allowDamage false;
_armory setDir _spawnDirection;

if(count _trackingInfo == 3) then {
	[_armory, _trackingInfo select 0, _trackingInfo select 1, _trackingInfo select 2] execVm "core\client\scripts\trackObjectWithIconOnMap.sqf";
};
[_armory] execVm "custom\modules\SlingableArmoryModule\slingableArmoryMonitor.sqf";

_armory