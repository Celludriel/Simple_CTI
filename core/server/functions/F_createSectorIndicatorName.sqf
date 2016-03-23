if(!isDedicated) exitWith {};

params ["_sector"];
private "_sector";

_sectorName = _sector getVariable "markerName";

_sectorName + "_indicator"