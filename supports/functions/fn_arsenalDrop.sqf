/**
*  fn_arsenalDrop
*
*  Drops a cargo on a parachute
*
*  Domain: Server
**/
params ["_player", "_targetPos"];

if (count _targetPos == 0) then {
  [_player, "arsenalDrop"] remoteExec ["BIS_fnc_addCommMenuItem", _player]; //refund the support if looking at sky when activated
} else {
  _parachute = "B_Parachute_02_F" CreateVehicle [0,0,0];
  _parachute setPos [_targetPos select 0, _targetPos select 1, (getTerrainHeightASL _targetPos) + 75];
  _supplyBox = createVehicle ["B_CargoNet_01_ammo_F", [0,0,0], [], 0, "CAN_COLLIDE"];

  clearItemCargoGlobal _supplyBox;
  clearWeaponCargoGlobal _supplyBox;
  clearMagazineCargoGlobal _supplyBox;
  clearBackpackCargoGlobal _supplyBox;

  [_supplyBox, ["<t color='#00ffff'>" + "Pickup", { _this call bulwark_fnc_moveBox; },"",1,false,false,"true","true",2.5]] remoteExec ["addAction", 0, true];
  [_supplyBox, ["Arsenal", {["Open",true] spawn BIS_fnc_arsenal},"",1,false,false,"true","true",2.5]] remoteExec ["addAction", 0, true];
  if (isClass(configFile >> "CfgPatches" >> "ace_main")) then {
    [_supplyBox, ["Arsenal ACE", {[_this select 0, player, true] call ACE_arsenal_fnc_openBox},"",1,false,false,"true","true",2.5]] remoteExec ["addAction", 0, true];
  };
 
  _supplyBox attachTo [_parachute, [0,0,0]];
  _supplyBox allowDamage false;
  
  waitUntil {getpos _supplyBox select 2<4};
  _smoker = "SmokeShellBlue" createVehicle (getpos _supplyBox vectorAdd [0,0,5]);
  detach _supplyBox;
}