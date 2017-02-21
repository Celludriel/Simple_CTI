if(!isDedicated) exitWith {};

[["Executing Save"]] call CTISHR_fnc_ctiLog;

[] execVM "core\server\persistence\saveManager.sqf";