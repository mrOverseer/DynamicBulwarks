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
    "I_UAV_01_backpack_F",
    "O_UAV_01_backpack_F",
    "B_UAV_01_backpack_F",
    "B_IR_Grenade",
    "O_IR_Grenade",
    "I_IR_Grenade",
    "I_HMG_01_A_weapon_F",
    "O_HMG_01_A_weapon_F",
    "B_HMG_01_A_weapon_F",
    "I_GMG_01_A_weapon_F",
    "O_GMG_01_A_weapon_F",
    "B_GMG_01_A_weapon_F",
    "I_AA_01_weapon_F",
    "O_AA_01_weapon_F",
    "B_AA_01_weapon_F",
    "I_AT_01_weapon_F",
    "O_AT_01_weapon_F",
    "B_AT_01_weapon_F",
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
    "B_Parachute",
    "I_HMG_01_support_high_F",
    "O_HMG_01_support_high_F",
    "I_HMG_01_support_F",
    "O_HMG_01_support_F",
    "B_HMG_01_support_F",
    "B_HMG_01_support_high_F",
    "I_Mortar_01_weapon_F",
    "O_Mortar_01_weapon_F",
    "B_Mortar_01_weapon_F",
    "B_Respawn_Sleeping_bag_blue_F",
    "B_Respawn_Sleeping_bag_brown_F",
    "B_Respawn_Sleeping_bag_F",
    "B_Respawn_TentDome_F",
    "B_Respawn_TentA_F",
    "O_Static_Designator_02_weapon_F",
    "B_Static_Designator_01_weapon_F",
    "B_Patrol_Respawn_bag_F",
    "M252_support",
    "M252_weapon",
    // Laws of war
    "H_HeadSet_yellow_F",
    "H_HeadSet_white_F",
    "H_HeadSet_orange_F",
    "H_HeadSet_black_F",
    "H_HeadSet_red_F",
    "H_WirelessEarpiece_F",
    "H_PASGT_basic_blue_F",
    "H_PASGT_basic_white_F",
    "H_PASGT_basic_black_F",
    "H_PASGT_basic_olive_F",
    "H_Construction_basic_yellow_F",
    "H_Construction_headset_yellow_F",
    "H_Construction_earprot_yellow_F",
    "H_Construction_basic_white_F",
    "H_Construction_headset_white_F",
    "H_Construction_earprot_white_F",
    "H_Construction_basic_orange_F",
    "H_Construction_headset_orange_F",
    "H_Construction_earprot_orange_F",
    "H_Construction_basic_black_F",
    "H_Construction_headset_black_F",
    "H_Construction_earprot_black_F",
    "H_Construction_basic_red_F",
    "H_Construction_headset_red_F",
    "H_Construction_earprot_red_F",
    "H_Construction_basic_vrana_F",
    "H_Construction_headset_vrana_F",
    "H_Construction_earprot_vrana_F",
    "H_PASGT_basic_blue_press_F",
    "H_PASGT_neckprot_blue_press_F",
    "H_Cap_White_IDAP_F",
    "H_Cap_Orange_IDAP_F",
    "H_Cap_Black_IDAP_F",
    "H_EarProtectors_yellow_F",
    "H_EarProtectors_white_F",
    "H_EarProtectors_orange_F",
    "H_EarProtectors_black_F",
    "H_EarProtectors_red_F",
    "H_Hat_Safari_sand_F",
    "H_Hat_Safari_olive_F",
    "H_HeadBandage_bloody_F",
    "H_HeadBandage_clean_F",
    "H_HeadBandage_stained_F",
    "U_BG_Guerilla1_2_F",
    "U_C_ConstructionCoverall_Blue_F",
    "U_C_ConstructionCoverall_Black_F",
    "U_C_ConstructionCoverall_Red_F",
    "U_C_ConstructionCoverall_Vrana_F",
    "U_C_Mechanic_01_F",
    "U_C_IDAP_Man_Tee_F",
    "U_C_IDAP_Man_TeeShorts_F",
    "U_C_IDAP_Man_cargo_F",
    "U_C_IDAP_Man_casual_F",
    "U_C_IDAP_Man_shorts_F",
    "U_C_IDAP_Man_Jeans_F",
    "U_C_Paramedic_01_F",
    "V_EOD_blue_F",
    "V_EOD_coyote_F",
    "V_EOD_olive_F",
    "V_Plain_crystal_F",
    "V_Plain_medical_F",
    "V_Safety_yellow_F",
    "V_Safety_blue_F",
    "V_Safety_orange_F",
    "V_EOD_IDAP_blue_F",
    "V_Pocketed_coyote_F",
    "V_Pocketed_black_F",
    "V_Pocketed_olive_F",
    "V_LegStrapBag_coyote_F",
    "V_LegStrapBag_black_F",
    "V_LegStrapBag_olive_F",
    "B_Messenger_Coyote_F",
    "B_Messenger_Gray_F",
    "B_Messenger_Black_F",
    "B_Messenger_Olive_F",
    "B_Messenger_IDAP_F",
    "I_UAV_06_backpack_F",
    "O_UAV_06_backpack_F",
    "B_UAV_06_backpack_F",
    "I_UAV_06_medical_backpack_F",
    "O_UAV_06_medical_backpack_F",
    "C_IDAP_UAV_06_medical_backpack_F",
    "B_UAV_06_medical_backpack_F",
    "C_UAV_06_backpack_F",
    "C_IDAP_UAV_06_backpack_F",
    "C_UAV_06_medical_backpack_F",
    "C_IDAP_UAV_06_antimine_backpack_F",
    "C_IDAP_UAV_01_backpack_F",
    "B_LegStrapBag_coyote_F",
    "B_LegStrapBag_black_F",
    "B_LegStrapBag_olive_F",
    // Contact
    "arifle_AK12U_F",
    "arifle_AK12U_arid_F",
    "arifle_AK12U_lush_F",
    "sgun_HunterShotgun_01_F",
    "sgun_HunterShotgun_01_sawedoff_F",
    "srifle_DMR_06_hunter_F",
    "arifle_MSBS65_F",
    "arifle_MSBS65_sand_F",
    "arifle_MSBS65_camo_F",
    "arifle_MSBS65_black_F",
    "arifle_MSBS65_GL_F",
    "arifle_MSBS65_GL_sand_F",
    "arifle_MSBS65_GL_camo_F",
    "arifle_MSBS65_GL_black_F",
    "arifle_MSBS65_Mark_F",
    "arifle_MSBS65_Mark_sand_F",
    "arifle_MSBS65_Mark_camo_F",
    "arifle_MSBS65_Mark_black_F",
    "arifle_MSBS65_UBS_F",
    "arifle_MSBS65_UBS_sand_F",
    "arifle_MSBS65_UBS_camo_F",
    "arifle_MSBS65_UBS_black_F",
    "arifle_RPK12_F",
    "arifle_RPK12_arid_F",
    "arifle_RPK12_lush_F",
    "H_Beret_EAF_01_F",
    "H_HelmetAggressor_F",
    "H_HelmetAggressor_cover_F",
    "H_HelmetAggressor_cover_taiga_F",
    "H_HelmetB_plain_wdl",
    "H_HelmetB_light_wdl",
    "H_HelmetSpecB_wdl",
    "H_Tank_eaf_F",
    "H_HelmetCrew_I_E",
    "H_PilotHelmetFighter_I_E",
    "H_PilotHelmetHeli_I_E",
    "H_CrewHelmetHeli_I_E",
    "H_HelmetHBK_headset_F",
    "H_HelmetHBK_ear_F",
    "H_HelmetHBK_F",
    "H_HelmetHBK_chops_F",
    "H_MilCap_wdl",
    "H_MilCap_taiga",
    "H_MilCap_grn",
    "H_MilCap_eaf",
    "H_Hat_Tinfoil_F",
    "H_Booniehat_wdl",
    "H_Booniehat_taiga",
    "H_Booniehat_mgrn",
    "H_Booniehat_eaf",
    "U_O_R_Gorka_01_black_F",
    "U_I_E_Uniform_01_coveralls_F",
    "U_I_E_Uniform_01_shortsleeve_F",
    "U_B_CombatUniform_mcam_wdl_f",
    "U_B_CombatUniform_tshirt_mcam_wdl_f",
    "U_I_E_Uniform_01_tanktop_F",
    "U_I_E_Uniform_01_sweater_F",
    "U_I_E_Uniform_01_officer_F",
    "U_I_E_Uniform_01_F",
    "U_I_L_Uniform_01_deserter_F",
    "U_I_L_Uniform_01_camo_F",
    "U_B_CombatUniform_vest_mcam_wdl_f",
    "U_I_L_Uniform_01_tshirt_skull_F",
    "U_I_L_Uniform_01_tshirt_sport_F",
    "U_I_L_Uniform_01_tshirt_black_F",
    "U_C_E_LooterJacket_01_F",
    "U_C_Uniform_Scientist_01_formal_F",
    "U_C_Uniform_Scientist_01_F",
    "U_C_Uniform_Scientist_02_F",
    "U_C_Uniform_Scientist_02_formal_F",
    "U_C_Uniform_Farmer_01_F",
    "U_O_R_Gorka_01_F",
    "U_O_R_Gorka_01_brown_F",
    "U_O_R_Gorka_01_camo_F",
    "U_C_CBRN_Suit_01_Blue_F",
    "U_C_CBRN_Suit_01_White_F",
    "U_C_CBRN_Suit_01_Wdl_F",
    "U_C_CBRN_Suit_01_MTP_F",
    "U_C_CBRN_Suit_01_Tropic_F",
    "U_C_CBRN_Suit_01_AAF_F",
    "U_C_CBRN_Suit_01_EAF_F",
    "V_PlateCarrier2_wdl",
    "V_PlateCarrierGL_wdl",
    "V_PlateCarrierSpec_wdl",
    "V_PlateCarrier1_wdl",
    "V_CarrierRigKBT_01_heavy_EAF_F",
    "V_CarrierRigKBT_01_heavy_Olive_F",
    "V_CarrierRigKBT_01_light_EAF_F",
    "V_CarrierRigKBT_01_light_Olive_F",
    "V_CarrierRigKBT_01_EAF_F",
    "V_CarrierRigKBT_01_Olive_F",
    "V_SmershVest_01_F",
    "V_SmershVest_01_radio_F",
    "I_E_HMG_01_A_Weapon_F",
    "I_E_HMG_01_high_Weapon_F",
    "I_E_HMG_01_Weapon_F",
    "I_E_Mortar_01_support_F",
    "I_E_UAV_06_backpack_F",
    "I_E_UAV_06_medical_backpack_F",
    "I_E_UAV_01_backpack_F",
    "C_IDAP_UGV_02_Demining_backpack_F",
    "I_UGV_02_Demining_backpack_F",
    "O_UGV_02_Demining_backpack_F",
    "I_E_UGV_02_Demining_backpack_F",
    "B_UGV_02_Demining_backpack_F",
    "I_UGV_02_Science_backpack_F",
    "O_UGV_02_Science_backpack_F",
    "I_E_UGV_02_Science_backpack_F",
    "B_UGV_02_Science_backpack_F",
    "B_W_Static_Designator_01_weapon_F",
    "B_SCBA_01_F",
    "I_E_AA_01_weapon_F",
    "I_E_AT_01_weapon_F",
    "I_E_GMG_01_high_Weapon_F",
    "I_E_GMG_01_Weapon_F",
    "I_E_GMG_01_A_Weapon_F",
    "B_AssaultPack_wdl_F",
    "B_AssaultPack_eaf_F",
    "B_FieldPack_taiga_F",
    "B_FieldPack_green_F",
    "B_RadioBag_01_digi_F",
    "B_RadioBag_01_eaf_F",
    "B_RadioBag_01_ghex_F",
    "B_RadioBag_01_hex_F",
    "B_RadioBag_01_mtp_F",
    "B_RadioBag_01_black_F",
    "B_RadioBag_01_tropic_F",
    "B_RadioBag_01_oucamo_F",
    "B_Carryall_wdl_F",
    "B_Carryall_eaf_F",
    "B_Carryall_taiga_F",
    "B_Carryall_green_F",
    "B_CombinationUnitRespirator_01_F",
    "I_E_HMG_01_support_high_F",
    "I_E_HMG_01_support_F",
    "I_E_Mortar_01_Weapon_F",
    // CUP
    "CUP_B_AGS30_Gun_Bag",
    "CUP_B_AGS30_Tripod_Bag",
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
    "CUP_T10_Parachute_backpack",
    // TRYK
    "TRYK_B_tube_blk",
    "TRYK_B_tube_cyt",
    "TRYK_B_tube_od",
    "TRYK_Winter_pack",
    // ACE
    "ACE_NonSteerableParachute",
    "ace_gunbag_Tan",
    "ace_gunbag"
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
    [10,    "Recon UAV",             "reconUAV"],
    [1680,  "Emergency Teleport",   "telePlode"],
    [1950,  "Paratroopers",          "paraDrop"],
    [3850,  "Missile CAS",          "airStrike"],
    [4220,  "Mine Cluster Shell",   "mineField"],
    [4690,  "Rage Stimpack",         "ragePack"],
    [5930,  "Mind Control Gas",    "mindConGas"],
    [6666,  "ARMAKART TM",           "armaKart"],
    [7500,  "Predator Drone",    "droneControl"],
    [10000, "Supply Box Drop", "supportBoxDrop"],
    [50000, "Arsenal Drop",       "arsenalDrop"]
];

