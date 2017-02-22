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