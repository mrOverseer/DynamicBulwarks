/**
*  Preset
*  Defines all global config for the mission
*  Required mods:
*  Domain: Client, Server
**/
/* MOD FILTER */
modTag = []; //limits loot and vehicles to a specific mod. Mods usually have a tag within their class names, use that. For example modTag = ["LIB"] would only spawn Iron Front Weapons. Can use multiple for example:modTag = ["LIB,"NORTH"];

/* Attacker Waves */
//Unit Whitelist - unit classnames are expected for example: HOSTILE_LEVEL_1_WHITELIST = ["B_Soldier_A_F","B_support_MG_F"];
HOSTILE_INFANTRY_WHITELIST = [];
DEFECTOR_CLASS_WHITELIST = []; //defector special wave units
PARATROOP_CLASS_WHITELIST = []; //friendly units called in via support

HOSTILE_VEHICLE_WHITELIST = [];
HOSTILE_VEHICLE_BLACKLIST = [];

/* LOOT */
Medkit = "Medikit";
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
    // "arifle_AK12U_F",
    // "arifle_AK12U_arid_F",
    // "arifle_AK12U_lush_F",
    // "sgun_HunterShotgun_01_F",
    // "sgun_HunterShotgun_01_sawedoff_F",
    // "srifle_DMR_06_hunter_F",
    // "arifle_MSBS65_F",
    // "arifle_MSBS65_sand_F",
    // "arifle_MSBS65_camo_F",
    // "arifle_MSBS65_black_F",
    // "arifle_MSBS65_GL_F",
    // "arifle_MSBS65_GL_sand_F",
    // "arifle_MSBS65_GL_camo_F",
    // "arifle_MSBS65_GL_black_F",
    // "arifle_MSBS65_Mark_F",
    // "arifle_MSBS65_Mark_sand_F",
    // "arifle_MSBS65_Mark_camo_F",
    // "arifle_MSBS65_Mark_black_F",
    // "arifle_MSBS65_UBS_F",
    // "arifle_MSBS65_UBS_sand_F",
    // "arifle_MSBS65_UBS_camo_F",
    // "arifle_MSBS65_UBS_black_F",
    // "arifle_RPK12_F",
    // "arifle_RPK12_arid_F",
    // "arifle_RPK12_lush_F",
    // "H_Beret_EAF_01_F",
    // "H_HelmetAggressor_F",
    // "H_HelmetAggressor_cover_F",
    // "H_HelmetAggressor_cover_taiga_F",
    // "H_HelmetB_plain_wdl",
    // "H_HelmetB_light_wdl",
    // "H_HelmetSpecB_wdl",
    // "H_Tank_eaf_F",
    // "H_HelmetCrew_I_E",
    // "H_PilotHelmetFighter_I_E",
    // "H_PilotHelmetHeli_I_E",
    // "H_CrewHelmetHeli_I_E",
    // "H_HelmetHBK_headset_F",
    // "H_HelmetHBK_ear_F",
    // "H_HelmetHBK_F",
    // "H_HelmetHBK_chops_F",
    // "H_MilCap_wdl",
    // "H_MilCap_taiga",
    // "H_MilCap_grn",
    // "H_MilCap_eaf",
    // "H_Hat_Tinfoil_F",
    // "H_Booniehat_wdl",
    // "H_Booniehat_taiga",
    // "H_Booniehat_mgrn",
    // "H_Booniehat_eaf",
    // "U_O_R_Gorka_01_black_F",
    // "U_I_E_Uniform_01_coveralls_F",
    // "U_I_E_Uniform_01_shortsleeve_F",
    // "U_B_CombatUniform_mcam_wdl_f",
    // "U_B_CombatUniform_tshirt_mcam_wdl_f",
    // "U_I_E_Uniform_01_tanktop_F",
    // "U_I_E_Uniform_01_sweater_F",
    // "U_I_E_Uniform_01_officer_F",
    // "U_I_E_Uniform_01_F",
    // "U_I_L_Uniform_01_deserter_F",
    // "U_I_L_Uniform_01_camo_F",
    // "U_B_CombatUniform_vest_mcam_wdl_f",
    // "U_I_L_Uniform_01_tshirt_skull_F",
    // "U_I_L_Uniform_01_tshirt_sport_F",
    // "U_I_L_Uniform_01_tshirt_black_F",
    // "U_C_E_LooterJacket_01_F",
    // "U_C_Uniform_Scientist_01_formal_F",
    // "U_C_Uniform_Scientist_01_F",
    // "U_C_Uniform_Scientist_02_F",
    // "U_C_Uniform_Scientist_02_formal_F",
    // "U_C_Uniform_Farmer_01_F",
    // "U_O_R_Gorka_01_F",
    // "U_O_R_Gorka_01_brown_F",
    // "U_O_R_Gorka_01_camo_F",
    // "U_C_CBRN_Suit_01_Blue_F",
    // "U_C_CBRN_Suit_01_White_F",
    // "U_C_CBRN_Suit_01_Wdl_F",
    // "U_C_CBRN_Suit_01_MTP_F",
    // "U_C_CBRN_Suit_01_Tropic_F",
    // "U_C_CBRN_Suit_01_AAF_F",
    // "U_C_CBRN_Suit_01_EAF_F",
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
    // "B_AssaultPack_wdl_F",
    // "B_AssaultPack_eaf_F",
    // "B_FieldPack_taiga_F",
    // "B_FieldPack_green_F",
    // "B_RadioBag_01_digi_F",
    // "B_RadioBag_01_eaf_F",
    // "B_RadioBag_01_ghex_F",
    // "B_RadioBag_01_hex_F",
    // "B_RadioBag_01_mtp_F",
    // "B_RadioBag_01_black_F",
    // "B_RadioBag_01_tropic_F",
    // "B_RadioBag_01_oucamo_F",
    // "B_Carryall_wdl_F",
    // "B_Carryall_eaf_F",
    // "B_Carryall_taiga_F",
    // "B_Carryall_green_F",
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
//LOOT WHITELISTS, when a whitelist contains an element it is used instead of what the game grabs from factions:
LOOT_WHITELIST_UNIFORMS = [];
LOOT_WHITELIST_VESTS = [];
LOOT_WHITELIST_HEADGEAR = [];
LOOT_WHITELIST_BACKPACKS = [];
LOOT_WHITELIST_STATICGUNS = [];
LOOT_WHITELIST_AUTOSTATICGUNS = [];
LOOT_WHITELIST_STATICSUPPORTS = [];
LOOT_WHITELIST_DRONES = [];
LOOT_WHITELIST_GLASSES = [];
LOOT_WHITELIST_ITEMS = [];
LOOT_WHITELIST_ATTACHMENT = [];
LOOT_WHITELIST_GRENADES = [];
LOOT_WHITELIST_EXPLOSIVES = [];
LOOT_WHITELIST_MG = [];
LOOT_WHITELIST_SMG = [];
LOOT_WHITELIST_SNIPER = [];
LOOT_WHITELIST_SHOTGUN = [];
LOOT_WHITELIST_HANDGUN = [];
LOOT_WHITELIST_LAUNCHER = [];
LOOT_WHITELIST_ASSAULT = [];

