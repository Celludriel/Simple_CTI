if(!isDedicated) exitWith {};

params ["_contents", "_container"];

diag_log format ["Running fn_saveSlingableArmoryContentsCallBack with %1, %2", _contents, _container];

_markerTag = _container getVariable "markerTag";
_saveKey = format ["slingableArmory_%1", _markerTag];

[_saveKey, _contents] call CTISRV_fnc_storeDataBlockInSaveContainer;