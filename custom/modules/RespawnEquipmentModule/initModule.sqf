if(!hasInterface) exitWith {};

[["Init respawn equipment module"]] call CTISHR_fnc_ctiLog;

[] execVM "custom\modules\RespawnEquipmentModule\respawnScript.sqf";
["custom\modules\RespawnEquipmentModule\respawnScript.sqf"] call CTICLN_fnc_addRespawnScript;