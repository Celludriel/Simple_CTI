if(!isDedicated) exitWith {};

params[ "_container" ];

//Remove function call for container from JIP queue
remoteExec [ "", format[ "supplyDrop_%1", _container call BIS_fnc_netId ] ];

//Tell all clients to remove their EH
[ "REM", _container ] remoteExec [ "SD_fnc_handleContainerEH", 0 ]; //No JIP they ether have the event or do not

[["Supply drop opened"]] call CTISHR_fnc_ctiLog;
_currentSupplyDrops = missionNamespace getVariable "CURRENT_AMOUNT_OF_SUPPLY_DROPS";
missionNamespace setVariable ["CURRENT_AMOUNT_OF_SUPPLY_DROPS", (_currentSupplyDrops - 1)];
_markerName = _container getVariable "supplydropMarkerName";
deleteMarker _markerName;
_container setVariable ["opened", true];