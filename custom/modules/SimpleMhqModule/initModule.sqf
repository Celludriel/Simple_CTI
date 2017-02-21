_handle = [] execVM "custom\modules\SimpleMhqModule\configurations\config.sqf";
waitUntil {isNull _handle};

if(!isDedicated) exitWith {};

[] execVM "custom\modules\SimpleMhqModule\mhqInit.sqf";