if(!isDedicated) exitWith {};

private ["_contents", "_supplyDropPosition", "_supplyDropContents", "_obj"];

_contents = ["OpenedSupplyDrops"] call CTISRV_fnc_loadDataBlockInSaveContainer;
{
	_supplyDropPosition = _x select 0;
	_supplyDropContents = _x select 1;

	_obj = createVehicle ["CargoNet_01_box_F", _supplyDropPosition, [], 0, "NONE"];
	_obj setVariable ["opened", true];

	if(count _supplyDropContents > 0) then {
		{_obj addWeaponCargoGlobal [_x, 1]} forEach (_supplyDropContents select 0);
		{_obj addMagazineCargoGlobal [_x, 1]} forEach (_supplyDropContents select 1);
		{_obj addItemCargoGlobal [_x, 1]} forEach (_supplyDropContents select 2);
		{_obj addBackpackCargoGlobal [_x, 1]} forEach (_supplyDropContents select 3);
	};
} forEach _contents;