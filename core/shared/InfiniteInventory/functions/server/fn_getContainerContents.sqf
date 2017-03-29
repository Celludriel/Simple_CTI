if(!isServer) exitWith {};

params ["_container", "_callbackMethod", "_clientID"];

_retValue = _container getVariable ["INFINV_CONTENTS", []];
 
[_retValue, _container] remoteExecCall [_callbackMethod, _clientID];