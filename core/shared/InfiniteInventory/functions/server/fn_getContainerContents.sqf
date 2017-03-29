if(!isServer) exitWith {};

params ["_container", "_clientID"];

_retValue = _container getVariable ["INFINV_CONTENTS", []];
[_retValue] remoteExecCall ["InfInv_fnc_loadInventoryContainer", _clientID];