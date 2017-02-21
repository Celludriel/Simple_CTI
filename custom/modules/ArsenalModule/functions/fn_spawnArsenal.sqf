if(!isDedicated) exitWith {};

params ["_spawnMarker"];
private ["_spawnPosition", "_spawnDirection", "_arsenal"];

_spawnPosition = markerPos _spawnMarker;
_spawnDirection = markerDir _spawnMarker;
_arsenal = "B_supplyCrate_F" createVehicle _spawnPosition;

_arsenal allowDamage false;
_arsenal setDir _spawnDirection;
_arsenal setVariable ["markerTag", _spawnMarker];

[_arsenal] remoteExecCall ["ARS_fnc_addArsenalAction", -2, true];