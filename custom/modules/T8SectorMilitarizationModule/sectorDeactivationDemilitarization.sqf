if (!isDedicated) exitWith {};

params ["_sector", "_activationBLUFORcount"];

_sectorUnits = _sector getVariable "T8_units";

{
	_x call F_removeUnit;
} forEach _sectorUnits;