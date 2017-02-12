if(!isDedicated) exitWith {};

params ["_script"];

SECTOR_LOADED_SCRIPTS pushBack _script;

[["SECTOR_LOADED_SCRIPTS: %1", SECTOR_LOADED_SCRIPTS]] call CTISHR_fnc_ctiLog;