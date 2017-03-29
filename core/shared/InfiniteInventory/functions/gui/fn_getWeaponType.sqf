params ["_itemString"];

private ["_retValue", "_type"];

_retValue = "NO_WEAPON";

if(isClass( configFile >> "CfgWeapons" >> _itemString )) then {
    _type = getNumber( configFile >> "CfgWeapons" >> _itemString >> "type" );

    switch _type do {
        case 1: { _retValue = "PRIMARY"; };
        case 4: { _retValue = "SECONDARY"; };
        case 2: { _retValue = "HANDGUN"; };
    };
};

_retValue