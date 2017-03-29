params ["_listBox"];

private ["_filters"];

lbClear _listBox;

_filters = [["",""],["Weapons","CfgWeapons"],["Magazines","CfgMagazines"]];

{
    _index = _listBox lbAdd (_x select 0);
    _listBox lbSetData [ _index, _x select 1 ];
} forEach _filters;