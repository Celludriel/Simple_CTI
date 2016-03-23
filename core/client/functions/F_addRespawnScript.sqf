if(hasInterface) then {
	params ["_script"];
	private "_script";

	RESPAWN_SCRIPTS pushBack _script;

	[["RESPAWN_SCRIPTS: %1", RESPAWN_SCRIPTS]] call F_log;
};
