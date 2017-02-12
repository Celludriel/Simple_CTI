if(!isDedicated) exitWith {};

params ["_player"];

_sectorTags = [];

{
	_sectorTag = _x getVariable ["markerName"];
	_sectorTags pushBack _sectorTag;
} forEach CTI_SECTOR_OBJECTS;

[format ["%1", _sectorTags]] remoteExecCall ["hint", (owner _player)];