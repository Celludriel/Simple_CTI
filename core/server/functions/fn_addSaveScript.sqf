if(!isDedicated) exitWith {};

params ["_script"];

SAVE_SCRIPTS pushBack _script;

[["SAVE_SCRIPTS: %1", SAVE_SCRIPTS]] call CTISHR_fnc_ctiLog;