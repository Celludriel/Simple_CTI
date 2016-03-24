if(!isDedicated) exitWith {};

[] execVM "custom\modules\SimpleMhqModule\config.sqf";

createMhqVehicle = compileFinal preprocessFileLineNumbers "custom\modules\SimpleMhqModule\createMhqVehicle.sqf";

[] execVM "custom\modules\SimpleMhqModule\mhqInit.sqf";