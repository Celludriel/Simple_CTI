class ModuleConfigurationSpacer{
	title = "";
	values[] = { "" };
	texts[] = { "" };
	default = "";
};

class ModuleConfiguration{
	title = $STR_PARAMS_MODULE_CONFIGURATION;
	values[] = { "" };
	texts[] = { "" };
	default = "";
};

class WeaponSupply {
	title = $STR_PARAMS_WEAPON_SUPPLY;
	values[] = {0, 1};
	texts[] = { $STR_SCAVENGE, $STR_ARSENAL };
	default = 0;
};

class AiSystem {
	title = $STR_PARAMS_AI_SYSTEM;
	values[] = {0, 1};
	texts[] = { "LV", "T8" };
	default = 1;
};