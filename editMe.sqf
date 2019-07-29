/**
*  editMe
*
*  Defines all global config for the mission
*
*  Domain: Client, Server
**/

/* Attacker Waves */

// List_Bandits, List_ParaBandits, List_OPFOR, List_INDEP, List_NATO, List_Viper
HOSTILE_LEVEL_1 = List_Bandits;    
HOSTILE_LEVEL_2 = List_ParaBandits;
HOSTILE_LEVEL_3 = List_INDEP; 
HOSTILE_LEVEL_4 = List_OPFOR;    
HOSTILE_LEVEL_5 = List_Viper;
HOSTILE_ARMED_CARS = List_Armour;//expects vehicles
HOSTILE_ARMOUR = List_ArmedCars; //expects vehicles

HOSTILE_MULTIPLIER = ("HOSTILE_MULTIPLIER" call BIS_fnc_getParamValue);  // How many hostiles per wave (waveCount x HOSTILE_MULTIPLIER)
HOSTILE_TEAM_MULTIPLIER = ("HOSTILE_TEAM_MULTIPLIER" call BIS_fnc_getParamValue) / 100;   // How many extra units are added per player
PISTOL_HOSTILES = ("PISTOL_HOSTILES" call BIS_fnc_getParamValue);  //What wave enemies stop only using pistols

/* LOCATION LIST OPTIONS */
// List_AllCities - for any random City
// List_SpecificPoint - will start the mission on the "Specific Bulwark Pos" marker (move with mission editor). Location must meet BULWARK_LANDRATIO and LOOT_HOUSE_DENSITY, BULWARK_MINSIZE, etc requirements
// List_LocationMarkers - for a location selected randomly from the Bulwark Zones in editor (Currently broken)
// *IMPORTANT* If you get an error using List_SpecificPoint it means that there isn't a building that qualifies. Turning down the "Minimum spawn room size" parameter might help.
BULWARK_LOCATIONS = List_AllCities;

BULWARK_RADIUS = ("BULWARK_RADIUS" call BIS_fnc_getParamValue);
BULWARK_MINSIZE = ("BULWARK_MINSIZE" call BIS_fnc_getParamValue);   // Spawn room must be bigger than x square metres
BULWARK_LANDRATIO = ("BULWARK_LANDRATIO" call BIS_fnc_getParamValue);
LOOT_HOUSE_DENSITY = ("LOOT_HOUSE_DENSITY" call BIS_fnc_getParamValue);

PLAYER_STARTWEAPON = if ("PLAYER_STARTWEAPON" call BIS_fnc_getParamValue == 1) then {true} else {false};
PLAYER_STARTMAP    = if ("PLAYER_STARTMAP" call BIS_fnc_getParamValue == 1) then {true} else {false};
PLAYER_STARTNVG    = if ("PLAYER_STARTNVG" call BIS_fnc_getParamValue == 1) then {true} else {false};

/* Respawn */
RESPAWN_TIME = ("RESPAWN_TIME" call BIS_fnc_getParamValue);
RESPAWN_TICKETS = ("RESPAWN_TICKETS" call BIS_fnc_getParamValue);

