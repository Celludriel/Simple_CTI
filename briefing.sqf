// F3 - Briefing
// Credits: Please see the F3 online manual (http://www.ferstaberinde.com/f3/en/)
// ====================================================================================

// FACTION: NATO

// ====================================================================================

// TASKS
// The code below creates tasks. Two (commented-out) sample tasks are included.
// Note: tasks should be entered into this file in reverse order.

// _task2 = player createSimpleTask ["OBJ_2"];
// _task2 setSimpleTaskDescription ["IN DEPTH OBJECTIVE DESCRIPTION", "SHORT OBJECTIVE DESCRIPTION", "WAYPOINT TEXT"];
// _task2 setSimpleTaskDestination WAYPOINTLOCATION;
// _task2 setTaskState "Created";

// _task1 = player createSimpleTask ["OBJ_1"];
// _task1 setSimpleTaskDescription ["IN DEPTH OBJECTIVE DESCRIPTION", "SHORT OBJECTIVE DESCRIPTION", "WAYPOINT TEXT"];
// _task1 setSimpleTaskDestination WAYPOINTLOCATION;
// _task1 setTaskState "Created";

// ====================================================================================

// NOTES: CREDITS
// The code below creates the administration sub-section of notes.

_cre = player createDiaryRecord ["diary", ["Credits","
<br/>
* Spun<br/>
* lostvar<br/>
* T800a<br/>
* genesis92x<br/>
* Meatball<br/>
* Farooq<br/>
* Rarek<br/>
* lala14<br/>
* MGIPierre<br/>
* Tonic<br/>
* Zbug<br/>
* KillzoneKid<br/>
* MrCurry<br/>
* JohnnyBoy<br/>
* Serena<br/>
* Nikander<br/>
* Shuko<br/>
* Larrow<br/>
<br/><br/>
Made with F3 (http://www.ferstaberinde.com/f3/en/)
"]];



// ====================================================================================

// NOTES: MISSION
// The code below creates the mission sub-section of notes.

_mis = player createDiaryRecord ["diary", ["Mission","
<br/>
Remove all resistance at the dedicated sectors on the map.  Only then can we secure Stratis from the enemy.
<br/>
<br/>
We have supplied you with four mobile headquarters that can be used as a rally point.  We have extra in supply should the enemy manage to destroy any of them.  They are equiped with a selfdestruct to prevent them from falling in enemy hands.  Before they can be operational make sure to deploy the communication relay systems
<br/>
<br/>
Some of the local mechanics on the island have made repair stations for us to use.  Look for a big white H on the ground.  Park your vehicle on it and the locals will fix it for you.
<br/>
<br/>
Thanks to advances in satellite uplink your goggles are equiped with a tactical icon module.  When turned on and you make contact with the enemy you will see an indicator on your virtual reality vision.  Beware the range is limited to 300m !
<br/>
<br/>
You can use the mobile headquarters to quickly fill up the arsenal by driving close to it.  Same counts for emptying a supply drop, this fastload mechanism is highly experimental use with care.  If we overload the arsenal or mhq we might not be able to manually put equipment in.
<br/>
<br/>
Our choppers are equiped with a newly developed slingload module.  They should be able to nearly slingload anything !  There is a new option for it on your dashboard look for red slingload text.
<br/>
<br/>
Should you be wounded new advances in medical science will give anyone with a medical kit or first aid kit the possibility to recussitate.  In the event you get fully incapacitated a med evac will take you back to base where you can recuperate and redeploy at our flag.
"]];

// ====================================================================================

// NOTES: SITUATION
// The code below creates the situation sub-section of notes.

_sit = player createDiaryRecord ["diary", ["Situation","
<br/>
CSAT has taken over all of Stratis.  We managed to sneak in and night and set up a base of operations.  All that is left is to take back the island region by region !
<br/><br/>
<font size='18'>ENEMY FORCES</font>
<br/>
CSAT has an extensive garrison on the island.  Satellite recon has shown light patrols.  We can expect them to increase in size when we capture more territory.  There are also rumors of a private investor who is funding them with armor and air support.
<br/><br/>
<font size='18'>FRIENDLY FORCES</font>
<br/>
We managed to get a small cache of weapons available in short notice.  We will supply you with more during the operation when more funds are available.  Use any weapons you can find from the enemy.
"]];

// ====================================================================================