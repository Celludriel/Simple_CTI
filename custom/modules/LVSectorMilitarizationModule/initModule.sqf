if(!isDedicated) exitWith {};

GROUP_COUNTER = 0;

["custom\modules\LVSectorMilitarizationModule\sectorActivationMilitarization.sqf"] call F_addSectorActivationScript;
["custom\modules\LVSectorMilitarizationModule\sectorDeactivationDemilitarization.sqf"] call F_addSectorDeActivationScript;