/* POINTS */
SCORE_RANDOMBOX = 250;  // Cost to spin the box
//Point multipliers of SCORE_KILL for different waves
HOSTILE_LEVEL_1_POINT_SCORE = 0.75;
HOSTILE_LEVEL_2_POINT_SCORE = 1;
HOSTILE_LEVEL_3_POINT_SCORE = 1.50;
HOSTILE_LEVEL_4_POINT_SCORE = 1.75;
HOSTILE_INFANTRY_POINT_SCORE = 0.75;
HOSTILE_CAR_POINT_SCORE = 2;
HOSTILE_ARMOUR_POINT_SCORE = 4;

/* SPECIAL WAVES */
//comment out the waves you don't like. Don't forget to remove the , behind the last entry
//list of special waves you can get early on
lowSpecialWave_list = [
	"fogWave",
	"switcharooWave",
    "specCivs"
];
//comment out the waves you don't like. Don't forget to remove the , behind the last entry
//list of all special waves you can get on higher waves
specialWave_list= [
	"specCivs",
	"fogWave",
	"demineWave",
	"switcharooWave",
	"suicideWave",
	"specMortarWave",
	"nightWave",
	"defectorWave",
    "mgWave",
    "sniperWave"
];
//starting from this wave the lowSpecialWaveList is used
lowSpecialWaveStart = 5;
//starting from this wave the specialWaveList is used
SpecialWaveStart = 10;

