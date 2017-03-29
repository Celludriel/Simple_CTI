private ["_contents"];

_contents = [] call InfInv_fnc_getPlayerInventoryContents;

[false] call InfInv_fnc_toggleControls;
{
    for[{_i=0;}, {_i < _x select 1}, {_i=_i+1;}] do {
        [_x select 0] call InfInv_fnc_removeItemFromPlayer;
    };
} forEach _contents;
[INFINV_CURRENT_CONTAINER, _contents, clientOwner] remoteExecCall ["InfInv_fnc_addAllToContainerContents", 2];