if(!isDedicated) exitWith {};

params ["_spawnPosition", "_spawnDirection"];

_inventory = "B_Slingload_01_Cargo_F" createVehicle _spawnPosition;
_inventory allowDamage false;
_inventory setDir _spawnDirection;

_inventory