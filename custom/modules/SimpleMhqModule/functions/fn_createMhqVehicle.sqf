if(!isDedicated) exitWith {};

params ["_marker", "_type"];

private ["_mhq", "_coord", "_deployLabel", "_selfDestructLabel"];

_coord = getmarkerpos _marker;
_mhq = createVehicle [_type, _coord, [], 0, "can_collide"];

waitUntil { !isNil("_mhq") };

// Clear all cargo from the vehicle
clearMagazineCargoGlobal _mhq;
clearWeaponCargoGlobal _mhq;
clearItemCargoGlobal _mhq;
clearBackpackCargoGlobal _mhq;

_mhq setDir (markerDir _marker);
_mhq setVariable ["markerName", _marker, true];
_mhq setVariable ["type", _type, true];
_mhq setVariable ["MhqDeployed", false, true];

[[_mhq, _marker], "custom\modules\SimpleMhqModule\scripts\mhqPositionMarker.sqf"] remoteExec ["execVM", -2, true];


_deployLabel = format ["<t color='#11ff11'>%1</t>", (localize "STR_MHQ_DEPLOY")];
[_mhq, [_deployLabel, { [_this select 0] call MHQ_fnc_mhqDeployAction; }, [], 6, false, false, "", "(speed (vehicle _target)) < 1 && (getPosATL _target) select 2 < 2"]] remoteExec ["addAction", 0, true];

_selfDestructLabel = format ["<t color='#ff1111'>%1</t>", (localize "STR_MHQ_SELFDESTRUCT")];
[_mhq, [_selfDestructLabel, { [_this select 0] call MHQ_fnc_mhqSelfDestructAction; }, [], 6, false, false, "", "(speed (vehicle _target)) < 1 && (getPosATL _target) select 2 < 2"]] remoteExec ["addAction", 0, true];

[_mhq] execVM "custom\modules\SimpleMhqModule\scripts\mhqAliveMonitor.sqf";

_mhq