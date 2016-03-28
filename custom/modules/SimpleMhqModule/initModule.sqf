_handle = [] execVM "custom\modules\SimpleMhqModule\config.sqf";
waitUntil {isNull _handle};

createMhqVehicle = compileFinal preprocessFileLineNumbers "custom\modules\SimpleMhqModule\createMhqVehicle.sqf";

if(!isDedicated) exitWith {};

[] execVM "custom\modules\SimpleMhqModule\mhqInit.sqf";