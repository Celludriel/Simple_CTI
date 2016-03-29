class TimeAccelerationSpacer{
	title = "";
	values[] = { "" };
	texts[] = { "" };
	default = "";
};

class TimeAccelerationOptionsTitle{
	title = $STR_PARAMS_TIME_ACCELERATION_OPTIONS;
	values[] = { "" };
	texts[] = { "" };
	default = "";
};

class TimeAccelerationDayDuration {
	title = $STR_PARAMS_DAYDURATION;
	values[] = { 48, 24, 16, 12, 9.6, 8, 6.8, 6, 4.8, 4, 3, 2.4, 2, 1.6, 1 };
	texts[] = { "0.5", "1", "1.5", "2", "2.5", "3", "3.5", "4", "5", "6", "8", "10", "12", "15", "24" };
	default = 12;
};

class TimeAccelerationShorterNights {
	title = $STR_SHORTER_NIGHTS_PARAM;
	values[] = {1,0};
	texts[] = { $STR_OPTION_YES, $STR_OPTION_NO };
	default = 0;
};