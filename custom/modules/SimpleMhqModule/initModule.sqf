[] execVM "custom\modules\SimpleMhqModule\config.sqf";

createMhqVehicle = compileFinal preprocessFileLineNumbers "custom\modules\SimpleMhqModule\createMhqVehicle.sqf";

if(!isDedicated) exitWith {};

[] execVM "custom\modules\SimpleMhqModule\mhqInit.sqf";