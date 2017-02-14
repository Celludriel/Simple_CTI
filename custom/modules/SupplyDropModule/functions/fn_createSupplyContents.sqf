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

_missionDifficulty = missionNamespace getVariable "MISSION_DIFFICULTY";
[["Current mission difficulty %1", _missionDifficulty]] call CTISHR_fnc_ctiLog;

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

if(count _submachineGunPool > 0) then {
	_randomElement = selectRandom _submachineGunPool;
	_weapons pushBack [_randomElement select 0, 2];
	_ammo pushBack [_randomElement select 1, 20];
};

if(count _lightMachineGunPool > 0) then {
	_randomElement = selectRandom _lightMachineGunPool;
	_weapons pushBack [_randomElement select 0, 2];
	_ammo pushBack [_randomElement select 1, 20];
};

if(count _sniperRiflePool > 0) then {
	_randomElement = selectRandom _sniperRiflePool;
	_weapons pushBack [_randomElement select 0, 2];
	_ammo pushBack [_randomElement select 1, 20];
};

if(_missionDifficulty >= 33) then {
	if(count _marksmanRiflePool > 0) then {
		_randomElement = selectRandom _marksmanRiflePool;
		_weapons pushBack [_randomElement select 0, 2];
		_ammo pushBack [_randomElement select 1, 20];
	};
};

if(_missionDifficulty >= 66) then {
	if(count _rocketLauncherPool > 0) then {
		_randomElement = selectRandom _rocketLauncherPool;
		_weapons pushBack [_randomElement select 0, 2];
		_ammo pushBack [_randomElement select 1, 10];
	};

	if(count _medMachineGunPool > 0) then {
		_randomElement = selectRandom _medMachineGunPool;
		_weapons pushBack [_randomElement select 0, 1];
		_ammo pushBack [_randomElement select 1, 10];
	};
};

if(_missionDifficulty >= 75) then {
	if(count _antiAirPool > 0) then {
		_randomElement = selectRandom _antiAirPool;
		_weapons pushBack [_randomElement select 0, 2];
		_ammo pushBack [_randomElement select 1, 10];
	};
};

// building and returning of contents array
_contents pushBack _weapons;
_contents pushBack _ammo;
_contents pushBack _items;

_contents