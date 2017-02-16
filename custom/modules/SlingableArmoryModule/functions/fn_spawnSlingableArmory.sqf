if(!isDedicated) exitWith {};

params ["_spawnPosition", "_spawnDirection"];

_armory = "B_Slingload_01_Cargo_F" createVehicle _spawnPosition;
_armory allowDamage false;
_armory setDir _spawnDirection;

[_armory] execVm "custom\modules\SlingableArmoryModule\slingableArmoryMonitor.sqf";

_armory