params ["_playerContainer", "_type"];

private ["_contents"];

_contents = [];

if(_type == "ITEMS") then {
    {
        [_contents, _x, 1] call BIS_fnc_addToPairs;
    } forEach _playerContainer;
};

if(_type == "WEAPONS") then {
    {
        {
            if(typeName _x != "ARRAY") then {
                if(_x != "") then {
                    [_contents, _x, 1] call BIS_fnc_addToPairs;
                };
            };

            if(typeName _x == "ARRAY") then {
                if(count _x > 0) then {
                    _item = _x select 0;
                    if(_item != "") then {
                        [_contents, _item, 1] call BIS_fnc_addToPairs;
                    };
                };
            };
        } forEach _x;
    } forEach _playerContainer;
};

_contents sort false;
_contents