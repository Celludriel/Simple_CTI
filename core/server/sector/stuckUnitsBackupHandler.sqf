if (!isDedicated) exitWith {};

params ["_sector", "_sectorOPFORcount"];
private ["_stuckBackupHandlerActivated", "_sectorState"];

[["Executing StuckUnitsBackupHandler with %1, %2", _sector, _sectorOPFORcount]] call CTISHR_fnc_ctiLog;

_stuckBackupHandlerActivated = _sector getVariable ["StuckBackupHandlerActivated", false];

[["_stuckBackupHandlerActivated: %1", _stuckBackupHandlerActivated]] call CTISHR_fnc_ctiLog;

_sectorState = _sector getVariable "condition";

if(!_stuckBackupHandlerActivated && _sectorOPFORcount <= SECTOR_MAX_LEFTOVER_UNITS && _sectorState == "contested") then {
	_sector setVariable ["StuckBackupHandlerActivated", true];
	[_sector] execVM "core\server\sector\runStuckUnitsBackupHandler.sqf";
};

[["_stuckBackupHandlerActivated: %1 | _sectorOPFORcount: %2", _stuckBackupHandlerActivated, _sectorOPFORcount]] call CTISHR_fnc_ctiLog;

if(_stuckBackupHandlerActivated && _sectorOPFORcount == 0) then {
	_sector setVariable ["StuckBackupHandlerActivated", false];
};