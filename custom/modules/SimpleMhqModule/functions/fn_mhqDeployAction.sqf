if(!hasInterface) exitWith {};

[["Calling mhq_deploy_action with %1", _this]] call CTISHR_fnc_ctiLog;

params ["_mhq"];

private ["_isDeployed", "_originalMass", "_pos", "_deployMarkerName",
"_marker", "_markerText", "_dist", "_dir", "_spawnPostion", "_respawnId",
"_weaponSupply"];

_isDeployed = _mhq getVariable "MhqDeployed";
[["_isDeployed: %1", _isDeployed]] call CTISHR_fnc_ctiLog;

if(!_isDeployed)then{
    // Kick everyone out of vehicle
    {
        unassignVehicle _x;
        _x action ["eject", vehicle _x];
        if(_x in (crew _mhq)) then {
            _x action ["getOut", vehicle _x];
        };
        sleep 0.4;
    } foreach crew _mhq;

    // Lock it so nobody can enter
    [_mhq, "LOCKED"] remoteExec ["setVehicleLock", 0, false];

    // Save original mass and increase mass to something unreal so it can't be slingloaded
    _originalMass = getMass _mhq;
    _mhq setVariable ["originalMass", _originalMass, true];
    [_mhq, 20000] remoteExec ["setMass", 0, false];

    // Mark as deployed
    _mhq setVariable ["MhqDeployed", true, true];

    // Deploy
    _pos = getpos _mhq;

    _deployMarkerName = _mhq getVariable "markerName";
    _marker = createMarker [_deployMarkerName + "_indicator",_pos];
    _marker setMarkerShape "ICON";
    _marker setMarkerType "mil_flag";
    _markerText = (markerText _deployMarkerName);
    _marker setMarkerText _markerText;

    _dist         = 10;
    _dir          = random 360;
    _spawnPostion = [(_pos select 0) + (sin _dir) * _dist, (_pos select 1) + (cos _dir) * _dist, 0];

    _respawnId = [west, _spawnPostion, _markerText] call BIS_fnc_addRespawnPosition;
    [["_respawnId: %1", _respawnId]] call CTISHR_fnc_ctiLog;

    _mhq setVariable ["respawnId", _respawnId, true];

    // Handle actions remove deploy add undeploy
    _mhq remoteExec ["removeAllActions", 0, true];

    _weaponSupply = ["WeaponSupply", 0] call BIS_fnc_getParamValue;
    if ( _weaponSupply == 1 ) then {
        [_mhq, [(localize "STR_MHQ_OPEN_ARSENAL"), MHQ_ARSENAL_SCRIPT]] remoteExec ["addAction", 0, true];
    };

    [_mhq, [(localize "STR_MHQ_REDEPLOY"), "[] call MHQ_fnc_mhqUiOpenDialog;"]] remoteExec ["addAction", 0, true];

    _undeployLabel = format ["<t color='#ff1111'>%1</t>", (localize "STR_MHQ_UNDEPLOY")];
    [_mhq, [_undeployLabel, { [_this select 0] call MHQ_fnc_mhqUndeployAction; }]] remoteExec ["addAction", 0, true];

    _selfDestructLabel = format ["<t color='#ff1111'>%1</t>", (localize "STR_MHQ_SELFDESTRUCT")];
    [_mhq, [_selfDestructLabel, { [_this select 0] call MHQ_fnc_mhqSelfDestructAction; }, [], 6, false, false, "", "(speed (vehicle _target)) < 1 && (getPosATL _target) select 2 < 2"]] remoteExec ["addAction", 0, true];
};