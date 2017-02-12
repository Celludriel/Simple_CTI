if(!isDedicated) exitWith {};

missionNamespace setVariable ["CURRENT_AMOUNT_OF_SUPPLY_DROPS", 0];

[] execVm "custom\modules\SupplyDropModule\supplyDropMonitor.sqf";