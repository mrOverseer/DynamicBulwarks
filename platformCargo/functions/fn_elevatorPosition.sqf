/**
*  fn_elevatorPosition
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

_length = PC_ELEVATOR_LENGTH;
_objectPos = getPosATL _object;
_startPhase = _object animationSourcePhase "Leg_1_move_source";

_vehs = nearestobjects [_object, ["Man"], 5];
sleep 0.1;

[_object, false] remoteExec ["enableSimulation", 0];

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

if (_object animationSourcePhase "Panel_1_rotate_source" != 0 ||
	_object animationSourcePhase "Panel_2_rotate_source" != 0 ||
	_object animationSourcePhase "Panel_3_rotate_source" != 0 ||
	_object animationSourcePhase "Panel_4_rotate_source" != 0) then {
	[_object, "platformCargo"] remoteExec ["sound_fnc_say3DGlobal", 0];
};

waitUntil {
	(_object animationSourcePhase "Panel_1_rotate_source") == 0 &&
	(_object animationSourcePhase "Panel_2_rotate_source") == 0 &&
	(_object animationSourcePhase "Panel_3_rotate_source") == 0 &&
	(_object animationSourcePhase "Panel_4_rotate_source") == 0
};

[_object, "platformCargo"] remoteExec ["sound_fnc_say3DGlobal", 0];

// Animate legs
_phase = ((100 - _position) / 100) * _length;
_coef = _length / 8.8;
_object animateSource ['Leg_1_move_source', _phase, _coef];
_object animateSource ['Leg_2_move_source', _phase, _coef];
_object animateSource ['Leg_3_move_source', _phase, _coef];
_object animateSource ['Leg_4_move_source', _phase, _coef];

while {(_object animationSourcePhase "Leg_1_move_source") != _phase} do {
	_currentPhase = _object animationSourcePhase "Leg_1_move_source";

	_speed = 0.025;
	_z = _startPhase - _currentPhase;
	if (_currentPhase < _phase) then {
		_speed = -1.5;
		_z = -(_currentPhase - _startPhase);
	};

	[_object, [
		_objectPos select 0,
		_objectPos select 1,
		(_objectPos select 2) + _z
	]] remoteExec ["setPosATL", 0];

	// Avoid player jumps when going up / down
	{
		_x setvelocity [0, 0, _speed];
	} foreach _vehs;

	sleep 0.025;
};

// Restore animatePhase
{
	_object animateSource [_x select 0, _x select 1, _x select 2];
} forEach _animations;

[_object, "platformCargo"] remoteExec ["sound_fnc_say3DGlobal", 0];
[_object, true] remoteExec ["enableSimulation", 0];

// Call callback script
[_object] spawn compile _callback;