if(!isDedicated) exitWith {};

GAME_RUNNING = true;
SAVE_LOCK = false;
SAVEGAME_NAME = "CTI_TEMPLATE";
CTI_SECTOR_OBJECTS = [];
SECTOR_COMPLETED_MESSAGE = "<t align='center' size='2.2'>AO Complete</t><br/><t size='1.5' align='center' color='#00FF80'>%1</t><br/>____________________<br/><t align='left'>Fantastic job at %1, boys! Give us a moment here at HQ and we'll line up your next target.</t>";

// Expantion scripts
PRE_INIT_SERVER_SCRIPTS = [];
POST_INIT_SERVER_SCRIPTS = [];

SECTOR_ACTIVATION_SCRIPTS = [];
SECTOR_DEACTIVATION_SCRIPTS = [];
SECTOR_CONTESTED_SCRIPTS = [];
SECTOR_CONTROL_CHANGE_SCRIPTS = [];
SECTOR_CREATED_SCRIPTS = [];
SECTOR_LOADED_SCRIPTS = [];

SAVE_SCRIPTS = [];
LOAD_SCRIPTS = [];

ONE_SECOND_HEARTBEATS = [];
FIVE_MINUTE_HEARTHBEATS = [];

// Sector specific
ACTIVATION_RANGE = 200;
SECTOR_RANGE = 300;
PRESENCE_MANAGER_RUNNING = false;
SECONDS_TO_DEACTIVATION = 60;
SECTOR_TYPES = [["sec_town", "n_art"],["sec_fuel", "loc_Fuelstation"],["sec_base", "o_uav"],["sec_towr", "loc_Transmitter"]];

// Rules
SECTOR_CONTROL_RULE_SCRIPT = "core\server\sector\sectorControlRule.sqf";
GAME_ENDING_RULE_SCRIPT = "core\server\game\gameEndingRule.sqf";

call compileFinal preprocessFileLineNumbers "custom\override\coreSettingOverride.sqf";