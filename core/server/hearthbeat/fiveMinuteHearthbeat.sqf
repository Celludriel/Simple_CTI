if(!isDedicated) exitWith {};

while {GAME_RUNNING} do {
	sleep 300;

	[FIVE_MINUTE_HEARTHBEATS, []] call CTISHR_fnc_runArrayOfScriptsUnsynced;
};