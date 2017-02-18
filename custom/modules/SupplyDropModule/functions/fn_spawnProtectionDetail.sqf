if(!isDedicated) exitWith {};

params[ "_drop"];
private ["_grp", "_unit", "__protectionDetailGroup"];

[["Spawning protection detail around %1", _drop]] call CTISHR_fnc_ctiLog;

_protectionDetailGroup = ["O_G_Soldier_SL_F","O_G_Soldier_F","O_G_Soldier_F","O_G_Soldier_AR_F","O_G_Soldier_AR_F","O_G_Soldier_GL_F","O_G_Soldier_GL_F","O_G_Soldier_LAT_F","O_G_Soldier_LAT_F","O_Soldier_AA_F","O_Soldier_AA_F"];

_grp = createGroup east;
{
	_unit = _grp createUnit [_x, _drop, [], 100, "FORM"];
	[_unit] join _grp;
} forEach _protectionDetailGroup;

_drop setVariable ["protection_detail", _grp];