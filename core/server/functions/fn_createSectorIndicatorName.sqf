if(!isDedicated) exitWith {};

params ["_sector"];
private ["_sectorName"];

_sectorName = _sector getVariable "markerName";

_sectorName + "_indicator"