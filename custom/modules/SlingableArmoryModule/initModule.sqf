if(!isDedicated) exitWith {};

_handle = [] execVM "custom\modules\SlingableArmoryModule\configurations\slingableArmoryConfiguration.sqf";
waitUntil {isNull _handle};

[] execVM "custom\modules\SlingableArmoryModule\spawnSlingableArmories.sqf";
["custom\modules\SlingableArmoryModule\saveSlingableArmoryContents.sqf"] call CTISRV_fnc_addSaveScript;