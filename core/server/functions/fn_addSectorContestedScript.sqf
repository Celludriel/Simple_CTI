if(!isDedicated) exitWith {};

params ["_script"];

SECTOR_CONTESTED_SCRIPTS pushBack _script;

[["SECTOR_CONTESTED_SCRIPTS: %1", SECTOR_CONTESTED_SCRIPTS]] call CTISHR_fnc_ctiLog;