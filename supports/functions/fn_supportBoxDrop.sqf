/**
*  fn_supportBoxDrop
*
*  Drops a cargo on a parachute
*
*  Domain: Server
**/
params ["_player", "_targetPos"];

if (count _targetPos == 0) then {
  [_player, "supportBoxDrop"] remoteExec ["BIS_fnc_addCommMenuItem", _player]; //refund the support if looking at sky when activated
} else {
  if (!isServer) exitWith {};

  _parachute = "B_Parachute_02_F" CreateVehicle [0,0,0];
  _parachute setPos [_targetPos select 0, _targetPos select 1, (getTerrainHeightASL _targetPos) + 75];
  _supplyBox = createVehicle ["B_CargoNet_01_ammo_F", [0,0,0], [], 0, "CAN_COLLIDE"];

  clearItemCargoGlobal _supplyBox;
  clearWeaponCargoGlobal _supplyBox;
  clearMagazineCargoGlobal _supplyBox;
  clearBackpackCargoGlobal _supplyBox;

  // Weapon & ammo
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
  _supplyBox addWeaponCargoGlobal ["LAGO_KU98K_NSK", 1];
  _supplyBox addMagazineCargoGlobal ["KU98K_NSK_MAG", 50];
  _supplyBox addWeaponCargoGlobal ["MMG_02_camo_F", 1];
  _supplyBox addMagazineCargoGlobal ["130Rnd_338_Mag", 8];
  _supplyBox addWeaponCargoGlobal ["MMG_01_tan_F", 1];
  _supplyBox addMagazineCargoGlobal ["150Rnd_93x64_Mag", 8];
  _supplyBox addWeaponCargoGlobal ["launch_RPG7_F", 2];
  _supplyBox addMagazineCargoGlobal ["RPG7_F", 20];

  _supplyBox addMagazineCargoGlobal ["ACE_10Rnd_338_API526_Mag", 10];
  _supplyBox addMagazineCargoGlobal ["ACE_10Rnd_338_300gr_HPBT_Mag", 10];

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

  // Equipament
  _supplyBox addItemCargoGlobal ["U_I_GhillieSuit", 2];
  _supplyBox addItemCargoGlobal ["U_B_CTRG_3", 2];
  _supplyBox addItemCargoGlobal ["U_B_CTRG_Soldier_F", 2];
  _supplyBox addItemCargoGlobal ["H_HelmetSpecB", 2];
  _supplyBox addItemCargoGlobal ["H_HelmetB_TI_tna_F", 2];
  _supplyBox addItemCargoGlobal ["V_PlateCarrierSpec_mtp", 2];
  _supplyBox addBackpackCargoGlobal ["B_Carryall_mcamo", 3];
  _supplyBox addBackpackCargoGlobal ["B_Bergen_mcamo_F", 1];

  [_supplyBox, ["<t color='#00ffff'>" + "Pickup", "bulwark\moveBox.sqf","",1,false,false,"true","true",0]] remoteExec ["addAction", 0, true];

  _supplyBox attachTo [_parachute, [0,0,0]];
  _supplyBox allowDamage false;
  
  waitUntil {getpos _supplyBox select 2<4};
  _smoker = "SmokeShellBlue" createVehicle (getpos _supplyBox vectorAdd [0,0,5]);
  detach _supplyBox;
}