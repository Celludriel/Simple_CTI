if(isDedicated) exitWith {};

params[ "_drop" ];

[["Spawning protection detail around %1", _drop]] call CTISHR_fnc_ctiLog;

_grp = createGroup east;
for "_i" from 1 to 8 do {
	_unit = _grp createUnit ["O_G_Soldier_lite_F", _drop, [], 100, "FORM"];
	[_unit] join _grp ;
};