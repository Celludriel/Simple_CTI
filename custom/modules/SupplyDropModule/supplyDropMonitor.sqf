if(!isDedicated) exitWith {};

params ["_drop"];

_supplyDropExpirationTime = ["SupplyDropExpirationTime", 3600] call BIS_fnc_getParamValue;
_hearthBeat = 5;
_lifeSpan = 0;

while { true } do {
	sleep _hearthBeat;
	_lifeSpan = _lifeSpan + _hearthBeat;

	if(_lifeSpan >= (_supplyDropExpirationTime - _hearthBeat)) exitWith {};
};

_isOpened = _drop getVariable "opened";
if(!_isOpened) then {
	[["Supply drop expired"]] call CTISHR_fnc_ctiLog;
	_currentSupplyDrops = missionNamespace getVariable "CURRENT_AMOUNT_OF_SUPPLY_DROPS";	
	missionNamespace setVariable ["CURRENT_AMOUNT_OF_SUPPLY_DROPS", (_currentSupplyDrops - 1)];
	_markerName = _drop getVariable "supplydropMarkerName";
	deleteMarker _markerName;
	(format ["A supply drop has been salvaged by the enemy, grid %1.", mapGridPosition getPosATL _drop]) remoteExec ["systemChat", 0, false];
	_group = _drop getVariable "protection_detail";
	{deleteVehicle _x} forEach units _group;
	deleteVehicle _drop;
};