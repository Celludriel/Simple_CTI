if(!isDedicated) exitWith {};

if(!SAVE_LOCK) then {
	SAVE_LOCK = true;
	_ctiSectorObjectData = [];

	{
		_sectorData = [];
		_sectorData pushBack (_x getVariable "markerName");
		_sectorData pushBack (_x getVariable "side");
		_ctiSectorObjectData pushBack _sectorData;
	} forEach CTI_SECTOR_OBJECTS;

	["core", _ctiSectorObjectData] call CTISRV_fnc_storeDataBlockInSaveContainer;

	[SAVE_SCRIPTS, []] call CTISHR_fnc_runArrayOfScriptsUnsynced;
	SAVE_LOCK = false;
};