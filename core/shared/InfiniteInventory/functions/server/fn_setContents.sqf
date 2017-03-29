if(!isServer) exitWith {};

params ["_container", ["_contents", []]];

_container setVariable ["INFINV_CONTENTS", _contents];
_container setVariable ["NeedsRefresh", true, true];