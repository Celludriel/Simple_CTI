#include "..\..\..\core\server\ai\T8\MACRO.hpp"

// wait until everything is initalized correctly
waitUntil { !isNil "T8U_var_useHC" };
waitUntil { !isNil "T8U_var_InitDONE" };

[] execVM "custom\modules\T8SectorMilitarizationModule\configurations\groupDefinitions.sqf";

["custom\modules\T8SectorMilitarizationModule\scripts\sectorActivationMilitarization.sqf"] call CTISRV_fnc_addSectorActivationScript;
["custom\modules\T8SectorMilitarizationModule\scripts\sectorDeactivationDemilitarization.sqf"] call CTISRV_fnc_addSectorDeActivationScript;
["custom\modules\T8SectorMilitarizationModule\scripts\sectorDeactivationDemilitarization.sqf"] call CTISRV_fnc_addSectorControlChangeScript;