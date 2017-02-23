[["Init equipment module"]] call CTISHR_fnc_ctiLog;

[] execVM "custom\modules\EquipmentModule\respawnScript.sqf";
["custom\modules\EquipmentModule\respawnScript.sqf"] call CTICLN_fnc_addRespawnScript;