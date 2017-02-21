params ["_obj"];
private ["_return", "_className", "_tb", "_tm", "_tw"];

_return = false;

// write code here
_className = typeOf _obj;
_tb = getNumber (configFile >> "CfgVehicles" >> _className >> "transportmaxbackpacks");
_tm = getNumber (configFile >> "CfgVehicles" >> _className >> "transportmaxmagazines");
_tw = getNumber (configFile >> "CfgVehicles" >> _className >> "transportmaxweapons");
_return = if (_tb > 0  || _tm > 0 || _tw > 0) then { true; } else { false; };

_return