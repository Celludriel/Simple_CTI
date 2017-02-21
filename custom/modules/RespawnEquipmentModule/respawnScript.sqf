if(!hasInterface) exitWith {};

removeAllWeapons player;
removeBackpack player;
player addBackpack "B_Carryall_khk";
player addMagazines ["30Rnd_9x21_Mag", 5];
player addWeapon "hgun_P07_F";
player addItem "Binocular";