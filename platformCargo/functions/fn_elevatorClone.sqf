/**
*  fn_elevatorClone
*
*  Elevate the platform cargo.
*
*  Domain: Client
**/

_object = _this select 0;
_position = _this select 1;
_diff = _this select 2;
_step = _this select 3;

_length = PLATFORM_ELEVATOR_LENGTH;
_objectPos = getPosATL _object;
_objectId = str _object splitstring ": " select 1;
_dir = getDir _object;

_vehs = nearestobjects [_object, ["Man"], 5];
sleep 0.1;

[_object, false] remoteExec ["enableSimulation", 0];
[player, "platformCargo"] remoteExec ["sound_fnc_say3DGlobal", 0];

set_fn_animatePhase = {
	private ["_object"];
	_object = _this select 0;
	_items = _this select 1;

	{
		_object animateSource [_x select 0, _x select 1, _x select 2];
	} forEach _items;
};

// Save current animatePhase
_animations = [
	["Panel_1_rotate_source", _object animationSourcePhase "Panel_1_rotate_source", 1],
	["Panel_2_rotate_source", _object animationSourcePhase "Panel_2_rotate_source", 1],
	["Panel_3_rotate_source", _object animationSourcePhase "Panel_3_rotate_source", 1],
	["Panel_4_rotate_source", _object animationSourcePhase "Panel_4_rotate_source", 1],
	["Panel_1_hide_source", _object animationSourcePhase "Panel_1_hide_source", true],
	["Panel_2_hide_source", _object animationSourcePhase "Panel_2_hide_source", true],
	["Panel_3_hide_source", _object animationSourcePhase "Panel_3_hide_source", true],
	["Panel_4_hide_source", _object animationSourcePhase "Panel_4_hide_source", true]
];

// Reset animatePhase
[_object, [
	["Panel_1_rotate_source", 0, 1],
	["Panel_2_rotate_source", 0, 1],
	["Panel_3_rotate_source", 0, 1],
	["Panel_4_rotate_source", 0, 1],
	["Panel_1_hide_source", 0, true],
	["Panel_2_hide_source", 0, true],
	["Panel_3_hide_source", 0, true],
	["Panel_4_hide_source", 0, true]
]] spawn set_fn_animatePhase;

waitUntil {
	(_object animationSourcePhase "Panel_1_rotate_source") == 0 &&
	(_object animationSourcePhase "Panel_2_rotate_source") == 0 &&
	(_object animationSourcePhase "Panel_3_rotate_source") == 0 &&
	(_object animationSourcePhase "Panel_4_rotate_source") == 0
};

_height = 0;
_i = 1;
while {_height < _diff} do {
	// Destroy and create _object
	deleteVehicle _object;
	_object = createVehicle [
		"CargoPlaftorm_01_green_F", [
			_objectPos select 0,
			_objectPos select 1,
			(_objectPos select 2) + (_i * _step)
		], [], 0, "CAN_COLLIDE"
	];
	_object allowDamage false;
	_object setDir _dir;

	[_object, false] remoteExec ["enableSimulation", 0];

	_height = _i * PLATFORM_ELEVATOR_STEP;
	_i = _i + 1;

	_speed = 0.025;
	if (_step < 0) then {
		_speed = -1.5;
	};
	{
		_x setvelocity [0, 0, _speed];
	} foreach _vehs;

	sleep 0.01;
};

// Force position
[_object, [
	_objectPos select 0,
	_objectPos select 1,
	(_objectPos select 2) + (_i * _step)
]] remoteExec ["setPosATL", 0];

// Update the object id
{
	if (_objectId == _x select 0) exitWith {
		PLATFORM_ELEVATOR_START_POSITION set [_forEachIndex, [(str _object splitstring ": " select 1), _x select 1]];
		publicVariable "PLATFORM_ELEVATOR_START_POSITION";
	};
} forEach PLATFORM_ELEVATOR_START_POSITION;

// Restore animatePhase
[_object, _animations] spawn set_fn_animatePhase;

[_object, "platformCargo"] remoteExec ["sound_fnc_say3DGlobal", 0];
[_object, true] remoteExec ["enableSimulation", 0];

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
