class DynamicWeatherSpacer{
	title = "";
	values[] = { "" };
	texts[] = { "" };
	default = "";
};

class DynamicWeatherOptionsTitle{
	title = $STR_PARAMS_DYNAMIC_WEATHER_OPTIONS;
	values[] = { "" };
	texts[] = { "" };
	default = "";
};

class InitialWeatherParam {
	title = $STR_PARAMS_STARTING_WEATHER;
	values[] = {0, 1, 2, 3, 4};
	texts[] = {$STR_OPTION_CLEAR,$STR_OPTION_OVERCAST,$STR_OPTION_RAIN,$STR_OPTION_FOG,$STR_OPTION_RANDOM};
	default = 0;
};