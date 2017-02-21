if(!hasInterface) exitWith {};

params ["_obj", "_markerName", "_iconType", "_iconColor"];

[["Executing trackObjectWithIconOnMap: %1, %2; %3, %4", _obj, _markerName, _iconType, _iconColor]] call CTISHR_fnc_ctiLog;

[_obj, _markerName, _iconType, _iconColor] execVm "core\client\scripts\trackObjectWithIconOnMap.sqf";