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

// FOR CARGO PLATFORM IN MAP

// Replace the object, necessary to get get object id
_object = tower;
_objectPos = getPosATL _object;
_objectDir = getDir _object;
deleteVehicle _object;
_object = createVehicle ["CargoPlaftorm_01_green_F", _objectPos, [], 0, "CAN_COLLIDE"];
_object allowDamage false;
_object setDir _objectDir;

// Force position
[_object, _objectPos] remoteExec ["setPosATL", 0];

PLATFORM_ELEVATOR_START_POSITION = [[str _object splitstring ": " select 1, _objectPos]];
publicVariable "PLATFORM_ELEVATOR_START_POSITION";

// Add actions
[
	_object,
	[
		'<t color="#ff0000">Remove Object</t>',
		'[_this select 0, _this select 1] call build_fnc_sell;',
		'', 1, false, false, 'true', 'true', 5
	]
] remoteExec ['addAction', 0];

[
	_object,
	[
		'<t color="#00ffff">Move Up</t>',
		'[_this select 0, _this select 3, _this select 1] call build_fnc_move;',
		[0,0,0.25],2,false,false,'true','true',5
	]
] remoteExec ['addAction', 0];

[
	_object,
	[
		'<t color="#00ff00">Move Down</t>',
		'[_this select 0, _this select 3, _this select 1] call build_fnc_move;',
		[0,0,-0.25],2,false,false,'true','true',5
	]
] remoteExec ['addAction', 0];

[
	_object,
	[
		'<t color="#ffffff">Pickup</t>',
		'[_this select 0, _this select 1] call build_fnc_pickup;',
		[0,0,0.25],2,false,false,'true','true',5
	]
] remoteExec ['addAction', 0];

[
	_object,
	[
		'<t color="#ffff00">Reset Rotation</t>',
		'[_this select 0, _this select 1] call build_fnc_reset;',
		[0,0,0.25],2,false,false,'true','true',5
	]
] remoteExec ['addAction', 0];

[
	_object,
	[
		"<t color='#ffa500'>" + "Platform Cargo",
		"_this spawn platformCargo_fnc_openGui",
		"",1.5,false,false,"true","true",9
	]
] remoteExec ["addAction", 0, true];