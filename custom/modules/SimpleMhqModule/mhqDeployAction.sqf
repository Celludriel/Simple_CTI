[["Calling mhq_deploy_action with %1", _this]] call F_log;

params ["_mhq", "_caller", "_actionId", "_arguments"];
private ["_mhq", "_caller", "_actionId", "_arguments"];

_isDeployed = _mhq getVariable "MhqDeployed";
[["_isDeployed: %1", _isDeployed]] call F_log;

if(!_isDeployed)then{

    _mhq setVehicleLock "LOCKED";
    {
        unassignVehicle _x;
        _x action ["getOut", vehicle _x];
        sleep 0.4;
    } foreach crew _mhq;

    _mhq setVariable ["MhqDeployed", true, true];

    _pos          = getpos _mhq;
    _dist         = random 2;
    _dir          = random 360;
    _spawnPostion = [(_pos select 0) + (sin _dir) * _dist, (_pos select 1) + (cos _dir) * _dist, 0];

    _respawnId = [west, _spawnPostion, "MHQ"] call BIS_fnc_addRespawnPosition;
    [["_respawnId: %1", _respawnId]] call F_log;

    _mhq setVariable ["respawnId", _respawnId, true];

    [_mhq, _actionId] remoteExec ["removeAction", 0, true];
    [_mhq, [(localize "STR_MHQ_UNDEPLOY"), "custom\modules\SimpleMhqModule\mhqUndeployAction.sqf"]] remoteExec ["addAction", 0, true];
};