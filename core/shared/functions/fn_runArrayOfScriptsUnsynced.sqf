params ["_scripts", "_scriptParams"];

{
	[["Running %1 with params: %2", _x, _scriptParams]] call CTISHR_fnc_ctiLog;
	_scriptParams execVM _x;
} forEach _scripts;