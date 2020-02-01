
/*
Questions
    how to you derive the marker "airborne"?

*/

// ---------------------------- Heli 1 ---------------------------- //

// create dropship
dropship = createVehicle ["I_E_Heli_light_03_unarmed_F", getMarkerPos "airborne", [], 0, "FLY"];
dropship setDir (180);
pilotguy = [[0,0,0], resistance, ["I_E_Helipilot_F"],[],[],[],[],[],232] call BIS_fnc_spawnGroup;
((units pilotguy) select 0) moveInDriver dropship;
pilotguy setBehaviour "CARELESS";
// just wondering ... would ambient flyby add any value here? It would save having to spawn pilots, but maybe it makes no diff..?

// create para troopers
_unitsInGroup = ["I_E_Soldier_TL_F","I_E_Soldier_AR_F","I_E_Soldier_LAT_F","I_E_Soldier_M_F","I_E_Soldier_F"];
_SpawnPosition = getMarkerPos "airborne";
_newGroup = createGroup [resistance,true]; 
newLeader = "I_E_Soldier_SL_F" createUnit [_SpawnPosition, _newGroup, "newLeader = this", 0.5, "SERGEANT"];
sleep 1;

{
    _unit = _x createUnit [_SpawnPosition,_newGroup,"_unit = this"];
    sleep .4;
} forEach _unitsInGroup;

// get troopers into heli 
((units _newGroup) select 0) moveInCargo dropship;
((units _newGroup) select 1) moveInCargo dropship;
((units _newGroup) select 2) moveInCargo dropship;
((units _newGroup) select 3) moveInCargo dropship;
((units _newGroup) select 4) moveInCargo dropship;
((units _newGroup) select 5) moveInCargo dropship;

// create new HC group for the player 
player hcSetGroup [_newGroup];
zeus addCuratorEditableObjects [units _newGroup,false]; 
zeus addCuratorEditableObjects [[dropship],true ];

// designate dropzone
_dropzone = player getPos [100,270];
_wpairdrop = pilotguy addWaypoint [_dropzone,0];
dropship flyInHeight 200;
_wpairdrop setWaypointType "MOVE";
_wpairdrop setWaypointStatements ["true", "[]execVM 'drop.sqf';"];
_wpairdrop1 = pilotguy addWaypoint [getMarkerPos "airdropend",0];
_wpairdrop1 setWaypointType "MOVE";
_wpairdrop1 setWaypointStatements ["true", "[]execVM 'deletedropship.sqf';"];


// ---------------------------- Heli 2 ---------------------------- //

// create dropship
dropship1 = createVehicle ["I_E_Heli_light_03_unarmed_F", getMarkerPos "airborne_1", [], 0, "FLY"];
dropship1 setDir (180);
pilotguy1 = [[0,0,0], resistance, ["I_E_Helipilot_F"],[],[],[],[],[],232] call BIS_fnc_spawnGroup;
((units pilotguy1) select 0) moveInDriver dropship1;
pilotguy1 setBehaviour "CARELESS";

// create para troopers
_unitsInGroup1 = ["I_E_Soldier_TL_F", "I_E_Soldier_AR_F", "I_E_Soldier_LAT_F", "I_E_Soldier_M_F", "I_E_Soldier_F"];
_SpawnPosition1 = getMarkerPos "airborne_1";
_newGroup1 = createGroup [resistance,true]; 
newLeader1 = "I_E_Soldier_SL_F" createUnit [_SpawnPosition1, _newGroup1, "newLeader = this", 0.5, "SERGEANT"];
sleep 1;

{
    _unit = _x createUnit [_SpawnPosition1, _newGroup1, "_unit = this"];
    sleep .4;

} forEach _unitsInGroup1;

// get troopers into heli 
((units _newGroup1) select 0) moveInCargo dropship1;
((units _newGroup1) select 1) moveInCargo dropship1;
((units _newGroup1) select 2) moveInCargo dropship1;
((units _newGroup1) select 3) moveInCargo dropship1;
((units _newGroup1) select 4) moveInCargo dropship1;
((units _newGroup1) select 5) moveInCargo dropship1;

// create new HC group for the player 
player hcSetGroup [_newGroup1];
zeus addCuratorEditableObjects [units _newGroup1, false]; 
zeus addCuratorEditableObjects [[dropship1], true ];

// designate dropzone
_dropzone1 = player getPos [100, 90];
_wpairdrop2 = pilotguy1 addWaypoint [_dropzone1, 0];
dropship1 flyInHeight 200;
_wpairdrop2 setWaypointType "MOVE";
_wpairdrop2 setWaypointStatements ["true", "[]execVM 'drop_1.sqf';"];
_wpairdrop3 = pilotguy1 addWaypoint [getMarkerPos "airdropend_1",0];
_wpairdrop3 setWaypointType "MOVE";
_wpairdrop3 setWaypointStatements ["true", "[]execVM 'deletedropship1.sqf';"];

