if(!isDedicated) exitWith {};

_katiba = [
	["arifle_Katiba_F","arifle_Katiba_C_F","arifle_Katiba_GL_F","arifle_Katiba_C_ACO_pointer_F","arifle_Katiba_C_ACO_F","arifle_Katiba_ACO_F","arifle_Katiba_pointer_F","arifle_Katiba_ACO_pointer_F","arifle_Katiba_ARCO_F","arifle_Katiba_ARCO_pointer_F","arifle_Katiba_GL_ACO_F","arifle_Katiba_GL_ARCO_pointer_F","arifle_Katiba_GL_ACO_pointer_F","arifle_Katiba_GL_Nstalker_pointer_F","arifle_Katiba_GL_ACO_pointer_snds_F","arifle_Katiba_C_ACO_pointer_snds_F","arifle_Katiba_ACO_pointer_snds_F","arifle_Katiba_ARCO_pointer_snds_F"],
	["30Rnd_65x39_caseless_green", "30Rnd_65x39_caseless_green_mag_Tracer"]
];
missionNamespace setVariable ["WLO_KATIBA", _katiba];

_rahim = [
	["srifle_DMR_01_F","srifle_DMR_01_ACO_F","srifle_DMR_01_MRCO_F","srifle_DMR_01_SOS_F","srifle_DMR_01_DMS_F","srifle_DMR_01_DMS_snds_F","srifle_DMR_01_ARCO_F","srifle_DMR_01_DMS_BI_F","srifle_DMR_01_DMS_snds_BI_F"],
	["10Rnd_762x54_Mag"]
];
missionNamespace setVariable ["WLO_RAHIM", _rahim];

_mk18ABR = [
	["srifle_EBR_F","srifle_EBR_ACO_F","srifle_EBR_MRCO_pointer_F","srifle_EBR_ARCO_pointer_F","srifle_EBR_SOS_F", "srifle_EBR_ARCO_pointer_snds_F", "srifle_EBR_DMS_F", "srifle_EBR_Hamr_pointer_F","srifle_EBR_DMS_pointer_snds_F"],
	["20Rnd_762x51_Mag"]
];
missionNamespace setVariable ["WLO_MK18ABR", _mk18ABR];

_GM6Lynx = [
	["srifle_GM6_F","srifle_GM6_SOS_F","srifle_GM6_LRPS_F","srifle_GM6_camo_F","srifle_GM6_camo_SOS_F","srifle_GM6_camo_LRPS_F","srifle_GM6_ghex_F","srifle_GM6_ghex_LRPS_F"],
	["5Rnd_127x108_Mag","5Rnd_127x108_APDS_Mag"]
];
missionNamespace setVariable ["WLO_GM6LYNX", _GM6Lynx];

_M320LLR = [
	["srifle_LRR_F","srifle_LRR_SOS_F","srifle_LRR_LRPS_F","srifle_LRR_camo_F","srifle_LRR_camo_SOS_F","srifle_LRR_camo_LRPS_F","srifle_LRR_tna_F","srifle_LRR_tna_LRPS_F"],
	["7Rnd_408_Mag"]
];
missionNamespace setVariable ["WLO_M320LLR", _M320LLR];

_Mk200 = [
	["LMG_Mk200_F","LMG_Mk200_MRCO_F","LMG_Mk200_pointer_F","LMG_Mk200_LP_BI_F","LMG_Mk200_BI_F"],
	["200Rnd_65x39_cased_Box","200Rnd_65x39_cased_Box_Tracer"]
];
missionNamespace setVariable ["WLO_MK200", _Mk200];

_zafir = [
	["LMG_Zafir_F","LMG_Zafir_pointer_F","LMG_Zafir_ARCO_F"],
	["150Rnd_762x54_Box","150Rnd_762x54_Box_Tracer"]
];
missionNamespace setVariable ["WLO_ZAFIR", _zafir];