/* Loot Blacklist */
LOOT_BLACKLIST = [
    "O_Static_Designator_02_weapon_F", // If players find and place CSAT UAVs they count as hostile units and round will not progress
    "O_UAV_06_backpack_F",
    "O_UAV_06_medical_backpack_F",
    "O_UAV_01_backpack_F",
    "B_IR_Grenade",
    "O_IR_Grenade",
    "I_IR_Grenade",
    "I_HMG_01_A_weapon_F",
    "O_HMG_01_A_weapon_F",
    "I_E_HMG_01_A_Weapon_F",
    "B_HMG_01_A_weapon_F",
    "I_E_HMG_01_high_Weapon_F",
    "I_E_HMG_01_Weapon_F",
    "I_E_Mortar_01_support_F",
    "O_Static_Designator_02_weapon_F",
    "B_W_Static_Designator_01_weapon_F",
    "B_Static_Designator_01_weapon_F",
    "I_GMG_01_A_weapon_F",
    "O_GMG_01_A_weapon_F",
    "B_GMG_01_A_weapon_F",
    "I_AA_01_weapon_F",
    "O_AA_01_weapon_F",
    "I_E_AA_01_weapon_F",
    "B_AA_01_weapon_F",
    "I_AT_01_weapon_F",
    "O_AT_01_weapon_F",
    "I_E_AT_01_weapon_F",
    "B_AT_01_weapon_F",
    "I_E_GMG_01_A_Weapon_F",
    "I_E_GMG_01_high_Weapon_F",
    "I_E_GMG_01_Weapon_F",
    "I_HMG_01_high_weapon_F",
    "O_HMG_01_high_weapon_F",
    "B_HMG_01_high_weapon_F",
    "I_HMG_01_weapon_F",
    "O_HMG_01_weapon_F",
    "B_HMG_01_weapon_F",
    "I_GMG_01_high_weapon_F",
    "O_GMG_01_high_weapon_F",
    "B_GMG_01_high_weapon_F",
    "I_GMG_01_weapon_F",
    "O_GMG_01_weapon_F",
    "B_GMG_01_weapon_F",
    "I_Mortar_01_support_F",
    "O_Mortar_01_support_F",
    "B_Mortar_01_support_F",
    "I_HMG_01_support_high_F",
    "O_HMG_01_support_high_F",
    "I_HMG_01_support_F",
    "O_HMG_01_support_F",
    "B_HMG_01_support_F",
    "I_E_HMG_01_support_high_F",
    "I_E_HMG_01_support_F",
    "B_HMG_01_support_high_F",
    "I_Mortar_01_weapon_F",
    "O_Mortar_01_weapon_F",
    "I_E_Mortar_01_Weapon_F",
    "B_Mortar_01_weapon_F",
    "CUP_B_DShkM_Gun_Bag",
    "CUP_B_DShkM_TripodHigh_Bag",
    "CUP_B_DShkM_TripodLow_Bag",
    "CUP_B_Kord_Gun_Bag",
    "CUP_B_Kord_Tripod_Bag",
    "CUP_B_M2_Gun_Bag",
    "CUP_B_M2_MiniTripod_Bag",
    "CUP_B_M2_Tripod_Bag",
    "CUP_B_M252_Bipod_Bag",
    "CUP_B_M252_Gun_Bag",
    "M252_support",
    "M252_weapon",
    "CUP_B_Metis_Gun_Bag",
    "CUP_B_Metis_Tripod_Bag",
    "CUP_B_Mk19_Gun_Bag",
    "CUP_B_Mk19_Tripod_Bag",
    "CUP_B_Podnos_Gun_Bag",
    "CUP_B_Podnos_Bipod_Bag",
    "CUP_B_SPG9_Gun_Bag",
    "CUP_B_SPG9_Tripod_Bag",
    "CUP_B_Tow_Gun_Bag",
    "CUP_B_TOW_Tripod_Bag",
    "TRYK_B_tube_blk",
    "TRYK_B_tube_cyt",
    "TRYK_B_tube_od",
    "TRYK_Winter_pack"
];

/* Whitelist modes */
/* 0 = Off */
/* 1 = Only Whitelist Items will spawn as loot */
/* 2 = Whitelist items get added to existing loot (increases the chance of loot spawning */
LOOT_WHITELIST_MODE = 0;

/* Loot Whitelists */
/* Fill with classname arrays: ["example_item_1", "example_item_2"] */
/* To use Whitelisting there MUST be at least one applicaple item in each LOOT_WHITELIST array*/
LOOT_WHITELIST_WEAPON = [];
LOOT_WHITELIST_APPAREL = [];
LOOT_WHITELIST_ITEM = [];
LOOT_WHITELIST_EXPLOSIVE = [];
LOOT_WHITELIST_STORAGE = [];

