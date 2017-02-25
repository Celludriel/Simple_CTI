params ["_map", "_key", "_value"];

private ["_map","_keysRef","_valsRef","_keys","_vals","_key","_indx"];

_keysRef = format ["%1_KEYS", _map];
_valsRef = format ["%1_VALS", _map];

if (isNil _keysRef || isNil _valsRef) then {
    missionNamespace setVariable [_keysRef, []];
    missionNamespace setVariable [_valsRef, []];
};

_keys = missionNamespace getVariable _keysRef;
_vals = missionNamespace getVariable _valsRef;
_indx = _keys find _key;

if (_indx < 0) then {
    _indx = count _keys;
    _keys set [_indx, _key];
};

_vals set [_indx, _value];
_map