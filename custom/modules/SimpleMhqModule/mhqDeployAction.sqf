[["Calling mhq_deploy_action with %1", _this]] call F_log;

params ["_mhq", "_actionId"];
private ["_mhq", "_actionId"];

_isDeployed = _mhq getVariable "MhqDeployed";
[["_isDeployed: %1", _isDeployed]] call F_log;

if(!_isDeployed)then{

    _mhq setVehicleLock "LOCKED";
    _mhq setVariable ["MhqDeployed", true, true];

    _pos          = getpos _mhq;
    _dist         = random 2;
    _dir          = random 360;
    _spawnPostion = [(_pos select 0) + (sin _dir) * _dist, (_pos select 1) + (cos _dir) * _dist, 0];

    _respawnId = [west, _spawnPostion, "MHQ"] call BIS_fnc_addRespawnPosition;
    _mhq setVariable ["respawnId", _respawnId, true];

    _mhq addAction ["Undeploy", {
                                    [[[_this select 0, _this select 2], "custom\modules\SimpleMhqModule\mhqUndeployAction.sqf"], "BIS_fnc_execVM", true, true] call BIS_fnc_MP;
                                }];
    _mhq removeAction _actionId;
};