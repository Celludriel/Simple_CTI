if(!isDedicated) exitWith {};

private ["_rifleLoadOuts", "_riflementLoadout", "_autoRiflemenLoadout", "_sniperLoadout"];

_rifleLoadOuts = [];

_riflemenLoadout = [
	["O_G_Soldier_F","O_G_Soldier_lite_F","O_G_Soldier_SL_F","O_G_Soldier_TL_F","O_G_medic_F","O_G_engineer_F","O_G_Soldier_exp_F","O_G_Soldier_LAT_F","O_G_Soldier_A_F","O_G_officer_F"],
	[
		missionNamespace getVariable "WLO_KATIBA",
		missionNamespace getVariable "WLO_MK20",
		missionNamespace getVariable "WLO_TRG"
	]
];

_autoRiflemenLoadOut = [
	["O_G_Soldier_AR_F","O_Soldier_AR_F","O_Soldier_AAR_F","O_soldierU_AR_F"],
	[
		missionNamespace getVariable "WLO_MK200",
		missionNamespace getVariable "WLO_ZAFIR",
		missionNamespace getVariable "WLO_NAVID",
		missionNamespace getVariable "WLO_SPMG",
		missionNamespace getVariable "WLO_LIM85"
	]
];

_sniperLoadout = [
	["O_G_Soldier_M_F"],
	[
		missionNamespace getVariable "WLO_RAHIM",
		missionNamespace getVariable "WLO_MK18ABR",
		missionNamespace getVariable "WLO_GM6LYNX",
		missionNamespace getVariable "WLO_M320LLR",
		missionNamespace getVariable "WLO_MAR10",
		missionNamespace getVariable "WLO_MK1EMR",
		missionNamespace getVariable "WLO_ASP1KIR",
		missionNamespace getVariable "WLO_CYRUS",
		missionNamespace getVariable "WLO_MK14",
		missionNamespace getVariable "WLO_MK18",
		missionNamespace getVariable "WLO_CMR76"
	]
];

_rifleLoadOuts pushBack _riflementLoadout;
_rifleLoadOuts pushBack _autoRiflemenLoadOut;
_rifleLoadOuts pushBack _sniperLoadout;

missionNamespace setVariable ["EM_RIFLE_LOADOUTS", _rifleLoadOuts];