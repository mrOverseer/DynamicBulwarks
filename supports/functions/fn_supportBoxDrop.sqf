/**
*  fn_supportBoxDrop
*
*  Calls VTOL to drop a box with the action definend by _cargo attached
*
*  Domain: Server
*
* NOTE: _targetPos should be a ground-level position
**/
params ["_targetPos", "_cargo", "_aircraft"];

_angle = round random 360;
_height = supportAircraftWaypointHeight;
_radius = 1000; // Start 1km away
_pointX = _radius * (cos _angle);
_pointY = _radius * (sin _angle);

_dropStart  = _targetPos vectorAdd [_pointX, _pointY, _height];
_dropTarget = [(_targetPos select 0), (_targetPos select 1), 100];
_dropEnd    = _targetPos vectorAdd [-_pointX*2, -_pointY*2, _height];

_reldir = [_dropStart, _targetPos] call BIS_fnc_dirTo;
_agSpawn = [_dropStart, _reldir, _aircraft, WEST] call bis_fnc_spawnvehicle;
_agVehicle = _agSpawn select 0;	//the aircraft
_agCrew = _agSpawn select 1;	//the units that make up the crew
_ag = _agSpawn select 2;	//the group
{_x allowFleeing 0} forEach units _ag;

_agVehicle flyInHeight supportAircraftFlyInHeight;
// _agVehicle setpos [getposATL _agVehicle select 0, getposATL _agVehicle select 1, _height];
_agVehicle setVectorUp [0, 0, 1];
_vel = velocity _agVehicle;
_dir = direction _agVehicle;
_speed = supportAircraftSpeed;
_agVehicle setVelocity [
	(_vel select 0) + (sin _dir * _speed), 
	(_vel select 1) + (cos _dir * _speed), 
	(_vel select 2)
];
supplyDropLatch = false;

// Set the radius to be a percentage of the Bulwark radius - the drop will happen somewhere
// within this area
private _supplyDropRadius = BULWARK_RADIUS * LOOT_SUPPLYDROP;
_waypoint0 = _ag addwaypoint[_dropTarget,_supplyDropRadius];
_waypoint0 setwaypointtype "Move";

_waypoint0 setWaypointCompletionRadius 5;
_waypoint0 setWaypointStatements ["true", "supplyDropLatch = true;"];

_waypoint1 = _ag addwaypoint[_dropEnd,0];
_waypoint1 setwaypointtype "Move";

[_ag, 1] setWaypointSpeed "FULL";
[_ag, 1] setWaypointCombatMode "RED";
[_ag, 1] setWaypointBehaviour "CARELESS";

sleep 4;
_agVehicle animateDoor ['Door_1_source', 1];
waitUntil {supplyDropLatch};

// Drop cargo
private _parachutePos = (getPosATL _agVehicle) vectorAdd [0, 0, -8]; // Start 8 meters below the plane, to avoid collisions
_parachute = createVehicle ["B_Parachute_02_F", _parachutePos, [], 0, "NONE"];
_supplyBox = createVehicle ["B_CargoNet_01_ammo_F", [0,0,0], [], 0, "CAN_COLLIDE"];
_supplyBox attachTo [_parachute, [0,0,0]];
_supplyBox allowDamage false;

clearItemCargoGlobal _supplyBox;
clearWeaponCargoGlobal _supplyBox;
clearMagazineCargoGlobal _supplyBox;
clearBackpackCargoGlobal _supplyBox;

