if(!isDedicated) exitWith {};

params ["_script"];

SECTOR_ACTIVATION_SCRIPTS pushBack _script;

[["SECTOR_ACTIVATION_SCRIPTS: %1", SECTOR_ACTIVATION_SCRIPTS]] call F_log;