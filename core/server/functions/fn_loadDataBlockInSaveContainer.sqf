if(!isDedicated) exitWith {};

params ["_key"];
private ["_ctiSaveGame", "_retValue"];

//Data shouldn't be loaded when a save is in progress so wait until the lock is false (deadlock danger if it never gets to false)
waitUntil { !SAVE_LOCK };

_ctiSaveGame = profileNamespace getVariable [SAVEGAME_NAME, []];

_retValue = [];
if(count _ctiSaveGame > 0) then {
	{
		if(_x select 0 == _key) then {
			_retValue = _x select 1;
		};
	}forEach _ctiSaveGame;
};

_retValue