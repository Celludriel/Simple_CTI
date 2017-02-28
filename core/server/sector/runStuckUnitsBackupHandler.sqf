if (!isDedicated) exitWith {};

params ["_sector", "_sectorOPFORcount"];

_sectorUnits = _sector getVariable ["SectorUnits", []];

sleep 120;

{
	[_x] call CTISRV_fnc_killUnit;
} forEach _sectorUnits;