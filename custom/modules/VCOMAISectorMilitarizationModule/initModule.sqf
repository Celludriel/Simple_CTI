if(!isDedicated) exitWith {};

[] execVM "custom\modules\VCOMAISectorMilitarizationModule\configurations\groupDefinitions.sqf";

["custom\modules\VCOMAISectorMilitarizationModule\scripts\sectorActivationMilitarization.sqf"] call CTISRV_fnc_addSectorActivationScript;
["custom\modules\VCOMAISectorMilitarizationModule\scripts\sectorDeactivationDemilitarization.sqf"] call CTISRV_fnc_addSectorDeActivationScript;
["custom\modules\VCOMAISectorMilitarizationModule\scripts\sectorDeactivationDemilitarization.sqf"] call CTISRV_fnc_addSectorControlChangeScript;