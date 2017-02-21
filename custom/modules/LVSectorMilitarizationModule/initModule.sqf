if(!isDedicated) exitWith {};

GROUP_COUNTER = 0;

["custom\modules\LVSectorMilitarizationModule\sectorActivationMilitarization.sqf"] call CTISRV_fnc_addSectorActivationScript;
["custom\modules\LVSectorMilitarizationModule\sectorDeactivationDemilitarization.sqf"] call CTISRV_fnc_addSectorDeActivationScript;