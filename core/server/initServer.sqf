if(!isDedicated) exitWith {};

//load all server core functions
call compileFinal preprocessFileLineNumbers "core\server\coreServerConstants.sqf";

//load all server rules
sectorControlRule = compileFinal preprocessFileLineNumbers SECTOR_CONTROL_RULE_SCRIPT;
gameEndingRule = compileFinal preprocessFileLineNumbers GAME_ENDING_RULE_SCRIPT;

//load any custom pre server init scripts
[PRE_INIT_SERVER_SCRIPTS, []] call CTISHR_fnc_runArrayOfScriptsUnsynced;

//load any previous save
_handle = [] execVM "core\server\persistence\loadManager.sqf";
waitUntil {isNull _handle};

//sector init
[["Start sector initiation"]] call CTISHR_fnc_ctiLog;
_handle = [] execVM "core\server\sector\initSectors.sqf";
waitUntil {isNull _handle};

["core\server\gameManager.sqf"] call CTISRV_fnc_addOneSecondHearthbeatScript;
[["End sector initiation"]] call CTISHR_fnc_ctiLog;

//update difficulty of the current gamestate
[] call CTISRV_fnc_updateMissionDifficulty;

//autosave init
["core\server\persistence\saveManager.sqf"] call CTISRV_fnc_addFiveMinuteHearthbeatScript;
["core\server\persistence\saveManager.sqf"] call CTISRV_fnc_addSectorControlChangeScript;

//hearthbeat startup
[["Start hearthbeats startup"]] call CTISHR_fnc_ctiLog;
[] execVM "core\server\hearthbeat\oneSecondHearthbeat.sqf";
[] execVM "core\server\hearthbeat\fiveMinuteHearthbeat.sqf";
[["End hearthbeats startup"]] call CTISHR_fnc_ctiLog;

//load any custom post server init scripts
[POST_INIT_SERVER_SCRIPTS, []] call CTISHR_fnc_runArrayOfScriptsUnsynced;