_mk20 = [
	["arifle_Mk20_F","arifle_Mk20_plain_F","arifle_Mk20C_F","arifle_Mk20C_plain_F","arifle_Mk20_GL_F","arifle_Mk20_GL_plain_F","arifle_Mk20C_ACO_F","arifle_Mk20C_ACO_pointer_F","arifle_Mk20_pointer_F","arifle_Mk20_Holo_F","arifle_Mk20_ACO_F","arifle_Mk20_ACO_pointer_F","arifle_Mk20_MRCO_F","arifle_Mk20_MRCO_plain_F","arifle_Mk20_MRCO_pointer_F","arifle_Mk20_GL_MRCO_pointer_F","arifle_Mk20_GL_ACO_F"],
	["30Rnd_556x45_Stanag","30Rnd_556x45_Stanag_Tracer_Red","30Rnd_556x45_Stanag_Tracer_Green","30Rnd_556x45_Stanag_Tracer_Yellow","30Rnd_556x45_Stanag_red","30Rnd_556x45_Stanag_green"]
];
missionNamespace setVariable ["WLO_MK20", _mk20];

_MX = [
	["arifle_MX_F","arifle_MX_GL_F","arifle_MX_SW_F","arifle_MX_pointer_F","arifle_MX_Holo_pointer_F","arifle_MX_Hamr_pointer_F","arifle_MX_ACO_pointer_F","arifle_MX_ACO_F","arifle_MX_GL_ACO_F","arifle_MX_GL_ACO_pointer_F","arifle_MX_GL_Hamr_pointer_F","arifle_MX_ACO_pointer_snds_F","arifle_MX_RCO_pointer_snds_F","arifle_MX_GL_Holo_pointer_snds_F","arifle_MX_ACO_pointer_snds_F","arifle_MX_RCO_pointer_snds_F","arifle_MX_GL_Holo_pointer_snds_F","arifle_MX_Black_F","arifle_MX_GL_Black_F","arifle_MX_GL_Black_Hamr_pointer_F","arifle_MX_Black_Hamr_pointer_F","arifle_MX_khk_F","arifle_MX_khk_ACO_Pointer_F","arifle_MX_khk_Holo_Pointer_F","	arifle_MX_khk_Hamr_Pointer_F","arifle_MX_khk_Hamr_Pointer_Snds_F","arifle_MX_khk_Pointer_F","arifle_MX_khk_ACO_Pointer_Snds_F","arifle_MX_GL_khk_F","arifle_MX_GL_khk_ACO_F","arifle_MX_GL_khk_Hamr_Pointer_F","arifle_MX_GL_khk_Holo_Pointer_Snds_F"],
	["30Rnd_65x39_caseless_mag","30Rnd_65x39_caseless_mag_Tracer"]
];
missionNamespace setVariable ["WLO_MX", _MX];

_MXC = [
	["arifle_MXC_F","arifle_MXC_Holo_F","arifle_MXC_Holo_pointer_F","arifle_MXC_ACO_F","arifle_MXC_Holo_pointer_snds_F","arifle_MXC_SOS_point_snds_F","arifle_MXC_ACO_pointer_snds_F","arifle_MXC_ACO_pointer_F","arifle_MXC_ACO_F","arifle_MXC_Holo_pointer_snds_F","arifle_MXC_SOS_point_snds_F","arifle_MXC_ACO_pointer_snds_F","arifle_MXC_ACO_pointer_F","arifle_MXC_Black_F","arifle_MXC_khk_F","arifle_MXC_khk_Holo_Pointer_F","	arifle_MXC_khk_ACO_F","arifle_MXC_khk_ACO_Pointer_Snds_F"],
	["30Rnd_65x39_caseless_mag","30Rnd_65x39_caseless_mag_Tracer"]
];
missionNamespace setVariable ["WLO_MXC", _MXC];

_MXM = [
	["arifle_MXM_F","arifle_MXM_Hamr_pointer_F","arifle_MXM_SOS_pointer_F","arifle_MXM_RCO_pointer_snds_F","arifle_MXM_DMS_F","arifle_MXM_Black_F","arifle_MXM_DMS_LP_BI_snds_F","arifle_MXM_Hamr_LP_BI_F","arifle_MXM_khk_F","arifle_MXM_khk_MOS_Pointer_Bipod_F"],
	["30Rnd_65x39_caseless_mag","30Rnd_65x39_caseless_mag_Tracer"]
];
missionNamespace setVariable ["WLO_MXM", _MXM];

