class SupplyDropSpacer{
	title = "";
	values[] = { "" };
	texts[] = { "" };
	default = "";
};

class SupplyDropOptionsTitle{
	title = $STR_PARAMS_SUPPLYDROP_OPTIONS;
	values[] = { "" };
	texts[] = { "" };
	default = "";
};

class SupplyDropMaxSupplyDrops{
	title = $STR_PARAMS_MAX_SUPPLY_DROPS;
	values[] = { 1, 3, 5 };
	texts[] = { 1, 3, 5 };
	default = 3;
};

class SupplyDropDurationBetweenDrops{
	title = $STR_PARAMS_DURATION_BETWEEN_DROPS;
	values[] = { 60, 300, 600, 1800, 3600 };
	texts[] = { "1m", "5m", "10m", "30m", "1h" };
	default = 300;
};

class SupplyDropUseMarksmanRifles{
	title = $STR_PARAMS_USE_MARKSMAN_RIFLES;
	values[] = { 1, 0 };
	texts[] = { $STR_OPTION_YES, $STR_OPTION_NO };
	default = 0;
};

class SupplyDropExpirationTime{
	title = $STR_PARAMS_SUPPLYDROP_EXPIRATION;
	values[] = { 3600, 10800, 18000};
	texts[] = { "1h", "3h", "5h" };
	default = 3600;
};