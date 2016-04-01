if(!isDedicated) exitWith {};

params ["_sector"];

_indicatorName = [_sector] call CTISRV_fnc_createSectorIndicatorName;
[["_indicatorName: %1", _indicatorName]] call CTISHR_fnc_ctiLog;
[["Deleting indicator marker"]] call CTISHR_fnc_ctiLog;
deleteMarker _indicatorName;
[["Indicator marker %1 deleted", _indicatorName]] call CTISHR_fnc_ctiLog;