_MXSW = [
	["arifle_MX_SW_pointer_F","arifle_MX_SW_Hamr_pointer_F","arifle_MX_SW_Black_F","arifle_MX_SW_Black_Hamr_pointer_F","arifle_MX_SW_khk_F","arifle_MX_SW_khk_Pointer_F"],
	["100Rnd_65x39_caseless_mag","100Rnd_65x39_caseless_mag_Tracer","30Rnd_65x39_caseless_mag","30Rnd_65x39_caseless_mag_Tracer"]
];
missionNamespace setVariable ["WLO_MXSW", _MXSW];

_TRG = [
	["arifle_TRG21_F","arifle_TRG20_F","arifle_TRG21_GL_F","arifle_TRG20_Holo_F","arifle_TRG20_ACO_pointer_F","arifle_TRG20_ACO_Flash_F","arifle_TRG20_ACO_F","arifle_TRG21_ACO_pointer_F","arifle_TRG21_ARCO_pointer_F","arifle_TRG21_MRCO_F","arifle_TRG21_GL_MRCO_F","arifle_TRG21_GL_ACO_pointer_F"],
	["30Rnd_556x45_Stanag","30Rnd_556x45_Stanag_Tracer_Red","30Rnd_556x45_Stanag_Tracer_Green","30Rnd_556x45_Stanag_Tracer_Yellow","30Rnd_556x45_Stanag_red","30Rnd_556x45_Stanag_green"]
];
missionNamespace setVariable ["WLO_TRG", _TRG];

_PDW2000 = [
	["hgun_PDW2000_F","hgun_PDW2000_snds_F","hgun_PDW2000_Holo_F","hgun_PDW2000_Holo_snds_F"],
	["16Rnd_9x21_yellow_Mag","16Rnd_9x21_green_Mag","16Rnd_9x21_red_Mag","16Rnd_9x21_Mag","30Rnd_9x21_Green_Mag","30Rnd_9x21_Yellow_Mag","30Rnd_9x21_Red_Mag","30Rnd_9x21_Mag"]
];
missionNamespace setVariable ["WLO_PDW2000", _PDW2000];

_vermin = [
	["SMG_01_F","SMG_01_Holo_F","SMG_01_Holo_pointer_snds_F","SMG_01_ACO_F"],
	["30Rnd_45ACP_Mag_SMG_01","30Rnd_45ACP_Mag_SMG_01_tracer_green","30Rnd_45ACP_Mag_SMG_01_Tracer_Red","30Rnd_45ACP_Mag_SMG_01_Tracer_Yellow"]
];
missionNamespace setVariable ["WLO_VERMIN", _vermin];

_sting = [
	["SMG_02_F","SMG_02_ACO_F","SMG_02_ARCO_pointg_F"],
	["30Rnd_9x21_Mag_SMG_02","30Rnd_9x21_Mag_SMG_02_Tracer_Red","30Rnd_9x21_Mag_SMG_02_Tracer_Yellow","30Rnd_9x21_Mag_SMG_02_Tracer_Green","30Rnd_9x21_Mag","30Rnd_9x21_Red_Mag","30Rnd_9x21_Yellow_Mag","30Rnd_9x21_Green_Mag"]
];
missionNamespace setVariable ["WLO_STING", _sting];

_MAR10 = [
	["srifle_DMR_02_F","srifle_DMR_02_camo_F","srifle_DMR_02_sniper_F","srifle_DMR_02_ACO_F","srifle_DMR_02_MRCO_F","srifle_DMR_02_SOS_F","srifle_DMR_02_DMS_F","srifle_DMR_02_sniper_AMS_LP_S_F","srifle_DMR_02_camo_AMS_LP_F","srifle_DMR_02_ARCO_F"],
	["10Rnd_338_Mag"]
];
missionNamespace setVariable ["WLO_MAR10", _MAR10];

_MK1EMR = [
	["srifle_DMR_03_F","srifle_DMR_03_khaki_F","srifle_DMR_03_tan_F","srifle_DMR_03_multicam_F","srifle_DMR_03_woodland_F","srifle_DMR_03_ACO_F","srifle_DMR_03_MRCO_F","srifle_DMR_03_SOS_F","srifle_DMR_03_DMS_F","srifle_DMR_03_tan_AMS_LP_F","srifle_DMR_03_DMS_snds_F","srifle_DMR_03_ARCO_F","srifle_DMR_03_AMS_F"],
	["20Rnd_762x51_Mag"]
];
missionNamespace setVariable ["WLO_MK1EMR", _MK1EMR];

