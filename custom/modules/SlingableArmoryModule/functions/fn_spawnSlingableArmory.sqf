if(!isDedicated) exitWith {};

params ["_spawnMarker"];

_spawnPosition = markerPos _spawnMarker;
_spawnDirection = markerDir _spawnMarker;

_armory = "B_Slingload_01_Cargo_F" createVehicle _spawnPosition;

_armory allowDamage false;
_armory setDir _spawnDirection;
_armory setVariable ["markerTag", _spawnMarker];

[_armory] execVm "custom\modules\SlingableArmoryModule\slingableArmoryMonitor.sqf";

_armory