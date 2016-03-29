if(!isDedicated) exitWith {};

private ["_accelerationFactor","_shorterNights"];

_accelerationFactor = "TimeAccelerationDayDuration" call BIS_fnc_getParamValue;
_shorterNights = "TimeAccelerationShorterNights" call BIS_fnc_getParamValue;

[_accelerationFactor,_shorterNights] execVm "custom\modules\TimeAccelerationModule\manageTime.sqf";