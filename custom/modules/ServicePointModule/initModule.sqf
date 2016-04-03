if(!isDedicated) exitWith {};

_handle = [] execVM "custom\modules\ServicePointModule\config.sqf";
waitUntil {isNull _handle};

createServicePoint = compileFinal preprocessFileLineNumbers "custom\modules\ServicePointModule\createServicePoint.sqf";

[] execVM "custom\modules\ServicePointModule\initServicePoints.sqf";