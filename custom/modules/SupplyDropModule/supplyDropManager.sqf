if(!isDedicated) exitWith {};

[["Supply drop monitor loading"]] call CTISHR_fnc_ctiLog;

_blockOffset = 5;
_durationBetweenDrops = ["SupplyDropDurationBetweenDrops", 300] call BIS_fnc_getParamValue;
_maxSupplyDrops = ["SupplyDropMaxSupplyDrops", 3] call BIS_fnc_getParamValue;

[["Duration between drops %1", _durationBetweenDrops]] call CTISHR_fnc_ctiLog;
[["Maximum supply drops %1", _maxSupplyDrops]] call CTISHR_fnc_ctiLog;

while { true } do {
	sleep (_durationBetweenDrops - _blockOffset);

	_currentSupplyDrops = 999;
	waitUntil {
		sleep _blockOffset;
		_currentSupplyDrops = missionNamespace getVariable "CURRENT_AMOUNT_OF_SUPPLY_DROPS";
		[["Current supply drops %1", _currentSupplyDrops]] call CTISHR_fnc_ctiLog;
		_currentSupplyDrops < _maxSupplyDrops
	};

	// start a new drop
	(format ["New supply drop being dropped!"]) remoteExec ["systemChat", 0, false];
	_justPlayers = allPlayers - entities "HeadlessClient_F";
	_randomPlayerPosition = position (selectRandom _justPlayers);
	_pos = [_randomPlayerPosition, 4000, random 360, 0, [0,200], "CargoNet_01_box_F"] call ShkPos_fnc_executeFindPosition;

	_postDropProcessing = {
		params ["_drop"];

		// fill supply drop with contents
		_contents = [] call SD_fnc_createSupplyContents;
		[_drop, _contents] call CTISRV_fnc_fillContainerWithContents;

		// create a marker
		_netId = _drop call BIS_fnc_netId;
		_dropMarkerName = format ["supplydrop_marker_%1", _netId];
		_drop setVariable ["supplydropMarkerName", _dropMarkerName];

		_marker = createMarker [_dropMarkerName, (position _drop)];
		_marker setMarkerShape "ICON";
		_marker setMarkerType "mil_objective";
		_markerText = (markerText "Supply");
		_marker setMarkerText _markerText;

		// create hostile protection detail around the drop
		[_drop] call SD_fnc_spawnProtectionDetail;

		// add event handling
		[["Sending event handler to clients"]] call CTISHR_fnc_ctiLog;
		[ "ADD", _drop ] remoteExec [ "SD_fnc_handleSupplyDropEventHandler", 0, format[ "supplyDrop_%1", _netId ] ];

		// set the current supply drops
		_currentSupplyDrops = missionNamespace getVariable "CURRENT_AMOUNT_OF_SUPPLY_DROPS";
		missionNamespace setVariable ["CURRENT_AMOUNT_OF_SUPPLY_DROPS", (_currentSupplyDrops + 1)];

		// set opened status
		_drop setVariable ["opened", false];
		[_drop] execVM "custom\modules\SupplyDropModule\supplyDropMonitor.sqf";
	};

	["CargoNet_01_box_F", _pos, 100, [0,0,-1.2], _postDropProcessing] call SD_fnc_callSupplyDrop;
};