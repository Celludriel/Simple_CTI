diag_log format ["Executing init.sqf"];

// init shared scripts
call compileFinal preprocessFileLineNumbers "core\shared\coreSharedConstants.sqf";

// init server scripts
_handle = [] execVM "core\server\initServer.sqf";
waitUntil { isNull _handle };

// init client scripts
_handle = [] execVM "core\client\initClient.sqf";
waitUntil { isNull _handle };

// init modules
[] execVM "custom\modules\DynamicWeatherModule\initModule.sqf";
[] execVM "custom\modules\TimeAccelerationModule\initModule.sqf";
//[] execVM "custom\modules\LVSectorMilitarizationModule\initModule.sqf";
[] execVM "custom\modules\T8SectorMilitarizationModule\initModule.sqf";
[] execVM "custom\modules\FarReviveModule\initModule.sqf";
[] execVM "custom\modules\SimpleMhqModule\initModule.sqf";
[] execVM "custom\modules\AuxillerySlingModule\initModule.sqf";
[] execVM "custom\modules\FatigueModule\initModule.sqf";
[] execVM "custom\modules\TawdModule\initModule.sqf";

//init overrides
