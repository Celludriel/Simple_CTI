if(!isDedicated) exitWith {};

GROUP_COUNTER = 0;

[] execVM "custom\modules\LVSectorMilitarizationModule\config.sqf";

["custom\modules\LVSectorMilitarizationModule\sectorActivationMilitarization.sqf"] call CTISRV_fnc_addSectorActivationScript;
["custom\modules\LVSectorMilitarizationModule\sectorDeactivationDemilitarization.sqf"] call CTISRV_fnc_addSectorDeActivationScript;