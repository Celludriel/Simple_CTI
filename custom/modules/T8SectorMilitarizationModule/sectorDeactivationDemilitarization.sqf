if (!isDedicated) exitWith {};

params ["_sector", "_activationBLUFORcount"];

_sectorUnits = _sector getVariable "T8_units";
_markerName = _sector getVariable "markerName";

diag_log format ["Sector units to remove: %1", _sectorUnits];

{
	_x call F_removeUnit;
} forEach _sectorUnits;

for "_i" from 1 to 6 do {
    deleteMarker format["%1_outer_%2", _markerName, _i];
};

for "_i" from 1 to 6 do {
    deleteMarker format["%1_inner_%2", _markerName, _i];
};