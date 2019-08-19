/**
*  fn_elevatorPosition
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

_vehs = nearestobjects [_object, ["Man"], 5];
sleep 0.1;

// Animate legs
_phase = ((100 - _position) / 100) * _length;
_coef = _length / 8.8;
_object animateSource ['Leg_1_move_source', _phase, _coef];
_object animateSource ['Leg_2_move_source', _phase, _coef];
_object animateSource ['Leg_3_move_source', _phase, _coef];
_object animateSource ['Leg_4_move_source', _phase, _coef];

_height = 0;
_i = 1;
while {_height < _diff} do {
	[_object, [
		_objectPos select 0,
		_objectPos select 1,
		(_objectPos select 2) + (_i * _step)
	]] remoteExec ["setPosATL", 0];
	diag_log(format ["height: %1 - tower: %2", _height, getPosATL _object]);

	_height = _i * PLATFORM_ELEVATOR_STEP;
	_i = _i + 1;

	{
		_x setvelocity [0, 0, ((_i - 1) * _step)];
	} foreach _vehs;

	sleep 0.01;
};

waitUntil {(_object animationSourcePhase "Leg_1_move_source") == _phase};

[_object, "platformCargo"] remoteExec ["sound_fnc_say3DGlobal", 0];
[_object, true] remoteExec ["enableSimulation", 0];

[_object, ["<t color='#ffa500'>" + "Platform Cargo", "[] spawn platformCargo_fnc_openGui; idAction = _this select 2","",1.5,false,false,"true","true",9]] remoteExec ["addAction", 0, true];
