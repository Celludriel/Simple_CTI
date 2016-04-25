class SimpleMhqSpacer{
	title = "";
	values[] = { "" };
	texts[] = { "" };
	default = "";
};

class SimpleMhqTitle{
	title = $STR_PARAMS_SIMPLE_MHQ_TITLE;
	values[] = { "" };
	texts[] = { "" };
	default = "";
};

class SimpleMhqRespawnTime {
	title = $STR_PARAMS_MHQ_RESPAWN_DELAY;
	values[] = {60,300,600};
	texts[] = { $STR_ONE_MINUTE, $STR_FIVE_MINUTES, $STR_TEN_MINUTES };
	default = 60;
};