if(!isDedicated) exitWith {};

params ["_script"];

PRE_INIT_SERVER_SCRIPTS pushBack _script;

[["PRE_INIT_SERVER_SCRIPTS: %1", PRE_INIT_SERVER_SCRIPTS]] call CTISHR_fnc_ctiLog;