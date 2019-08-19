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
_dir = getDir _object;

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

diag_log(format ["Rotate phases: %1", _animations]);

set_fn_animatePhase = {
	private ["_object"];
	_object = _this select 0;
	_items = _this select 1;

	{
		_object animateSource [_x select 0, _x select 1, _x select 2];
	} forEach _items;
};

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

waitUntil {(_object animationSourcePhase "Panel_3_rotate_source") == 0};

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
	diag_log(format ["height: %1 - tower: %2", _height, getPosATL _object]);

	_height = _i * PLATFORM_ELEVATOR_STEP;
	_i = _i + 1;

	sleep 0.01;
};

_object setVehicleVarName "tower";
			
// Force position
[_object, [
	_objectPos select 0,
	_objectPos select 1,
	(_objectPos select 2) + (_i * _step)
]] remoteExec ["setPosATL", 0];

// Restore animatePhase
[_object, _animations] spawn set_fn_animatePhase;

PLATFORM_CARGO = _object;
publicVariable "PLATFORM_CARGO";

[_object, "platformCargo"] remoteExec ["sound_fnc_say3DGlobal", 0];
[_object, true] remoteExec ["enableSimulation", 0];

[_object, ["<t color='#ffa500'>" + "Platform Cargo", "[] spawn platformCargo_fnc_openGui; idAction = _this select 2","",1.5,false,false,"true","true",9]] remoteExec ["addAction", 0, true];
