if(!isDedicated) exitWith {};

params ["_sector"];

_indicatorName = [_sector] call F_createSectorIndicatorName;
[["_indicatorName: %1", _indicatorName]] call F_log;
[["Deleting indicator marker"]] call F_log;
deleteMarker _indicatorName;
[["Indicator marker %1 deleted", _indicatorName]] call F_log;