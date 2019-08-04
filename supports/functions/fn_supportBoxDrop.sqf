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
}else{
  _parachute = "B_Parachute_02_F" CreateVehicle [0,0,0];
  _parachute setPos [_targetPos select 0, _targetPos select 1, (getTerrainHeightASL _targetPos) + 75];
  _supplyBox = createVehicle ["Box_NATO_WpsSpecial_F", [0,0,0], [], 0, "CAN_COLLIDE"];

  // if (isDedicated) then {
    clearItemCargo _supplyBox;
    clearWeaponCargo _supplyBox;
    clearMagazineCargo _supplyBox;
    clearBackpackCargo _supplyBox;

    // Weapon & ammo
    _supplyBox addWeaponCargo ["arifle_AK12_GL_F", 1];
    _supplyBox addWeaponCargo ["arifle_AK12_GL_lush_F", 1];
    _supplyBox addMagazineCargo ["30Rnd_762x39_Mag_F", 15];
    _supplyBox addMagazineCargo ["75rnd_762x39_AK12_Mag_Tracer_F", 25];
    _supplyBox addItemCargo ["1Rnd_HE_Grenade_shell", 50];
    _supplyBox addWeaponCargo ["CUP_srifle_M14", 1];
    _supplyBox addMagazineCargo ["CUP_20Rnd_762x51_DMR", 50];
    _supplyBox addWeaponCargo ["srifle_DMR_03_multicam_F", 1];
    _supplyBox addMagazineCargo ["20Rnd_762x51_Mag", 25];
    _supplyBox addWeaponCargo ["srifle_DMR_02_camo_AMS_LP_F", 1];
    _supplyBox addMagazineCargo ["10Rnd_338_Mag", 25];
    _supplyBox addWeaponCargo ["srifle_LRR_camo_SOS_F", 1];
    _supplyBox addMagazineCargo ["7Rnd_408_Mag", 25];
    _supplyBox addWeaponCargo ["srifle_DMR_04_ARCO_F", 1];
    _supplyBox addMagazineCargo ["10Rnd_127x54_Mag", 25];
    _supplyBox addWeaponCargo ["LAGO_KU98K_NSK", 1];
    _supplyBox addMagazineCargo ["KU98K_NSK_MAG", 50];
    _supplyBox addWeaponCargo ["MMG_02_camo_F", 1];
    _supplyBox addMagazineCargo ["130Rnd_338_Mag", 8];
    _supplyBox addWeaponCargo ["MMG_01_tan_F", 1];
    _supplyBox addMagazineCargo ["150Rnd_93x64_Mag", 8];
    _supplyBox addWeaponCargo ["launch_RPG7_F", 2];
    _supplyBox addMagazineCargo ["RPG7_F", 20];

    _supplyBox addMagazineCargo ["ACE_10Rnd_338_API526_Mag", 10];
    _supplyBox addMagazineCargo ["ACE_10Rnd_338_300gr_HPBT_Mag", 10];

    // Optic
    _supplyBox addItemCargo ["optic_Arco", 2];
    _supplyBox addItemCargo ["optic_Hamr", 2];
    _supplyBox addItemCargo ["optic_SOS", 2];
    _supplyBox addItemCargo ["optic_MRCO", 2];
    _supplyBox addItemCargo ["optic_Nightstalker", 1];
    _supplyBox addItemCargo ["optic_tws", 1];
    _supplyBox addItemCargo ["optic_tws_mg", 1];
    _supplyBox addItemCargo ["optic_DMS", 1];
    _supplyBox addItemCargo ["optic_LRPS", 1];
    _supplyBox addItemCargo ["optic_AMS", 1];
    _supplyBox addItemCargo ["optic_ERCO_blk_F", 1];

    // Granade
    _supplyBox addMagazineCargo ["HandGrenade", 50];
    _supplyBox addMagazineCargo ["ACE_M14", 5];
    _supplyBox addMagazineCargo ["ACE_M84", 5];

    // Explosive
    _supplyBox addWeaponCargo ["MineDetector", 2];
    _supplyBox addMagazineCargo ["DemoCharge_Remote_Mag", 15];
    _supplyBox addMagazineCargo ["SatchelCharge_Remote_Mag", 15];
    _supplyBox addMagazineCargo ["APERSMine_Range_Mag", 15];
    _supplyBox addMagazineCargo ["APERSBoundingMine_Range_Mag", 15];
    _supplyBox addMagazineCargo ["APERSTripMine_Wire_Mag", 15];
    _supplyBox addMagazineCargo ["ClaymoreDirectionalMine_Remote_Mag", 15];
    _supplyBox addMagazineCargo ["ATMine_Range_Mag", 15];
    _supplyBox addMagazineCargo ["CUP_Mine_M", 15];
    _supplyBox addMagazineCargo ["CUP_MineE_M", 15];
    _supplyBox addMagazineCargo ["SLAMDirectionalMine_Wire_Mag", 15];
    _supplyBox addItemCargo ["ACE_Clacker", 5];
    _supplyBox addItemCargo ["ACE_M26_Clacker", 5];
    _supplyBox addItemCargo ["ACE_DefusalKit", 5];
    _supplyBox addItemCargo ["ACE_DeadManSwitch", 5];

    // Chemlight
    _supplyBox addMagazineCargo ["Chemlight_green", 10];
    _supplyBox addMagazineCargo ["Chemlight_yellow", 10];

    // Other
    _supplyBox addItemCargo ["Medikit", 10];
    _supplyBox addItemCargo ["NVGogglesB_blk_F", 2];
    _supplyBox addItemCargo ["Integrated_NVG_F", 2];
    _supplyBox addItemCargo ["ACE_NVG_Gen4", 2];
    _supplyBox addWeaponCargo ["ACE_HuntIR_monitor", 1];
    _supplyBox addItemCargo ["ACE_EarPlugs", 5];
    _supplyBox addItemCargo ["ACE_rope15", 1];

    // Equipament
    _supplyBox addItemCargo ["U_I_GhillieSuit", 1];
    _supplyBox addItemCargo ["U_B_CTRG_3", 1];
    _supplyBox addItemCargo ["U_B_CTRG_Soldier_F", 1];
    _supplyBox addItemCargo ["H_HelmetSpecB", 1];
    _supplyBox addItemCargo ["H_HelmetB_TI_tna_F", 1];
    _supplyBox addItemCargo ["V_PlateCarrierSpec_mtp", 1];
    _supplyBox addBackpackCargo ["B_Carryall_mcamo", 3];
    _supplyBox addBackpackCargo ["B_Bergen_mcamo_F", 1];  
  // }; 

  [_supplyBox, ["<t color='#00ffff'>" + "Pickup", "bulwark\moveBox.sqf","",1,false,false,"true","true",0]] remoteExec ["addAction", 0, true];

  _supplyBox attachTo [_parachute, [0,0,0]];
  _supplyBox allowDamage false;
  
  waitUntil {getpos _supplyBox select 2<4};
  _smoker = "SmokeShellBlue" createVehicle (getpos _supplyBox vectorAdd [0,0,5]);
  detach _supplyBox;
}