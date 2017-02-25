[["Init equipment module"]] call CTISHR_fnc_ctiLog;

_handle = [] execVM "custom\modules\EquipmentModule\configurations\VanillaRifleWeapons.sqf";
waitUntil {isNull _handle};

// only clear weapons with player respawn on the scavenge option
_weaponSupply = ["WeaponSupply", 0] call BIS_fnc_getParamValue;
if(_weaponSupply == 0) then {
	[] execVM "custom\modules\EquipmentModule\scripts\respawnScript.sqf";
	["custom\modules\EquipmentModule\scripts\respawnScript.sqf"] call CTICLN_fnc_addRespawnScript;
};


