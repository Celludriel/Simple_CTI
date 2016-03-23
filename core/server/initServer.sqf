if(!isDedicated) exitWith {};

//load all server core functions
call compileFinal preprocessFileLineNumbers "core\server\coreServerConstants.sqf";
call compileFinal preprocessFileLineNumbers "core\server\coreFunctions.sqf";

//load all server rules
sectorControlRule = compileFinal preprocessFileLineNumbers SECTOR_CONTROL_RULE_SCRIPT;
gameEndingRule = compileFinal preprocessFileLineNumbers GAME_ENDING_RULE_SCRIPT;

//load any custom pre server init scripts
[PRE_INIT_SERVER_SCRIPTS, []] call F_runArrayOfScriptsUnsynced;

//load any previous save
_handle = [] execVM "core\server\persistence\loadManager.sqf";
waitUntil {isNull _handle};

//sector init
[["Start sector initiation"]] call F_log;
_handle = [] execVM "core\server\sector\initSectors.sqf";
waitUntil {isNull _handle};

["core\server\gameManager.sqf"] call F_addOneSecondHearthbeatScript;
[["End sector initiation"]] call F_log;

//autosave init
["core\server\persistence\saveManager.sqf"] call F_addFiveMinuteHearthbeatScript;

//hearthbeat startup
[["Start hearthbeats startup"]] call F_log;
[] execVM "core\server\hearthbeat\oneSecondHearthbeat.sqf";
[] execVM "core\server\hearthbeat\fiveMinuteHearthbeat.sqf";
[["End hearthbeats startup"]] call F_log;

//load any custom post server init scripts
[POST_INIT_SERVER_SCRIPTS, []] call F_runArrayOfScriptsUnsynced;