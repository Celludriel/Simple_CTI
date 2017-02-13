if(!isDedicated) exitWith {};

params ["_drop"];

_lifeSpan = 0;

while { true } do {
	sleep 5;
	_lifeSpan = _lifeSpan + 5;
	
	if(_lifeSpan >= 2160) exitWith {};
	
	_playerClose = false;
	_entities = _drop nearEntities ["Man", 5];
	{
		if(_x isPlayer) exitWith {
			_playerClose = true;
		};
	} forEach _entities;
	
	if(_playerClose) exitWith {};
};

[["Supply drop found or expired"]] call CTISHR_fnc_ctiLog;
_currentSupplyDrops = missionNamespace getVariable "CURRENT_AMOUNT_OF_SUPPLY_DROPS";
missionNamespace setVariable ["CURRENT_AMOUNT_OF_SUPPLY_DROPS", (_currentSupplyDrops - 1)];
_markerName = _drop getVariable "supplydropMarkerName";
deleteMarker _markerName;