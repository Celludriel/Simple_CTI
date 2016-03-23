if(!isDedicated) exitWith {};

_clearSave = "ClearSave" call BIS_fnc_getParamValue;
if(!isNil("_clearSave") && _clearSave == 1) then {
	profileNamespace setVariable [SAVEGAME_NAME, nil];
	saveProfileNamespace;
};

_ctiSectorObjectData = ["core"] call F_loadDataBlockInSaveContainer;
if ( count _ctiSectorObjectData > 0 ) then {

	{
		_markerName = _x select 0;
		_side = _x select 1;

		_markerLocation = getmarkerpos _markerName;
		_invisibleSectorObject = [_markerLocation] call F_spawnInvisibleObject;
		_invisibleSectorObject setVariable ["markerName", _markerName, false];
		_invisibleSectorObject setVariable ["side", _side, false];
		_invisibleSectorObject setVariable ["condition", "neutral", false];

		CTI_SECTOR_OBJECTS pushback _invisibleSectorObject;
	} forEach _ctiSectorObjectData;

	[LOAD_SCRIPTS, []] call F_runArrayOfScriptsUnsynced;
};