if (!isDedicated) exitWith {};

params ["_sector", "_activationBLUFORcount"];

_sectorUnits = _sector getVariable "T8_units";
_markerName = _sector getVariable "markerName";

diag_log format ["Sector units to remove: %1", _sectorUnits];

{
	_x call F_removeUnit;
} forEach _sectorUnits;