if(!isDedicated) exitWith {};

private ["_contents"];

_contents = [];

_contents pushBack ["arifle_MX_F", 10];
_contents pushBack ["srifle_LRR_F", 2];
_contents pushBack ["LMG_Mk200_F", 2];

_contents pushBack ["30Rnd_65x39_caseless_mag", 70];
_contents pushBack ["7Rnd_408_Mag", 6];
_contents pushBack ["200Rnd_65x39_cased_Box", 6];
_contents pushBack ["HandGrenade", 10];

_contents pushBack ["FirstAidKit", 10];
_contents pushBack ["Medikit", 4];
_contents pushBack ["ToolKit", 4];

missionNamespace setVariable ["SLA_STARTING_ARMORY", _contents];