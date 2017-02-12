if(!isDedicated) exitWith {};

params ["_script"];

SECTOR_CONTROL_CHANGE_SCRIPTS pushBack _script;

[["SECTOR_CONTROL_CHANGE_SCRIPTS: %1", SECTOR_CONTROL_CHANGE_SCRIPTS]] call CTISHR_fnc_ctiLog;