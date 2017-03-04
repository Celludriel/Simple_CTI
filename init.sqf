diag_log format ["Executing init.sqf"];

// init shared scripts
call compileFinal preprocessFileLineNumbers "core\shared\coreSharedConstants.sqf";

// init BIS group management
["Initialize"] call BIS_fnc_dynamicGroups;

// init server scripts
_handle = [] execVM "core\server\initServer.sqf";
waitUntil { isNull _handle };

// init client scripts
_handle = [] execVM "custom\modules\EquipmentModule\initModule.sqf";
waitUntil { isNull _handle };
_handle = [] execVM "core\client\initClient.sqf";
waitUntil { isNull _handle };

waitUntil { getClientState == "BRIEFING READ" };

// init modules

[] execVM "custom\modules\TimeAccelerationModule\initModule.sqf";
[] execVM "custom\modules\FarReviveModule\initModule.sqf";
[] execVM "custom\modules\SimpleMhqModule\initModule.sqf";
[] execVM "custom\modules\AuxillerySlingModule\initModule.sqf";
[] execVM "custom\modules\FatigueModule\initModule.sqf";
[] execVM "custom\modules\TawdModule\initModule.sqf";
[] execVM "custom\modules\TacticalIconModule\initModule.sqf";
[] execVM "custom\modules\ServicePointModule\initModule.sqf";
[] execVM "custom\modules\DynamicWeatherModule\initModule.sqf";

_aiSystem = ["AiSystem", 1] call BIS_fnc_getParamValue;
[["_aiSystem: %1", _aiSystem]] call CTISHR_fnc_ctiLog;
switch (_aiSystem) do {
	case 0: { [] execVM "custom\modules\LVSectorMilitarizationModule\initModule.sqf"; };
	case 1: { [] execVM "custom\modules\T8SectorMilitarizationModule\initModule.sqf"; };
	case 2: { [] execVM "core\server\ai\VCOMAI\init.sqf";
			  sleep 1;
	          [] execVM "custom\modules\VCOMAISectorMilitarizationModule\initModule.sqf";
	        };
};

_weaponSupply = ["WeaponSupply", 0] call BIS_fnc_getParamValue;
[["_weaponSupply: %1", _weaponSupply]] call CTISHR_fnc_ctiLog;
switch (_weaponSupply) do {
	case 0: {
				[] execVM "custom\modules\SupplyDropModule\initModule.sqf";
				[] execVM "custom\modules\SlingableArmoryModule\initModule.sqf";
			};
	case 1: { [] execVM "custom\modules\ArsenalModule\initModule.sqf"; };
};