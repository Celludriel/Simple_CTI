if(!isDedicated) exitWith {};

_assaultRiflePool = missionNamespace getVariable ["SD_ASSAULT_RIFLE_POOL",[]];
_antiAirPool = missionNamespace getVariable ["SD_ANTI_AIR_POOL",[]];
_rocketLauncherPool = missionNamespace getVariable ["SD_ROCKET_LAUNCHER_POOL",[]];
_sniperRiflePool = missionNamespace getVariable ["SD_SNIPER_RIFLE_POOL",[]];
_lightMachineGunPool = missionNamespace getVariable ["SD_L_MACHINE_GUN_POOL",[]];
_marksmanRiflePool = missionNamespace getVariable ["SD_MARKSMAN_RIFLE_POOL",[]];
_submachineGunPool = missionNamespace getVariable ["SD_S_MACHINE_GUN_POOL",[]];
_medMachineGunPool = missionNamespace getVariable ["SD_M_MACHINE_GUN_POOL",[]];


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