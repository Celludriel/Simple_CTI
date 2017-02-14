/*
_contents = [
	[
		[CLASSNAME WEAPON, COUNT]
	],
	[
		[CLASSNAME MAGAZINE, COUNT]
	],
	[
		[CLASSNAME ITEM LIST, COUNT]
	]
];
*/
if(!isDedicated) exitWith {};

// initialisation of pools and content arrays
_assaultRiflePool = missionNamespace getVariable ["SD_ASSAULT_RIFLE_POOL",[]];
_antiAirPool = missionNamespace getVariable ["SD_ANTI_AIR_POOL",[]];
_rocketLauncherPool = missionNamespace getVariable ["SD_ROCKET_LAUNCHER_POOL",[]];
_sniperRiflePool = missionNamespace getVariable ["SD_SNIPER_RIFLE_POOL",[]];
_lightMachineGunPool = missionNamespace getVariable ["SD_L_MACHINE_GUN_POOL",[]];
_marksmanRiflePool = missionNamespace getVariable ["SD_MARKSMAN_RIFLE_POOL",[]];
_submachineGunPool = missionNamespace getVariable ["SD_S_MACHINE_GUN_POOL",[]];
_medMachineGunPool = missionNamespace getVariable ["SD_M_MACHINE_GUN_POOL",[]];

_contents = [];
_weapons = [];
_ammo = [];
_items = [];

// logic to fill weapons, ammo and items
if(count _assaultRiflePool > 0) then {
	_randomElement = selectRandom _assaultRiflePool;
	if(count _randomElement == 3) then {
		_weapons pushBack [_randomElement select 0, 4];
		_ammo pushBack [_randomElement select 1, 40];
		_ammo pushBack [_randomElement select 2, 10];
	} else {
		_weapons pushBack [_randomElement select 0, 4];
		_ammo pushBack [_randomElement select 1, 40];
	};
};

// building and returning of contents array
_contents pushBack _weapons;
_contents pushBack _ammo;
_contents pushBack _items;

_contents