if(!isDedicated) exitWith {};

private ["_contents", "_weapons", "_ammo", "_items"];

_contents = [];
_weapons = [];
_ammo = [];
_items = [];

_weapons pushBack ["arifle_MX_F", 10];
_weapons pushBack ["srifle_LRR_F", 2];
_weapons pushBack ["LMG_Mk200_F", 2];

_ammo pushBack ["30Rnd_65x39_caseless_mag", 70];
_ammo pushBack ["7Rnd_408_Mag", 6];
_ammo pushBack ["200Rnd_65x39_cased_Box", 6];
_ammo pushBack ["HandGrenade", 10];

_items pushBack ["FirstAidKit", 10];
_items pushBack ["Medikit", 4];
_items pushBack ["ToolKit", 4];

// building and returning of contents array
_contents pushBack _weapons;
_contents pushBack _ammo;
_contents pushBack _items;

missionNamespace setVariable ["SLA_STARTING_ARMORY", _contents];