if(!isDedicated) exitWith {};

params ["_player"];

diag_log format ["Calling adminListSectors with %1", _player];

_sectorTags = [];

{
	_sectorTag = _x getVariable "markerName";
	_sectorTags pushBack _sectorTag;
} forEach CTI_SECTOR_OBJECTS;

_output = format ["%1", _sectorTags];
[[_output]] call CTISHR_fnc_ctiLog;
(_output) remoteExecCall ["hint", (owner _player)];