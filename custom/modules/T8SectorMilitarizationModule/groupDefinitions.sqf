private ["_rookiePatrolGroup", "_veteranPatrolGroup", "_sniperTeam", "_armoredCarGroup", "_tankGroup", "_airGroup", "_groupDefinitions"];

_rookiePatrolGroup = ["O_G_Soldier_lite_F","O_G_Soldier_lite_F","O_G_Soldier_lite_F","O_G_Soldier_SL_F"];
_veteranPatrolGroup = ["O_G_Soldier_F","O_G_Soldier_F","O_G_Soldier_AR_F","O_G_Soldier_GL_F","O_G_medic_F","O_G_Soldier_SL_F"];
_sniperTeam = ["O_sniper_F","O_spotter_F"];
_armoredCarGroup = ["O_MRAP_02_hmg_F", "O_MRAP_02_gmg_F"];
_tankGroup = ["O_APC_Tracked_02_cannon_F","O_MBT_02_cannon_F"];
_airGroup = ["O_Heli_Attack_02_black_F"];

_groupDefinitions = [
	[0, 10, [1, _rookiePatrolGroup], [2, _rookiePatrolGroup], [], [], []],
	[11, 32, [4, _rookiePatrolGroup], [2, _veteranPatrolGroup], [], [], []],
	[33, 65, [4, _veteranPatrolGroup], [4, _veteranPatrolGroup], [], [], []],
	[66, 75, [6, _veteranPatrolGroup], [4, _veteranPatrolGroup], [2, _sniperTeam], [2, _armoredCarGroup], []],
	[75, 100, [6, _veteranPatrolGroup], [4, _veteranPatrolGroup], [2, _sniperTeam], [2, _tankGroup], [1, _airGroup]]
];

missionNamespace setVariable ["T8_GROUP_DEFINITION", _groupDefinitions];