_ASP1kir = [
	["srifle_DMR_04_F","srifle_DMR_04_Tan_F","srifle_DMR_04_ACO_F","srifle_DMR_04_MRCO_F","srifle_DMR_04_SOS_F","srifle_DMR_04_DMS_F","srifle_DMR_04_ARCO_F","srifle_DMR_04_NS_LP_F"],
	["10Rnd_127x54_Mag"]
];
missionNamespace setVariable ["WLO_ASP1KIR", _ASP1kir];

_cyrus = [
	["srifle_DMR_05_blk_F","srifle_DMR_05_hex_F","srifle_DMR_05_tan_f","srifle_DMR_05_ACO_F","	srifle_DMR_05_MRCO_F","srifle_DMR_05_SOS_F","srifle_DMR_05_DMS_F","srifle_DMR_05_KHS_LP_F","srifle_DMR_05_DMS_snds_F","srifle_DMR_05_ARCO_F"],
	["10Rnd_93x64_DMR_05_Mag"]
];
missionNamespace setVariable ["WLO_CYRUS", _cyrus];

_Mk14 = [
	["srifle_DMR_06_camo_F","srifle_DMR_06_olive_F","srifle_DMR_06_camo_khs_F"],
	["20Rnd_762x51_Mag"]
];
missionNamespace setVariable ["WLO_MK14", _mk14];

_Mk18 = [
	["srifle_EBR_MRCO_LP_BI_F"],
	["20Rnd_762x51_Mag"]
];
missionNamespace setVariable ["WLO_MK18", _Mk18];

_navid = [
	["MMG_01_hex_F","MMG_01_tan_F","MMG_01_hex_ARCO_LP_F"],
	["150Rnd_93x64_Mag"]
];
missionNamespace setVariable ["WLO_NAVID", _navid];

_SPMG = [
	["MMG_02_camo_F","MMG_02_black_F","MMG_02_sand_F","MMG_02_sand_RCO_LP_F","MMG_02_black_RCO_BI_F"],
	["130Rnd_338_Mag"]
];
missionNamespace setVariable ["WLO_SPMG", _SPMG];

_CMR76 = [
	["srifle_DMR_07_blk_F","srifle_DMR_07_hex_F","srifle_DMR_07_ghex_F","srifle_DMR_07_blk_DMS_F","srifle_DMR_07_blk_DMS_Snds_F"],
	["20Rnd_650x39_Cased_Mag_F"]
];
missionNamespace setVariable ["WLO_CMR76", _CMR76];

_LIM85 = [
	["LMG_03_F"],
	["200Rnd_556x45_Box_F","200Rnd_556x45_Box_Red_F","200Rnd_556x45_Box_Tracer_F","200Rnd_556x45_Box_Tracer_Red_F"]
];
missionNamespace setVariable ["WLO_LIM85", _LIM85];

_AK12 = [
	["arifle_AK12_F","arifle_AK12_GL_F"],
	["30Rnd_762x39_Mag_F","30Rnd_762x39_Mag_Green_F","30Rnd_762x39_Mag_Tracer_F","30Rnd_762x39_Mag_Tracer_Green_F"]
];
missionNamespace setVariable ["WLO_AK12", _AK12];

_AKM = [
	["arifle_AKM_F","arifle_AKM_FL_F"],
	["30Rnd_762x39_Mag_F","30Rnd_762x39_Mag_Green_F","30Rnd_762x39_Mag_Tracer_F","30Rnd_762x39_Mag_Tracer_Green_F"]
];
missionNamespace setVariable ["WLO_AKM", _AKM];

_AKS = [
	["arifle_AKS_F"],
	["30Rnd_545x39_Mag_F","30Rnd_545x39_Mag_Green_F","30Rnd_545x39_Mag_Tracer_F","30Rnd_545x39_Mag_Tracer_Green_F"]
];
missionNamespace setVariable ["WLO_AKS", _AKS];

