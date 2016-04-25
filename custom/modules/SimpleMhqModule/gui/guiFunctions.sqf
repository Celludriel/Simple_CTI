mhqOpenDialog = {
	if(isNull (findDisplay 1900)) then {
		if(!createDialog "MhqDeployDialog") exitWith {hint "Something went wrong, the dialog won't open?"};

		_index = lbAdd [1500, "Base"];
		lbSetValue [1500, _index, -1];

		_respawnPositions = missionnamespace getVariable ["BIS_fnc_getRespawnPositions_listwest", []];
		diag_log format ["RespawnPositions: %1", _respawnPositions];
		if(count _respawnPositions > 0) then {
			_respawnPositionTextArray = _respawnPositions select 3;
			if(count _respawnPositionTextArray > 0) then {
				for "_i" from 0 to ((count _respawnPositionTextArray)-1) do {
					_spawnPositionText = _respawnPositionTextArray select _i;
					_index = lbAdd [1500, _spawnPositionText];
					lbSetValue [1500, _index, _i];
				};
			};
		};
	};
};

mhqDeployAction = {

	_selection = lbCurSel 1500;

	if(_selection == -1) exitWith {hint "Nothing Selected"; 1500 lbSetCurSel 0;};

	_selectionData = lbValue [1500,_selection];

	if(_selectionData == -1) then {
		player setPos (getMarkerPos "respawn_west_1");
	} else {
		_respawnPositions = missionnamespace getVariable ["BIS_fnc_getRespawnPositions_listwest", []];
		if(count _respawnPositions > 0) then {
			_respawnPositionPositionArray = _respawnPositions select 2;

			_deployPosition = _respawnPositionPositionArray	select _selectionData;
			player setPos _deployPosition;
		};
	};

	closeDialog 1;
};