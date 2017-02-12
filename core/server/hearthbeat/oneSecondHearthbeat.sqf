if(!isDedicated) exitWith {};

while {GAME_RUNNING} do {
	sleep 1;

	[ONE_SECOND_HEARTBEATS, []] call CTISHR_fnc_runArrayOfScriptsUnsynced;
};