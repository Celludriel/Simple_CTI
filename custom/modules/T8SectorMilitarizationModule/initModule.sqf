#include "T8\MACRO.hpp"

// wait until everything is initalized correctly
waitUntil { !isNil "T8U_var_useHC" };
waitUntil { !isNil "T8U_var_InitDONE" };

F_removeUnit = compileFinal preprocessFileLineNumbers "custom\modules\T8SectorMilitarizationModule\F_removeUnit.sqf";

["custom\modules\T8SectorMilitarizationModule\sectorActivationMilitarization.sqf"] call CTISRV_fnc_addSectorActivationScript;
["custom\modules\T8SectorMilitarizationModule\sectorDeactivationDemilitarization.sqf"] call CTISRV_fnc_addSectorDeActivationScript;
["custom\modules\T8SectorMilitarizationModule\sectorDeactivationDemilitarization.sqf"] call CTISRV_fnc_addSectorControlChangeScript;