/* Loot Spawn */
LOOT_WEAPON_POOL    = List_AllWeapons - LOOT_BLACKLIST;    // Classnames of Loot items as an array
LOOT_APPAREL_POOL   = List_AllClothes + List_Vests - LOOT_BLACKLIST;
LOOT_ITEM_POOL      = List_Optics + List_Items - LOOT_BLACKLIST;
LOOT_EXPLOSIVE_POOL = List_Mines + List_Grenades + List_Charges - LOOT_BLACKLIST;
LOOT_STORAGE_POOL   = List_Backpacks - LOOT_BLACKLIST;

/* Random Loot */
LOOT_HOUSE_DISTRIBUTION = ("LOOT_HOUSE_DISTRIBUTION" call BIS_fnc_getParamValue);  // Every *th house will spwan loot.
LOOT_ROOM_DISTRIBUTION = ("LOOT_ROOM_DISTRIBUTION" call BIS_fnc_getParamValue);   // Every *th position, within that house will spawn loot.
LOOT_DISTRIBUTION_OFFSET = 0; // Offset the position by this number.
LOOT_SUPPLYDROP = ("LOOT_SUPPLYDROP" call BIS_fnc_getParamValue) / 100;        // Radius of supply drop
PARATROOP_COUNT = ("PARATROOP_COUNT" call BIS_fnc_getParamValue);
PARATROOP_CLASS = List_NATO;
DEFECTOR_CLASS = List_NATO;

/* Points */
SCORE_KILL = ("SCORE_KILL" call BIS_fnc_getParamValue);                 // Base Points for a kill
SCORE_HIT = ("SCORE_HIT" call BIS_fnc_getParamValue);                   // Every Bullet hit that doesn't result in a kill
SCORE_DAMAGE_BASE = ("SCORE_DAMAGE_BASE" call BIS_fnc_getParamValue);   // Extra points awarded for damage. 100% = SCORE_DAMAGE_BASE. 50% = SCORE_DAMAGE_BASE/2
SCORE_RANDOMBOX = 250;  // Cost to spin the box

/*Point multipliers of SCORE_KILL for different waves */
HOSTILE_LEVEL_1_POINT_SCORE = 0.75;
HOSTILE_LEVEL_2_POINT_SCORE = 1;
HOSTILE_LEVEL_3_POINT_SCORE = 1.50;
HOSTILE_LEVEL_4_POINT_SCORE = 1.75;
HOSTILE_LEVEL_5_POINT_SCORE = 2;
HOSTILE_CAR_POINT_SCORE = 3;
HOSTILE_ARMOUR_POINT_SCORE = 4;

/* Comment out or delete the below support items to prevent the player from buying them */

BULWARK_SUPPORTITEMS = [
    [10,  "Recon UAV",             "reconUAV"],
    [1680, "Emergency Teleport",   "telePlode"],
    [1950, "Paratroopers",          "paraDrop"],
    [3850, "Missile CAS",          "airStrike"],
    [4220, "Mine Cluster Shell",   "mineField"],
    [4690, "Rage Stimpack",         "ragePack"],
    [5930, "Mind Control Gas",    "mindConGas"],
    [6666, "ARMAKART TM",           "armaKart"],
    [7500, "Predator Drone",    "droneControl"]
];

/* Objects the Player can buy */

/* Radius prevents hostiles walking through objects */

