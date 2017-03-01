if (!isDedicated) exitWith {};

[["Executing runStuckUnitsBackupHandler"]] call CTISHR_fnc_ctiLog;

params ["_sector"];

_sectorUnits = _sector getVariable ["SectorUnits", []];

[["Going to kill: %1", _sectorUnits]] call CTISHR_fnc_ctiLog;

sleep 120;

[["Killing: %1", _sectorUnits]] call CTISHR_fnc_ctiLog;

{
	if (alive _x) then {
		[_x] call CTISRV_fnc_killUnit;
	};
} forEach _sectorUnits;