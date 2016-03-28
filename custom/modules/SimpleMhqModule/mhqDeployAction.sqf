[["Calling mhq_deploy_action with %1", _this]] call F_log;

params ["_mhq", "_caller", "_actionId", "_arguments"];
private ["_mhq", "_caller", "_actionId", "_arguments"];

_isDeployed = _mhq getVariable "MhqDeployed";
[["_isDeployed: %1", _isDeployed]] call F_log;

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
    [_mhq, "LOCKED"] remoteExec ["setVehicleLock", 2, false];

    // Save original mass and increase mass to something unreal so it can't be slingloaded
    _originalMass = _mhq getMass;
    _mhq setVariable ["originalMass", _originalMass, true];
    [_mhq, 20000] remoteExec ["setMass", 2, false];

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
    [["_respawnId: %1", _respawnId]] call F_log;

    _mhq setVariable ["respawnId", _respawnId, true];

    // Handle actions remove deploy add undeploy
    [_mhq, _actionId] remoteExec ["removeAction", 0, true];
    [_mhq, [(localize "STR_MHQ_UNDEPLOY"), "custom\modules\SimpleMhqModule\mhqUndeployAction.sqf"]] remoteExec ["addAction", 0, true];
};