params ["_map", "_key"];

private ["_keys","_indx"];

_keys = missionNamespace getVariable [format ["%1_KEYS", _map], []];
_indx = _keys find (_key);

if (_indx < 0) exitWith {};

(missionNamespace getVariable [format ["%1_VALS", _map], []]) select _indx