if(!isDedicated) exitWith {};

GROUP_COUNTER = 0;

["custom\modules\LVSectorMilitarizationModule\scripts\sectorActivationMilitarization.sqf"] call CTISRV_fnc_addSectorActivationScript;
["custom\modules\LVSectorMilitarizationModule\scripts\sectorDeactivationDemilitarization.sqf"] call CTISRV_fnc_addSectorDeActivationScript;