_type115 = [
	["arifle_ARX_blk_F","arifle_ARX_ghex_F","arifle_ARX_hex_F","arifle_ARX_hex_ARCO_Pointer_Snds_F","arifle_ARX_ghex_ARCO_Pointer_Snds_F","arifle_ARX_hex_ACO_Pointer_Snds_F","arifle_ARX_ghex_ACO_Pointer_Snds_F","arifle_ARX_hex_DMS_Pointer_Snds_Bipod_F","arifle_ARX_ghex_DMS_Pointer_Snds_Bipod_F","arifle_ARX_Viper_F","arifle_ARX_Viper_hex_F"],
	["30Rnd_65x39_caseless_green","30Rnd_65x39_caseless_green_mag_Tracer","10Rnd_50BW_Mag_F"]
];
missionNamespace setVariable ["WLO_TYPE115", _type115];

_car95 = [
	["arifle_CTAR_blk_F","arifle_CTAR_hex_F","arifle_CTAR_ghex_F","arifle_CTAR_GL_blk_F","arifle_CTAR_GL_hex_F","arifle_CTAR_GL_ghex_F","arifle_CTAR_blk_ACO_Pointer_F","arifle_CTAR_blk_Pointer_F","arifle_CTAR_blk_ACO_F","arifle_CTAR_GL_blk_ACO_F","arifle_CTAR_GL_blk_ARCO_Pointer_F","arifle_CTAR_blk_ARCO_Pointer_F","arifle_CTAR_blk_ACO_Pointer_Snds_F","arifle_CTAR_GL_blk_ACO_Pointer_Snds_F","arifle_CTAR_blk_ARCO_Pointer_Snds_F","arifle_CTAR_blk_ARCO_F"],
	["30Rnd_580x42_Mag_F","30Rnd_580x42_Mag_Tracer_F"]
];
missionNamespace setVariable ["WLO_CAR95", _car95];

_ctars = [
	["arifle_CTARS_blk_F","arifle_CTARS_hex_F","arifle_CTARS_ghex_F","arifle_CTARS_blk_Pointer_F"],
	["100Rnd_580x42_Mag_F","100Rnd_580x42_Mag_Tracer_F"]
];
missionNamespace setVariable ["WLO_CTARS", _ctars];

_spar16 = [
	["arifle_SPAR_01_blk_F","arifle_SPAR_01_khk_F","arifle_SPAR_01_snd_F","arifle_SPAR_01_GL_blk_F","	arifle_SPAR_01_GL_khk_F","arifle_SPAR_01_GL_snd_F","arifle_SPAR_01_blk_ERCO_Pointer_F","arifle_SPAR_01_blk_ACO_Pointer_F","arifle_SPAR_01_GL_blk_ACO_Pointer_F","arifle_SPAR_01_GL_blk_ERCO_Pointer_F"],
	["30Rnd_556x45_Stanag","30Rnd_556x45_Stanag_green","30Rnd_556x45_Stanag_red","30Rnd_556x45_Stanag_Tracer_Red","30Rnd_556x45_Stanag_Tracer_Green","30Rnd_556x45_Stanag_Tracer_Yellow"]
];
missionNamespace setVariable ["WLO_SPAR16", _spar16];

_spar16s = [
	["arifle_SPAR_02_blk_F","arifle_SPAR_02_khk_F","arifle_SPAR_02_snd_F","arifle_SPAR_02_blk_Pointer_F","arifle_SPAR_02_blk_ERCO_Pointer_F"],
	["150Rnd_556x45_Drum_Mag_F","150Rnd_556x45_Drum_Mag_Tracer_F"]
];
missionNamespace setVariable ["WLO_SPAR16S", _spar16s];

_spar17 = [
	["arifle_SPAR_03_blk_F","arifle_SPAR_03_khk_F","arifle_SPAR_03_snd_F","arifle_SPAR_03_blk_MOS_Pointer_Bipod_F"],
	["20Rnd_762x51_Mag"]
];
missionNamespace setVariable ["WLO_SPAR17", _spar17];

_prot9 = [
	["SMG_05_F"],
	["30Rnd_9x21_Mag_SMG_02","30Rnd_9x21_Mag_SMG_02_Tracer_Red","30Rnd_9x21_Mag_SMG_02_Tracer_Yellow","30Rnd_9x21_Mag_SMG_02_Tracer_Green"]
];
missionNamespace setVariable ["WLO_PROT9", _prot9];

_sdar = [
	["arifle_SDAR_F"],
	["20Rnd_556x45_UW_mag"]
];
missionNamespace setVariable ["WLO_SDAR", _sdar];