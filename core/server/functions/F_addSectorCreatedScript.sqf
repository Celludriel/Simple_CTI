if(!isDedicated) exitWith {};

params ["_script"];

SECTOR_CREATED_SCRIPTS pushBack _script;

[["SECTOR_CREATED_SCRIPTS: %1", SECTOR_CREATED_SCRIPTS]] call F_log;