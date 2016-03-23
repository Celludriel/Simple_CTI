if(!isDedicated) exitWith {};

params ["_key", "_data"];
private ["_key", "_data"];

_ctiSaveGame = profileNamespace getVariable SAVEGAME_NAME;
if ( isNil "_ctiSaveGame" ) then {
	_ctiSaveGame = [];
};

{
	if(_x select 0 == _key) then {
		_ctiSaveGame deleteAt _forEachIndex;
	};
} foreach _ctiSaveGame;

_ctiSaveGame pushBack [_key, _data];

profileNamespace setVariable [ SAVEGAME_NAME, _ctiSaveGame];
saveProfileNamespace;