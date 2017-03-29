private _addToContents = {
    params ["_contents", "_item", "_baseWeapons"];
    if ( isClass (configFile >> "CFGweapons" >> _x)) then {
       //is weapon do nothing will be handled later
       if(!((_x call Bis_fnc_BaseWeapon) in _baseWeapons)) then {
            _contents pushBack _x;
       }
    }else{
       if ( isClass (configFile >> "CFGMagazines" >> _x)) then {
           _contents pushBack _x;
       }else{
           _contents pushBack _x;
       };
    };
    _contents
};

//Retrieve weapons in uniform vest and backpack
private _uniformContainer =  uniformContainer player;
private _uniformWeapons = if(!isNull _uniformContainer) then { weaponsItems _uniformContainer } else { [] };
_uniformBaseWeapons = [];
{
    _uniformBaseWeapons pushBack (_x select 0);
} forEach _uniformWeapons;

private _vestContainer =  vestContainer player;
private _vestWeapons = if(!isNull _vestContainer) then { weaponsItems _vestContainer } else { [] };
_vestBaseWeapons = [];
{
    _vestBaseWeapons pushBack (_x select 0);
} forEach _vestWeapons;

private _backpackContainer =  backpackContainer player;
private _backpackWeapons = if(!isNull _backpackContainer) then { weaponsItems _backpackContainer } else { [] };
_backpackBaseWeapons = [];
{
    _backpackBaseWeapons pushBack (_x select 0);
} forEach _backpackWeapons;

//player carried weapons
private _playerWeapons = weaponsItems player;

//Retrieve items
private _uniformItems = [];
if(!isNull _uniformContainer) then {
    {
        _uniformItems = [_uniformItems, _x, _uniformBaseWeapons] call _addToContents;
    } forEach uniformItems player;
};

private _vestItems = [];
if(!isNull _vestContainer) then {
    {
        _vestItems = [_vestItems, _x, _vestBaseWeapons] call _addToContents;
    } forEach vestItems player;
};

private _backpackItems = [];
if(!isNull _backpackContainer) then {
    {
        _backpackItems = [_backpackItems, _x, _backpackBaseWeapons] call _addToContents;
    } forEach  backpackItems player;
};

_ret = [
        _uniformItems,
        _vestItems,
        _backpackItems,
        _playerWeapons
];

_ret