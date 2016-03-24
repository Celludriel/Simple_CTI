[] execVM "custom\modules\SimpleMhqModule\config.sqf";

createMhqVehicle = compileFinal preprocessFileLineNumbers "custom\modules\SimpleMhqModule\createMhqVehicle.sqf";
mhqKilledEventHandler = compileFinal preprocessFileLineNumbers "custom\modules\SimpleMhqModule\mhqKilledEventHandler.sqf";

if(!isDedicated) exitWith {};

[] execVM "custom\modules\SimpleMhqModule\mhqInit.sqf";