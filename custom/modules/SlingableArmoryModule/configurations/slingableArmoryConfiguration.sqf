if(!isDedicated) exitWith {};

private ["_contents", "_weapons", "_ammo", "_items"];

_contents = [];
_weapons = [];
_ammo = [];
_items = [];

_weapons pushBack ["arifle_MX_F", 30];
_weapons pushBack ["srifle_LRR_F", 10];
_weapons pushBack ["LMG_Mk200_F", 10];

_ammo pushBack ["30Rnd_65x39_caseless_mag", 210];
_ammo pushBack ["7Rnd_408_Mag", 50];
_ammo pushBack ["200Rnd_65x39_cased_Box", 30];
_ammo pushBack ["HandGrenade", 150];

_items pushBack ["FirstAidKit", 50];
_items pushBack ["Medikit", 10];
_items pushBack ["ToolKit", 10];

// building and returning of contents array
_contents pushBack _weapons;
_contents pushBack _ammo;
_contents pushBack _items;

missionNamespace setVariable ["SLA_STARTING_ARMORY", _contents];