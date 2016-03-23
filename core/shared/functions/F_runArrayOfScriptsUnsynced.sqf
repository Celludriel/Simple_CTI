params ["_scripts", "_scriptParams"];
private ["_scripts", "_scriptParams"];

{
	[["Running %1 with params: %2", _x, _scriptParams]] call F_log;
	_scriptParams execVM _x;
} forEach _scripts;