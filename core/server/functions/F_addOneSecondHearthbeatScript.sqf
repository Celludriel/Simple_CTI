if(!isDedicated) exitWith {};

params ["_script"];
private "_script";

ONE_SECOND_HEARTBEATS pushBack _script;

[["ONE_SECOND_HEARTBEATS: %1", ONE_SECOND_HEARTBEATS]] call F_log;