/* SUPPORT */
//Comment out or delete the below support items to prevent the player from buying them
BULWARK_SUPPORTITEMS = [
    [100,  "Recon UAV",               "reconUAV"],
    [1680, "Emergency Teleport",     "telePlode"],
    [1950, "Paratroopers",            "paraDrop"],
    [3850, "Missile CAS",            "airStrike"],
    [4220, "Mine Cluster Shell",     "mineField"],
    [4690, "Rage Stimpack",           "ragePack"],
    [5930, "Mind Control Gas",      "mindConGas"],
    [6666, "ARMAKART TM",             "armaKart"],
    [7500, "Predator Drone",      "droneControl"],
    [15000, "Supply Box Drop",  "supportBoxDrop"],
    [50000, "Arsenal Drop",        "arsenalDrop"]
];
//support settings:
casAircraft = "B_Plane_CAS_01_DynamicLoadout_F"; //CAS aircraft default: "B_Plane_CAS_01_DynamicLoadout_F"
supportAircraft = "B_T_VTOL_01_vehicle_F"; //Plane that drops support and paratroopers default: "B_T_VTOL_01_vehicle_F"
supportAircraftFlyInHeight = 100; //default: 100
supportAircraftWaypointHeight = 300; //default: 300
supportAircraftSpeed = 20; // adds speed to the aircraft -- default 20

/* Objects the Player can buy */

/* Radius prevents hostiles walking through objects */

