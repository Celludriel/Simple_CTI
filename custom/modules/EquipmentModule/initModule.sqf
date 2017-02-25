[["Init equipment module"]] call CTISHR_fnc_ctiLog;

_handle = [] execVM "custom\modules\EquipmentModule\configurations\VanillaRifleWeapons.sqf";
waitUntil {isNull _handle};

[] execVM "custom\modules\EquipmentModule\respawnScript.sqf";
["custom\modules\EquipmentModule\respawnScript.sqf"] call CTICLN_fnc_addRespawnScript;