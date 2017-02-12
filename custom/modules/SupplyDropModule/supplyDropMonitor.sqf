if(!isDedicated) exitWith {};

_durationBetweenDrops = ["SupplyDropDurationBetweenDrops", 300] call BIS_fnc_getParamValue;
_maxSupplyDrops = ["SupplyDropMaxSupplyDrops", 3] call BIS_fnc_getParamValue;
_currentSupplyDrops = missionNamespace getVariable "CURRENT_AMOUNT_OF_SUPPLY_DROPS";

while { true } do {
	sleep _durationBetweenDrops;

	if(_currentSupplyDrops < _maxSupplyDrops) then {
		// start a new drop
		_pos = position player;
		_drop = ["CargoNet_01_box_F", _pos, 100, [0,0,-1.2]] call SD_fnc_callSupplyDrop;

		// set the current supply drops
		missionNamespace setVariable ["CURRENT_AMOUNT_OF_SUPPLY_DROPS", (_currentSupplyDrops + 1)];

		// create a marker
		_netId = netId _drop;
		_dropMarkerName = format ["supplydrop_marker_%1", _netId];
		_drop setVariable ["supplydropMarkerName", _dropMarkerName];

	    _marker = createMarker [_dropMarkerName, _pos];
	    _marker setMarkerShape "ICON";
	    _marker setMarkerType "mil_objective";
	    _markerText = (markerText "Supply");
	    _marker setMarkerText _markerText;

	    // create the eventhandler ContainerOpened that will reduce the supply drops and clean up the marker
		_drop addEventHandler ["ContainerOpened",{
				_container = (_this select 0);
				_currentSupplyDrops = missionNamespace getVariable "CURRENT_AMOUNT_OF_SUPPLY_DROPS";
				missionNamespace setVariable ["CURRENT_AMOUNT_OF_SUPPLY_DROPS", (_currentSupplyDrops - 1)];
				_markerName = _container getVariable "supplydropMarkerName";
				deleteMarker _markerName;
			}];

		// create hostile protection detail around the drop
	};
};