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