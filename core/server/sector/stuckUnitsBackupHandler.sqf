if (!isDedicated) exitWith {};

params ["_sector", "_sectorOPFORcount"];
private ["_stuckBackupHandlerActivated"];

_stuckBackupHandlerActivated = _sector getVariable ["StuckBackupHandlerActivated", false];

if(!_stuckBackupHandlerActivated && _sectorOPFORcount <= SECTOR_MAX_LEFTOVER_UNITS) then {
	_sector setVariable ["StuckBackupHandlerActivated", true];
	[_sector] execVM "core\server\sector\runStuckUnitsBackupHandler.sqf";
};

if(_stuckBackupHandlerActivated && _sectorOPFORcount == 0) then {
	_sector setVariable ["StuckBackupHandlerActivated", false];
};