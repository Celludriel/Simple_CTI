_handle = [] execVM "custom\modules\SimpleMhqModule\config.sqf";
waitUntil {isNull _handle};
_handle = [] execVm "custom\modules\SimpleMhqModule\gui\guiFunctions.sqf";
waitUntil {isNull _handle};

createMhqVehicle = compileFinal preprocessFileLineNumbers "custom\modules\SimpleMhqModule\createMhqVehicle.sqf";

if(!isDedicated) exitWith {};

createRedeployFlag = compileFinal preprocessFileLineNumbers "custom\modules\SimpleMhqModule\createRedeployFlag.sqf";

[] execVM "custom\modules\SimpleMhqModule\mhqInit.sqf";
