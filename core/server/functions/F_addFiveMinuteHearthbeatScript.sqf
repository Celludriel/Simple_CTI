if(!isDedicated) exitWith {};

params ["_script"];

FIVE_MINUTE_HEARTHBEATS pushBack _script;

[["FIVE_MINUTE_HEARTHBEATS: %1", FIVE_MINUTE_HEARTHBEATS]] call F_log;