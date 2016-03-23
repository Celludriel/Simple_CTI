diag_log format ["Executing init.sqf"];

// init shared scripts
call compileFinal preprocessFileLineNumbers "core\shared\coreSharedConstants.sqf";
call compileFinal preprocessFileLineNumbers "core\shared\coreFunctions.sqf";

// init server scripts
[] execVM "core\server\initServer.sqf";

// init client scripts
[] execVM "core\client\initClient.sqf";

// init modules
[] execVM "custom\modules\LVSectorMilitarizationModule\initModule.sqf";