/*  Price - Display Name - Class Name - Rotation When Bought - Object Radius (meters) - explosive - invincible - with crew (for autonomous)	*/
BULWARK_BUILDITEMS = [
    [10,    "Razon Wire",		        "Land_Razorwire_F",				         0,   1, 0, 0, false],
	[25,    "Long Plank (8m)",          "Land_Plank_01_8m_F",                    0,   4, 0, 0, false],
    [50,    "Junk Barricade",           "Land_Barricade_01_4m_F",                0,   1, 0, 0, false],
    [75,    "Small Ramp (1m)",          "Land_Obstacle_Ramp_F",                180,   1, 0, 0, false],
    [75,    "Flat Triangle (1m)",       "Land_DomeDebris_01_hex_green_F",      180,   1, 0, 0, false],
    [100,   "Short Sandbag Wall",       "Land_SandbagBarricade_01_half_F",       0,   1, 0, 0, false],
    [125,   "Sandbag Barricade",        "Land_SandbagBarricade_01_hole_F",       0,   1, 0, 0, false],
    [150,   "Concrete Shelter",         "Land_CncShelter_F",                     0,   1, 0, 0, false],
    [180,   "Concrete Panels",          "Land_ConcretePanels_02_single_v1_F",    0,   1, 0, 0, false],
	[200,   "Small Bridge",             "Land_Obstacle_Bridge_F",                0,   2, 0, 0, false],
    [225,   "Concrete Walkway",         "Land_GH_Platform_F",                    0, 3.5, 0, 0, false],
    [250,   "Tall Concrete Wall",       "Land_Mil_WallBig_4m_F",                 0,   1, 0, 0, false],
    [275,   "Portable Light",           "Land_PortableLight_double_F",         180,   1, 0, 0, false],
    [300,   "Long Concrete Wall",       "Land_CncBarrierMedium4_F",              0,   3, 0, 0, false],
    [325,   "Corner Sandbag",	        "Land_fort_bagfence_corner",	    	 0,	  1, 0, 0, false],
	[350,   "Circular Sandbag",         "Land_fort_bagfence_round",		     	 0,   1, 0, 0, false],
    [375,   "Concrete Panels (four)",   "Land_ConcretePanels_02_four_F",         0,   1, 0, 0, false],
	[400,   "Large Ramp",               "FootBridge_30_ACR",                     0,   1, 0, 0, false],
    [425,   "Concrete Floor",           "Land_Podesta_5",                        0,   3, 0, 0, false],	
	[450,   "Bunker Block",             "Land_Bunker_01_blocks_3_F",             0,   2, 0, 0, false],
    [500,   "H Barrier",                "Land_HBarrier_5_F",                     0,   2, 0, 0, false],
    [500,   "Explosive Barrel",         "Land_MetalBarrel_F",                    0,   1, 1, 0, false],	// explosive
    [525,   "Concrete Tanktrap",	    "Land_DragonsTeeth_01_4x2_old_F",        0,   3, 0, 0, false],
	[550,   "Hallogen Lamp",            "Land_LampHalogen_F",                   90,   1, 0, 0, false],
	[575,   "SandWall  5x low",    	    "Base_WarfareBBarrier5x",                0,   2, 0, 0, false],
	[600,   "SandWall 10x low",         "Base_WarfareBBarrier10x",		         0,   2, 0, 0, false],
	[625,   "Ladder",                   "Land_PierLadder_F",                     0,   1, 0, 0, false],
    [650,   "Storage box small",        "Box_NATO_Support_F",                    0,   1, 0, 1, false],  // invincible
    [700,   "Stairs Concrete",	        "Land_Podesta_1_stairs4",			     0,   1, 0, 0, false],
	[750,   "Stairs Hotel",             "Land_GH_Stairs_F",                     90,   2, 0, 0, false],
    [800,   "Double H Barrier",         "Land_HBarrierWall4_F",                  0,   4, 0, 0, false],
    [850,   "Concrete Platform",        "BlockConcrete_F",                       0,   4, 0, 0, false],
    [900,   "Storage box large",        "Box_NATO_AmmoVeh_F",                    0,   1, 0, 1, false],  // invincible
    [1000,  "Barrier Base",		        "Base_WarfareBBarrier10xTall",		     0,   5, 0, 0, false],
	[1100,  "Static M2 Cal.50",         "CUP_B_M2StaticMG_USMC",                 0, 0.5, 0, 0, false],
	[1300,  "Static HMG",               "B_HMG_01_high_F",                       0, 0.5, 0, 0, false],
    [1500,  "Small Bunker",             "Land_BagBunker_Small_F",              180, 1.5, 0, 0, false],
    [2000,  "Jail",                     "Land_Mil_Guardhouse",                   0,   5, 0, 0, false],
    [3000,  "Guard Tower",              "Land_Cargo_Patrol_V3_F",                0,   2, 0, 1, false],  // invincible
	[4000,  "HQ House",                 "Land_Cargo_HQ_V3_F",                   90,   8, 0, 0, false],
    [7500,  "Autonomous HMG",           "B_HMG_01_A_F",                        180, 3.5, 0, 1,  true],  // invincible and autonomous
	[10000, "Modular Bunker",           "Land_Bunker_01_Small_F",              180,   8, 0, 0, false],
	[12000, "Cargo Platform",           "CargoPlaftorm_01_green_F",              0,   4, 0, 1, false],  // invincible
	[15000, "Pillbox Bunker",           "Land_PillboxBunker_01_big_F",         180,   8, 0, 0, false],
    [20000, "Big Bunker",               "Land_Bunker_01_big_F",                180,   8, 0, 0, false],
	[35000, "Bastion Tower",            "Land_Helfenburk",                       0,  20, 0, 0, false],
	[50000, "Praetorian 1C",            "B_AAA_System_01_F",                   180,   4, 0, 1,  true]  // invincible and autonomous
];