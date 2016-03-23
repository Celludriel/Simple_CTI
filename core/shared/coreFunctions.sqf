if (DEBUG_ENABLED) then { diag_log format ["Loading shared core functions"] };

F_log = compileFinal preprocessFileLineNumbers "core\shared\functions\F_log.sqf";
F_getUnitCount = compileFinal preprocessFileLineNumbers "core\shared\functions\F_getUnitCount.sqf";
F_runArrayOfScriptsUnsynced = compileFinal preprocessFileLineNumbers "core\shared\functions\F_runArrayOfScriptsUnsynced.sqf";

[["Loaded shared core functions"]] call F_log;