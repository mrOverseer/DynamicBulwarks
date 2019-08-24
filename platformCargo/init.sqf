/**
*  init
*
*  Initialize script.
*
*  Domain: Server
**/

// 1 => Set position (MP refresh slow)
// 2 => Drone
// 3 => Clone - Destroy and create platform (MP force refresh)
// 4 => Test (It doesn't work)
// 5 => Static object (It doesn't work)
PLATFORM_ELEVATOR_TYPE = 3;
PLATFORM_ELEVATOR_LENGTH = 6.541;
PLATFORM_ELEVATOR_STEP = 0.025;

publicVariable "PLATFORM_ELEVATOR_TYPE";
publicVariable "PLATFORM_ELEVATOR_LENGTH";
publicVariable "PLATFORM_ELEVATOR_STEP";
publicVariable "PLATFORM_ELEVATOR_START_POSITION";
