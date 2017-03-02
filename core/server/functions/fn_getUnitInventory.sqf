params ["_unit"];

[["Calling getUnitInventory"]] call CTISHR_fnc_ctiLog;
[["_unit: %1", _unit]] call CTISHR_fnc_ctiLog;

//Retrieve items
private _itemIsValid = {
	private _r = {
		_this isKindOf [_x, configFile >> "CfgWeapons"]
	} count ["ItemCore", "DetectorCore"];
	_r > 0
};

[["Initialised _itemIsValid"]] call CTISHR_fnc_ctiLog;

private _items = [];
private _magazines = [];
private _carriedWeapons = [];
private _equipedWeapons = [];
private _allWeapons = [];

{
	if(_x call _itemIsValid) then {
		_items pushBack _x;
	};
} forEach uniformItems _unit;

{
	if(_x call _itemIsValid) then {
		_items pushBack _x;
	};
} forEach vestItems _unit;

{
	if(_x call _itemIsValid) then {
		_items pushBack _x;
	};
} forEach  backpackItems _unit;

[["_items: %1", _items]] call CTISHR_fnc_ctiLog;

//Retreieve mags in inventory only
{
	_x params [
		"_class",
		"_ammo",
		"_loaded",
		"_type",
		"_location"
	];
	
	switch(_location) do {
		case "Uniform": {
			_magazines pushBack [_class, _ammo];
		};
		case "Vest": {
			_magazines pushBack [_class, _ammo];
		};
		case "Backpack": {
			_magazines pushBack [_class, _ammo];
		};
	};
} forEach magazinesAmmoFull _unit;

[["_magazines: %1", _magazines]] call CTISHR_fnc_ctiLog;

//Retrieve weapons in uniform vest and backpack
private _uniformContainer =  uniformContainer _unit;
private _uniformWeapons = if(!isNull _uniformContainer) then { weaponsItems _uniformContainer } else { [] };

private _vestContainer =  vestContainer _unit;
private _vestWeapons = if(!isNull _vestContainer) then { weaponsItems _vestContainer } else { [] };

private _backpackContainer =  backpackContainer _unit;
private _backpackWeapons = if(!isNull _backpackContainer) then { weaponsItems _backpackContainer } else { [] };

//Retrieve weapons and loaded mags
_carriedWeapons append _uniformWeapons;
_carriedWeapons append _vestWeapons;
_carriedWeapons append _backpackWeapons;

private _carriedCount = count _carriedWeapons;
{
	private _carried = false;
	private _i = 0;
	while {!_carried && _i < _carriedCount} do {
		_carried = _x isEqualTo (_carriedWeapons select _i);
		_i = _i + 1;
	};
	
	if(!_carried) then {
		_equipedWeapons pushBack _x;
		_carriedWeapons set [_i, -1];
	};
} forEach weaponsItems _unit;

_allWeapons pushBack _uniformWeapons;
_allWeapons pushBack _vestWeapons;
_allWeapons pushBack _backpackWeapons;
_allWeapons pushBack _equipedWeapons;

[["_allWeapons: %1", _allWeapons]] call CTISHR_fnc_ctiLog;

_ret = [ _items, _magazines, _allWeapons ];

_ret