if(!isDedicated) exitWith {};

params ["_drop"];

_lifeSpan = 0;

while { true } do {
	sleep 5;
	_lifeSpan = _lifeSpan + 5;

	if(_lifeSpan >= 2160) exitWith {};
};

_isOpened = _drop getVariable "opened";
if(!_isOpened) then {
	[["Supply drop expired"]] call CTISHR_fnc_ctiLog;
	_currentSupplyDrops = missionNamespace getVariable "CURRENT_AMOUNT_OF_SUPPLY_DROPS";
	missionNamespace setVariable ["CURRENT_AMOUNT_OF_SUPPLY_DROPS", (_currentSupplyDrops - 1)];
	_markerName = _drop getVariable "supplydropMarkerName";
	deleteMarker _markerName;
	(format ["A supply drop has been salvaged by the enemy, grid %1.", mapGridPosition getPosATL _drop]) remoteExec ["systemChat", 0, false];
	deleteVehicle _drop;
};