/**
*  init
*
*  Initialize script.
*
*  Domain: Server
**/

PLATFORM_CARGO = tower;
PLATFORM_POSITION = getPosATL PLATFORM_CARGO;

// 1 => Set position (MP refresh slow)
// 2 => Drone
// 3 => Clone - Destroy and create platform (MP force refresh)
// 4 => Key frame animation
// 5 => Static object
PLATFORM_ELEVATOR_TYPE = 3;
PLATFORM_ELEVATOR_LENGTH = 6.541;
PLATFORM_ELEVATOR_STEP = 0.025;

PLATFORM_CARGO allowDamage false;

publicVariable "PLATFORM_CARGO";
publicVariable "PLATFORM_POSITION";
publicVariable "PLATFORM_ELEVATOR_TYPE";
publicVariable "PLATFORM_ELEVATOR_LENGTH";

[PLATFORM_CARGO, ["<t color='#ffa500'>" + "Platform Cargo", "[] spawn platformCargo_fnc_openGui; idAction = _this select 2","",1.5,false,false,"true","true",9]] remoteExec ["addAction", 0, true];