/*  Price - Display Name - Class Name - Rotation When Bought - Object Radius (meters) *prevents AI glitching through object and triggers suicide bombers*/
BULWARK_BUILDITEMS = [
    [10,    "Razon Wire",		    "Land_Razorwire_F",				     0,	  1],
	[25,    "Long Plank (8m)",      "Land_Plank_01_8m_F",                0,   4],
    [50,    "Junk Barricade",       "Land_Barricade_01_4m_F",            0,   1],
    [75,    "Small Ramp (1m)",      "Land_Obstacle_Ramp_F",            180,   1],
    [75,    "Flat Triangle (1m)",   "Land_DomeDebris_01_hex_green_F",  180,   1],
    [100,   "Short Sandbag Wall",   "Land_SandbagBarricade_01_half_F",   0,   1],
    [125,   "Sandbag Barricade",    "Land_SandbagBarricade_01_hole_F",   0,   1],
    [150,   "Concrete Shelter",     "Land_CncShelter_F",                 0,   1],
	[200,   "Small Bridge",         "Land_Obstacle_Bridge_F",            0,   2],
    [225,   "Concrete Walkway",     "Land_GH_Platform_F",                0, 3.5],
    [250,   "Tall Concrete Wall",   "Land_Mil_WallBig_4m_F",             0,   1],
    [275,   "Portable Light",       "Land_PortableLight_double_F",     180,   1],
    [300,   "Long Concrete Wall",   "Land_CncBarrierMedium4_F",          0,   3],
    [325,   "Corner Sandbag",	    "Land_fort_bagfence_corner",		 0,	  1],
	[350,   "Circular Sandbag",     "Land_fort_bagfence_round",		 	 0,   1],
	[400,   "Large Ramp",           "FootBridge_30_ACR",                 0,   1],
    [425,   "Concrete Floor",       "Land_Podesta_5",					 0,   3],	
	[450,   "Bunker Block",         "Land_Bunker_01_blocks_3_F",         0,   2],
    [500,   "H Barrier",            "Land_HBarrier_5_F",                 0,   2],
	[510,   "Caja explosivos",      "Box_NATO_AmmoOrd_F",                0,   1],
    [525,   "Concrete Tanktrap",	"Land_DragonsTeeth_01_4x2_old_F",    0,   3],
	[550,   "Hallogen Lamp",        "Land_LampHalogen_F",               90,   1],
	[575,   "SandWall  5x low",    	"Base_WarfareBBarrier5x",            0,   2],
	[600,   "SandWall 10x low",     "Base_WarfareBBarrier10x",		     0,   2],
	[625,   "Ladder",               "Land_PierLadder_F",                 0,   1],
    [650,   "Storage box small",    "Box_NATO_Support_F",                0,   1],
    [700,   "Stairs Concrete",	    "Land_Podesta_1_stairs4",			 0,   1],
	[750,   "Stairs Hotel",         "Land_GH_Stairs_F",                 90,   2],
    [800,   "Double H Barrier",     "Land_HBarrierWall4_F",              0,   4],
    [850,   "Concrete Platform",    "BlockConcrete_F",                   0,   4],
    [900,   "Storage box large",    "Box_NATO_AmmoVeh_F",                0,   1],
    [1000,  "Barrier Base",		    "Base_WarfareBBarrier10xTall",		 0,   5],
	[1050,  "Caja ACE",             "ACE_Box_Misc",                      0,   1],
	[1100,  "Static M2 Cal.50",     "CUP_B_M2StaticMG_USMC",             0, 0.5],
	[1300,  "Static HMG",           "B_HMG_01_high_F",                   0, 0.5],
    [1500,  "Small Bunker",         "Land_BagBunker_Small_F",          180, 1.5],
    [2000,  "Jail",                 "Land_Mil_Guardhouse",               0,   5],
    [3000,  "Guard Tower",          "Land_Cargo_Patrol_V3_F",            0,   2],
	[4000,  "HQ House",             "Land_Cargo_HQ_V3_F",               90,   8],
	[5000,  "Modular Bunker",       "Land_Bunker_01_Small_F",          180,   8],
	[10000, "Pillbox Bunker",       "Land_PillboxBunker_01_big_F",     180,   8],
    [20000, "Big Bunker",           "Land_Bunker_01_big_F",            180,   8],
	[35000, "Bastion Tower",        "Land_Helfenburk",                   0,  20]
];

/* Time of Day*/
DAY_TIME_FROM = ("DAY_TIME_FROM" call BIS_fnc_getParamValue);
DAY_TIME_TO = ("DAY_TIME_TO" call BIS_fnc_getParamValue);

// Check for sneaky inverted configuration. FROM should always be before TO.
if (DAY_TIME_FROM > DAY_TIME_TO) then {
    DAY_TIME_FROM = DAY_TIME_TO - 2;
};

/* Starter MediKits */
BULWARK_MEDIKITS = ("BULWARK_MEDIKIT" call BIS_fnc_getParamValue);
