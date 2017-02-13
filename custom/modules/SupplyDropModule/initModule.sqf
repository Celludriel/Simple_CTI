if(!isDedicated) exitWith {};

[["Init supply drop module"]] call CTISHR_fnc_ctiLog;

missionNamespace setVariable ["CURRENT_AMOUNT_OF_SUPPLY_DROPS", 0];

[] execVm "custom\modules\SupplyDropModule\supplyDropManager.sqf";