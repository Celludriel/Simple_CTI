if (!isServer) exitWith {};

params ["_origin", "_target"];
private ["_contents", "_contentsToMove"];

_contentsToMove = [_origin] call CTISRV_fnc_getContentsInContainer;

{
    private ["_contents"];

    _contents = _container getVariable ["INFINV_CONTENTS", []];
    [_contents, _x, 1] call BIS_fnc_addToPairs;
    _container setVariable ["INFINV_CONTENTS", _contents];
    _container setVariable ["NeedsRefresh", true, true];
} forEach _contentsToMove;

clearMagazineCargoGlobal _origin;
clearWeaponCargoGlobal _origin;
clearItemCargoGlobal _origin;
clearBackpackCargoGlobal _origin;