// Weapon & ammo
_supplyBox addWeaponCargoGlobal ["hgun_ACPC2_F", 2];
_supplyBox addMagazineCargoGlobal ["9Rnd_45ACP_Mag", 30];
_supplyBox addWeaponCargoGlobal ["hlc_smg_mp5k", 2];
_supplyBox addMagazineCargoGlobal ["hlc_30Rnd_9x19_B_MP5", 30];
_supplyBox addWeaponCargoGlobal ["CSW_Desert_Eagle", 2];
_supplyBox addMagazineCargoGlobal ["CSW_7Rnd_127x33_AE", 30];
_supplyBox addWeaponCargoGlobal ["hlc_pistol_M712", 2];
_supplyBox addMagazineCargoGlobal ["hlc_20Rnd_763x25_B_M712", 30];
_supplyBox addWeaponCargoGlobal ["CSW_M500", 2];
_supplyBox addMagazineCargoGlobal ["CSW_5Rnd_127x41_Magnum", 30];
_supplyBox addWeaponCargoGlobal ["CUP_sgun_M1014", 2];
_supplyBox addMagazineCargoGlobal ["CUP_8Rnd_B_Beneli_74Pellets", 30];
_supplyBox addWeaponCargoGlobal ["hlc_rifle_honeybadger", 2];
_supplyBox addMagazineCargoGlobal ["hlc_50rnd_300BLK_STANAG_EPR", 30];
_supplyBox addWeaponCargoGlobal ["arifle_AK12_GL_F", 1];
_supplyBox addWeaponCargoGlobal ["arifle_AK12_GL_lush_F", 1];
_supplyBox addMagazineCargoGlobal ["30Rnd_762x39_Mag_F", 15];
_supplyBox addMagazineCargoGlobal ["75rnd_762x39_AK12_Mag_Tracer_F", 25];
_supplyBox addItemCargoGlobal ["1Rnd_HE_Grenade_shell", 50];
_supplyBox addWeaponCargoGlobal ["CUP_srifle_M14", 1];
_supplyBox addMagazineCargoGlobal ["CUP_20Rnd_762x51_DMR", 50];
_supplyBox addWeaponCargoGlobal ["srifle_DMR_03_multicam_F", 1];
_supplyBox addMagazineCargoGlobal ["20Rnd_762x51_Mag", 25];
_supplyBox addWeaponCargoGlobal ["srifle_DMR_02_camo_AMS_LP_F", 1];
_supplyBox addMagazineCargoGlobal ["10Rnd_338_Mag", 25];
_supplyBox addWeaponCargoGlobal ["srifle_LRR_camo_SOS_F", 1];
_supplyBox addMagazineCargoGlobal ["7Rnd_408_Mag", 25];
_supplyBox addWeaponCargoGlobal ["srifle_DMR_04_ARCO_F", 1];
_supplyBox addMagazineCargoGlobal ["10Rnd_127x54_Mag", 25];
// _supplyBox addWeaponCargoGlobal ["LAGO_KU98K_NSK", 1];
// _supplyBox addMagazineCargoGlobal ["KU98K_NSK_MAG", 50];
_supplyBox addWeaponCargoGlobal ["MMG_02_camo_F", 1];
_supplyBox addMagazineCargoGlobal ["130Rnd_338_Mag", 8];
_supplyBox addWeaponCargoGlobal ["MMG_01_tan_F", 1];
_supplyBox addMagazineCargoGlobal ["150Rnd_93x64_Mag", 8];
_supplyBox addWeaponCargoGlobal ["launch_RPG7_F", 2];
_supplyBox addMagazineCargoGlobal ["RPG7_F", 20];

_supplyBox addMagazineCargoGlobal ["ACE_10Rnd_338_API526_Mag", 10];
_supplyBox addMagazineCargoGlobal ["ACE_10Rnd_338_300gr_HPBT_Mag", 10];
_supplyBox addMagazineCargoGlobal ["CUP_100Rnd_556x45_BetaCMag", 25];

// Optic
_supplyBox addItemCargoGlobal ["optic_Arco", 2];
_supplyBox addItemCargoGlobal ["optic_Hamr", 2];
_supplyBox addItemCargoGlobal ["optic_SOS", 2];
_supplyBox addItemCargoGlobal ["optic_MRCO", 2];
_supplyBox addItemCargoGlobal ["optic_Nightstalker", 1];
_supplyBox addItemCargoGlobal ["optic_tws", 1];
_supplyBox addItemCargoGlobal ["optic_tws_mg", 1];
_supplyBox addItemCargoGlobal ["optic_DMS", 1];
_supplyBox addItemCargoGlobal ["optic_LRPS", 1];
_supplyBox addItemCargoGlobal ["optic_AMS", 1];
_supplyBox addItemCargoGlobal ["optic_ERCO_blk_F", 1];

