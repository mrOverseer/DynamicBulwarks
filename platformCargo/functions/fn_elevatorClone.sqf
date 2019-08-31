/**
*  fn_elevatorClone
*
*  Elevate the platform cargo.
*
*  Domain: Client
**/

_object = _this select 0;
_position = (_this select 1) select 0;
_diff = (_this select 1) select 1;
_step = (_this select 1) select 2;
_callback = _this select 2;

_className = PC_CLASS_NAME;
_length = PC_ELEVATOR_LENGTH;
_objectPos = getPosATL _object;
_objectId = str _object splitstring ": " select 1;
_dir = getDir _object;

_vehs = nearestobjects [_object, ["Man"], 5];
sleep 0.1;

[_object, false] remoteExec ["enableSimulation", 0];
[player, "platformCargo"] remoteExec ["sound_fnc_say3DGlobal", 0];

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
{
	_object animateSource [_x select 0, 0, _x select 2];
} forEach _animations;

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
		_className, [
			_objectPos select 0,
			_objectPos select 1,
			(_objectPos select 2) + (_i * _step)
		], [], 0, "CAN_COLLIDE"
	];
	_object allowDamage false;
	_object setDir _dir;

	[_object, false] remoteExec ["enableSimulation", 0];

	_height = _i * PC_ELEVATOR_STEP;
	_i = _i + 1;

	// Avoid player jumps when going up / down
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
		PC_START_POSITION set [_forEachIndex, [(str _object splitstring ": " select 1), _x select 1]];
		publicVariable "PC_START_POSITION";
	};
} forEach PC_START_POSITION;

// Restore animatePhase
{
	_object animateSource [_x select 0, _x select 1, _x select 2];
} forEach _animations;

[_object, "platformCargo"] remoteExec ["sound_fnc_say3DGlobal", 0];
[_object, true] remoteExec ["enableSimulation", 0];

// Call callback script
[_object] spawn compile _callback;
