if (!isDedicated) exitWith {};

params ["_sector", "_sectorBLUFORcount", "_sectorOPFORcount"];

_sectorState = _sector getVariable "condition";

[["West: %1, East: %2, sectorStatus: %3", _sectorBLUFORcount, _sectorOPFORcount, _sectorState]] call F_log;

_sectorBLUFORcount > 0 && _sectorOPFORcount == 0 && _sectorState == "contested"