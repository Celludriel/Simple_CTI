if(hasInterface) then {
	params ["_script"];

	RESPAWN_SCRIPTS pushBack _script;

	[["RESPAWN_SCRIPTS: %1", RESPAWN_SCRIPTS]] call CTISHR_fnc_ctiLog;
};
