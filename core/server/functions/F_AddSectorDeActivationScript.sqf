if(!isDedicated) exitWith {};

params ["_script"];

SECTOR_DEACTIVATION_SCRIPTS pushBack _script;

[["SECTOR_DEACTIVATION_SCRIPTS: %1", SECTOR_DEACTIVATION_SCRIPTS]] call F_log;