if(!isDedicated) exitWith {};

params ["_sectorTag", "_newSide"];

_sector = nil;
{
	_sectorName = _x getVariable "markerName";
	if(_sectorName == _sectorTag) exitWith {
		_sector = _x;
	};
} forEach CTI_SECTOR_OBJECTS;

// Change sides of sector and turn neutral again
_sector setVariable ["side", _newSide, false];
_sector setVariable ["condition", "neutral", false];

if (_newSide == west) then {
	_sectorTag setMarkerColor "ColorBLUFOR";
} else {
	_sectorTag setMarkerColor "ColorOPFOR";
};

// Remove indication marker
[_sector] call CTISRV_fnc_deleteIndicatorMarker;

// Update the difficulty of the mission
[] call CTISRV_fnc_updateMissionDifficulty;

// Run all scripts pertaining sector control change
[SECTOR_CONTROL_CHANGE_SCRIPTS, [_sector, _sectorBLUFORcount, _sectorOPFORcount]] call CTISHR_fnc_runArrayOfScriptsUnsynced;