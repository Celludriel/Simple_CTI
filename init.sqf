diag_log format ["Executing init.sqf"];

// init shared scripts
call compileFinal preprocessFileLineNumbers "core\shared\coreSharedConstants.sqf";

// init BIS group management
["Initialize"] call BIS_fnc_dynamicGroups;

// init server scripts
_handle = [] execVM "core\server\initServer.sqf";
waitUntil { isNull _handle };

// init client scripts
_handle = [] execVM "core\client\initClient.sqf";
waitUntil { isNull _handle };

waitUntil { getClientState == "BRIEFING READ" };

// init modules
[] execVM "custom\modules\TimeAccelerationModule\initModule.sqf";
//[] execVM "custom\modules\LVSectorMilitarizationModule\initModule.sqf";
[] execVM "custom\modules\T8SectorMilitarizationModule\initModule.sqf";
[] execVM "custom\modules\FarReviveModule\initModule.sqf";
[] execVM "custom\modules\SimpleMhqModule\initModule.sqf";
[] execVM "custom\modules\AuxillerySlingModule\initModule.sqf";
[] execVM "custom\modules\FatigueModule\initModule.sqf";
[] execVM "custom\modules\TawdModule\initModule.sqf";
[] execVM "custom\modules\TacticalIconModule\initModule.sqf";
[] execVM "custom\modules\ServicePointModule\initModule.sqf";
[] execVM "custom\modules\DynamicWeatherModule\initModule.sqf";
[] execVM "custom\modules\SupplyDropModule\initModule.sqf";
[] execVM "custom\modules\SlingableArmoryModule\initModule.sqf";

//init overrides
