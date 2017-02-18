if(!isDedicated) exitWith {};

private ["_useMarksmanRifles"];

[["Init supply drop module"]] call CTISHR_fnc_ctiLog;

_useMarksmanRifles = ["SupplyDropUseMarksmanRifles", false] call BIS_fnc_getParamValue;

missionNamespace setVariable ["CURRENT_AMOUNT_OF_SUPPLY_DROPS", 0];

[] execVm "custom\modules\SupplyDropModule\configurations\assaultRifles.sqf";
[] execVm "custom\modules\SupplyDropModule\configurations\sniperRifles.sqf";
[] execVm "custom\modules\SupplyDropModule\configurations\lightMachineGuns.sqf";
[] execVm "custom\modules\SupplyDropModule\configurations\mediumMachineGuns.sqf";
[] execVm "custom\modules\SupplyDropModule\configurations\submachineGuns.sqf";
[] execVm "custom\modules\SupplyDropModule\configurations\antiAir.sqf";
[] execVm "custom\modules\SupplyDropModule\configurations\rocketLaunchers.sqf";

if(_useMarksmanRifles == 1) then {
	[] execVm "custom\modules\SupplyDropModule\configurations\marksmanRifles.sqf";
};

[] execVm "custom\modules\SupplyDropModule\supplyDropManager.sqf";