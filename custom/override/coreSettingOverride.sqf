// Run mission in debug (default=true)
// DEBUG_ENABLED = false;

if(!isDedicated) exitWith {};

// Radius added to sector radius deciding a sector gets activated in meters (default=200)
// ACTIVATION_RANGE = 200;

// Radius of a sector in meters (default=300)
// SECTOR_RANGE = 300;

// Seconds it takes for a sector marked as deactivation to go back to neutral (default=60)
SECONDS_TO_DEACTIVATION = 600;

// Name of the savegame can be used to create multiple savegames
// SAVEGAME_NAME = "CTI_TEMPLATE";

// Message that appears when a sector is taken over by BLUFOR
// SECTOR_COMPLETED_MESSAGE = "<t align='center' size='2.2'>AO Complete</t><br/><t size='1.5' align='center' color='#00FF80'>%1</t><br/>____________________<br/><t align='left'>Fantastic job at %1, boys! Give us a moment here at HQ and we'll line up your next target.</t>";

// Script that decides what the requirements are for a sector to be taken over must return a boolean.  Parameters passed to the script: (the invisible sector object)
// SECTOR_CONTROL_RULE_SCRIPT = "core\server\sector\sectorControlRule.sqf";

// Script that decides when the game should end must return a boolean.  Parameters passed to the script: (amount of sectors in OPFOR hands), (amount of sectors in BLUFOR hands), (total amount of sectors)
// GAME_ENDING_RULE_SCRIPT = "core\server\game\gameEndingRule.sqf";