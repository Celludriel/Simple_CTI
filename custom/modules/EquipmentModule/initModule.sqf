[["Init equipment module"]] call CTISHR_fnc_ctiLog;

private ["_handle", "_weaponSupply"];

// load weapon and loadout configurations
_handle = [] execVM "custom\modules\EquipmentModule\configurations\VanillaRifleWeapons.sqf";
waitUntil {isNull _handle};
_handle = [] execVM "custom\modules\EquipmentModule\configurations\Loadouts.sqf";
waitUntil {isNull _handle};

// only clear weapons with player respawn on the scavenge option
_weaponSupply = ["WeaponSupply", 0] call BIS_fnc_getParamValue;
if(_weaponSupply == 0) then {
	[] execVM "custom\modules\EquipmentModule\scripts\respawnScript.sqf";
	["custom\modules\EquipmentModule\scripts\respawnScript.sqf"] call CTICLN_fnc_addRespawnScript;
};

_aiRandomEquipment = ["AiRandomEquipment", 0] call BIS_fnc_getParamValue;
if(_aiRandomEquipment == 1) then {
	[] execVM "custom\modules\EquipmentModule\scripts\equipNewUnitsMonitor.sqf";
};