/* Objects the Player can buy */

/* Radius prevents hostiles walking through objects */

/*  Price - Display Name - Class Name - Rotation When Bought - Object Radius (meters) *prevents AI glitching through object and triggers suicide bombers - Has AI true/false (for objects with AI like autonomous turrests) */
BULWARK_BUILDITEMS = [
    [10,    "Razon Wire",		    "Land_Razorwire_F",				     0,	  1, false],
	[25,    "Long Plank (8m)",      "Land_Plank_01_8m_F",                0,   4, false],
    [50,    "Junk Barricade",       "Land_Barricade_01_4m_F",            0,   1, false],
    [75,    "Small Ramp (1m)",      "Land_Obstacle_Ramp_F",            180,   1, false],
    [75,    "Flat Triangle (1m)",   "Land_DomeDebris_01_hex_green_F",  180,   1, false],
    [100,   "Short Sandbag Wall",   "Land_SandbagBarricade_01_half_F",   0,   1, false],
    [125,   "Sandbag Barricade",    "Land_SandbagBarricade_01_hole_F",   0,   1, false],
    [150,   "Concrete Shelter",     "Land_CncShelter_F",                 0,   1, false],
    [180,   "Concrete Panels",      "Land_ConcretePanels_02_single_v1_F",0,   1, false],
	[200,   "Small Bridge",         "Land_Obstacle_Bridge_F",            0,   2, false],
    [225,   "Concrete Walkway",     "Land_GH_Platform_F",                0, 3.5, false],
    [250,   "Tall Concrete Wall",   "Land_Mil_WallBig_4m_F",             0,   1, false],
    [275,   "Portable Light",       "Land_PortableLight_double_F",     180,   1, false],
    [300,   "Long Concrete Wall",   "Land_CncBarrierMedium4_F",          0,   3, false],
    [325,   "Corner Sandbag",	    "Land_fort_bagfence_corner",		 0,	  1, false],
	[350,   "Circular Sandbag",     "Land_fort_bagfence_round",		 	 0,   1, false],
	[400,   "Large Ramp",           "FootBridge_30_ACR",                 0,   1, false],
    [425,   "Concrete Floor",       "Land_Podesta_5",					 0,   3, false],	
	[450,   "Bunker Block",         "Land_Bunker_01_blocks_3_F",         0,   2, false],
    [500,   "H Barrier",            "Land_HBarrier_5_F",                 0,   2, false],
    [525,   "Concrete Tanktrap",	"Land_DragonsTeeth_01_4x2_old_F",    0,   3, false],
	[550,   "Hallogen Lamp",        "Land_LampHalogen_F",               90,   1, false],
	[575,   "SandWall  5x low",    	"Base_WarfareBBarrier5x",            0,   2, false],
	[600,   "SandWall 10x low",     "Base_WarfareBBarrier10x",		     0,   2, false],
	[625,   "Ladder",               "Land_PierLadder_F",                 0,   1, false],
    [650,   "Storage box small",    "Box_NATO_Support_F",                0,   1, false],
    [700,   "Stairs Concrete",	    "Land_Podesta_1_stairs4",			 0,   1, false],
	[750,   "Stairs Hotel",         "Land_GH_Stairs_F",                 90,   2, false],
    [800,   "Double H Barrier",     "Land_HBarrierWall4_F",              0,   4, false],
    [850,   "Concrete Platform",    "BlockConcrete_F",                   0,   4, false],
    [900,   "Storage box large",    "Box_NATO_AmmoVeh_F",                0,   1, false],
    [1000,  "Barrier Base",		    "Base_WarfareBBarrier10xTall",		 0,   5, false],
	[1100,  "Static M2 Cal.50",     "CUP_B_M2StaticMG_USMC",             0, 0.5, false],
	[1300,  "Static HMG",           "B_HMG_01_high_F",                   0, 0.5, false],
    [1500,  "Small Bunker",         "Land_BagBunker_Small_F",          180, 1.5, false],
    [2000,  "Jail",                 "Land_Mil_Guardhouse",               0,   5, false],
    [3000,  "Guard Tower",          "Land_Cargo_Patrol_V3_F",            0,   2, false],
	[4000,  "HQ House",             "Land_Cargo_HQ_V3_F",               90,   8, false],
    [7500,  "Autonomous HMG",       "B_HMG_01_A_F",                    180, 3.5,  true],
	[10000, "Modular Bunker",       "Land_Bunker_01_Small_F",          180,   8, false],
	[15000, "Pillbox Bunker",       "Land_PillboxBunker_01_big_F",     180,   8, false],
	[18000, "Praetorian 1C",        "B_AAA_System_01_F",               180,   4, true],
    [20000, "Big Bunker",           "Land_Bunker_01_big_F",            180,   8, false],
	[35000, "Bastion Tower",        "Land_Helfenburk",                   0,  20, false],
	[50000, "Control Tower",        "Land_Airport_02_controlTower_F",    0,  20, false]
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

// List points for transfer
BULWARK_TRANSFERPOINT = [
    100,
    500,
    1000,
    5000,
    10000,
    20000
];