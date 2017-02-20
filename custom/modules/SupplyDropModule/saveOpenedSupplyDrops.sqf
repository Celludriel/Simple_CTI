if(!isDedicated) exitWith {};

private ["_contents", "_isOpened", "_supplyDropData", "_position", "_supplyDropContents"];

_contents = [];
{
	_isOpened  = _x getVariable ["opened", false];
	if( _isOpened ) then {
		_supplyDropData = [];
		_position = getPosASL _x;
		_supplyDropContents = [_x] call CTISRV_fnc_fetchContentOfInventory;
		_supplyDropData pushBack _position;
		_supplyDropData pushBack _supplyDropContents;
		_contents pushBack _supplyDropData;
	};
} forEach (entities [["CargoNet_01_box_F"], [], true, true]);

["OpenedSupplyDrops", _contents] call CTISRV_fnc_storeDataBlockInSaveContainer;