// Granade
_supplyBox addMagazineCargoGlobal ["HandGrenade", 50];
_supplyBox addMagazineCargoGlobal ["ACE_M14", 5];
_supplyBox addMagazineCargoGlobal ["ACE_M84", 5];

// Explosive
_supplyBox addWeaponCargoGlobal ["MineDetector", 2];
_supplyBox addMagazineCargoGlobal ["DemoCharge_Remote_Mag", 15];
_supplyBox addMagazineCargoGlobal ["SatchelCharge_Remote_Mag", 15];
_supplyBox addMagazineCargoGlobal ["APERSMine_Range_Mag", 15];
_supplyBox addMagazineCargoGlobal ["APERSBoundingMine_Range_Mag", 15];
_supplyBox addMagazineCargoGlobal ["APERSTripMine_Wire_Mag", 15];
_supplyBox addMagazineCargoGlobal ["ClaymoreDirectionalMine_Remote_Mag", 15];
_supplyBox addMagazineCargoGlobal ["ATMine_Range_Mag", 15];
_supplyBox addMagazineCargoGlobal ["CUP_Mine_M", 15];
_supplyBox addMagazineCargoGlobal ["CUP_MineE_M", 15];
_supplyBox addMagazineCargoGlobal ["SLAMDirectionalMine_Wire_Mag", 15];
_supplyBox addItemCargoGlobal ["ACE_Clacker", 5];
_supplyBox addItemCargoGlobal ["ACE_M26_Clacker", 5];
_supplyBox addItemCargoGlobal ["ACE_DefusalKit", 5];
_supplyBox addItemCargoGlobal ["ACE_DeadManSwitch", 5];

// Chemlight
_supplyBox addMagazineCargoGlobal ["Chemlight_green", 10];
_supplyBox addMagazineCargoGlobal ["Chemlight_yellow", 10];

// Other
_supplyBox addItemCargoGlobal ["Medikit", 10];
_supplyBox addItemCargoGlobal ["NVGogglesB_blk_F", 2];
_supplyBox addItemCargoGlobal ["Integrated_NVG_F", 2];
_supplyBox addItemCargoGlobal ["ACE_NVG_Gen4", 2];
_supplyBox addWeaponCargoGlobal ["ACE_HuntIR_monitor", 1];
_supplyBox addItemCargoGlobal ["ACE_EarPlugs", 5];
_supplyBox addItemCargoGlobal ["ACE_rope15", 1];
_supplyBox addItemCargoGlobal ["bipod_01_F_blk", 5];

// Equipament
_supplyBox addItemCargoGlobal ["U_I_GhillieSuit", 2];
_supplyBox addItemCargoGlobal ["U_B_CTRG_3", 2];
_supplyBox addItemCargoGlobal ["U_B_CTRG_Soldier_F", 2];
_supplyBox addItemCargoGlobal ["H_HelmetSpecB", 2];
_supplyBox addItemCargoGlobal ["H_HelmetB_TI_tna_F", 2];
_supplyBox addItemCargoGlobal ["V_PlateCarrierSpec_mtp", 2];
_supplyBox addBackpackCargoGlobal ["B_Carryall_mcamo", 3];
_supplyBox addBackpackCargoGlobal ["B_Bergen_mcamo_F", 1];

[_supplyBox, _cargo] remoteExec ["addAction", 0, true];
[_supplyBox, ["<t color='#00ffff'>" + "Pickup", { _this call bulwark_fnc_moveBox; },"",1,false,false,"true","true",2.5]] remoteExec ["addAction", 0, true];



waitUntil {getpos _supplyBox select 2<4};
_smoker = "SmokeShellBlue" createVehicle (getpos _supplyBox vectorAdd [0,0,5]);
detach _supplyBox;

sleep 20;
deletevehicle _agVehicle;
{deletevehicle _x} foreach _agCrew;
