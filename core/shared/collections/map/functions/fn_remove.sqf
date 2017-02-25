params ["_map", "_key"];

private ["_map","_keys","_vals","_indx"];

_keys = missionNamespace getVariable [format ["%1_KEYS", _map], []];
_vals = missionNamespace getVariable [format ["%1_VALS", _map], []];

_indx = _keys find (_key);

if (_indx < 0) exitWith {false};

_keys set [_indx, nil];
_vals set [_indx, nil];

true