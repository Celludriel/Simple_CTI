if(!isDedicated) exitWith {};

[["Supply drop monitor loading"]] call CTISHR_fnc_ctiLog;

_durationBetweenDrops = ["SupplyDropDurationBetweenDrops", 300] call BIS_fnc_getParamValue;
_maxSupplyDrops = ["SupplyDropMaxSupplyDrops", 3] call BIS_fnc_getParamValue;

[["Duration between drops %1", _durationBetweenDrops]] call CTISHR_fnc_ctiLog;
[["Maximum supply drops %1", _maxSupplyDrops]] call CTISHR_fnc_ctiLog;

while { true } do {
	sleep _durationBetweenDrops;

	_currentSupplyDrops = missionNamespace getVariable "CURRENT_AMOUNT_OF_SUPPLY_DROPS";
	[["Current supply drops %1", _currentSupplyDrops]] call CTISHR_fnc_ctiLog;
	
	if(_currentSupplyDrops < _maxSupplyDrops) then {
		// start a new drop
		_justPlayers = allPlayers - entities "HeadlessClient_F";
		_pos = position (_justPlayers select 0);
				
		_postDropProcessing = {
			params ["_drop"];
			// create a marker
			_netId = netId _drop;
			_dropMarkerName = format ["supplydrop_marker_%1", _netId];
			_drop setVariable ["supplydropMarkerName", _dropMarkerName];

			_marker = createMarker [_dropMarkerName, (position _drop)];
			_marker setMarkerShape "ICON";
			_marker setMarkerType "mil_objective";
			_markerText = (markerText "Supply");
			_marker setMarkerText _markerText;

			// create hostile protection detail around the drop		
			
			// create monitor on the drop for when it expires or is found by a player
			[_drop] execVM "custom\modules\SupplyDropModule\supplyDropMonitor.sqf";
		};
		
		["CargoNet_01_box_F", _pos, 100, [0,0,-1.2], _postDropProcessing] call SD_fnc_callSupplyDrop;

		// set the current supply drops
		missionNamespace setVariable ["CURRENT_AMOUNT_OF_SUPPLY_DROPS", (_currentSupplyDrops + 1)];

		

	};
};