if(!isDedicated) exitWith {};

params ["_script"];

ONE_SECOND_HEARTBEATS pushBack _script;

[["ONE_SECOND_HEARTBEATS: %1", ONE_SECOND_HEARTBEATS]] call CTISHR_fnc_ctiLog;