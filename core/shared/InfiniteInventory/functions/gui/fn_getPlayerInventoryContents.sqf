private ["_playerContainers", "_containerContents", "_contents", "_uniform", "_vest", "_backpack"];

_playerContainers = [] call InfInv_fnc_getPlayerContainers;
_containerContents = [];
_contents = [];

_uniform = _playerContainers select 0;
_vest = _playerContainers select 1;
_backpack = _playerContainers select 2;
_playerWeapons = _playerContainers select 3;

_containerContents = _containerContents + ([_uniform, "ITEMS"] call InfInv_fnc_getContentsFromPlayerContainer);
_containerContents = _containerContents + ([_vest, "ITEMS"] call InfInv_fnc_getContentsFromPlayerContainer);
_containerContents = _containerContents + ([_backpack, "ITEMS"] call InfInv_fnc_getContentsFromPlayerContainer);
_containerContents = _containerContents + ([_playerWeapons, "WEAPONS"] call InfInv_fnc_getContentsFromPlayerContainer);

{
    [_contents, _x select 0, _x select 1] call BIS_fnc_addToPairs;
} forEach _containerContents;

_contents = [_contents,[],{_x select 0},"ASCEND"] call BIS_fnc_sortBy;

_contents