if(!isDedicated) exitWith {};

GROUP_COUNTER = 0;

[] execVM custom\modules\LVSectorMilitarizationModule\config.sqf";

["custom\modules\LVSectorMilitarizationModule\sectorActivationMilitarization.sqf"] call F_addSectorActivationScript;
["custom\modules\LVSectorMilitarizationModule\sectorDeactivationDemilitarization.sqf"] call F_addSectorDeActivationScript;