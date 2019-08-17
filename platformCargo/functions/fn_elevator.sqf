/**
*  fn_elevator
*
*  Elevate the platform cargo.
*
*  Domain: Client
**/

_object = _this select 0;
_position = _this select 1;

// Remove action
_object removeAction idAction;

_length = 6.541;
_base = (PLATFORM_INIT_HEIGHT select 2) - _length;
_newZPos = _base + ((_length * _position) / 100);
_objectPos = getPosATL _object;

if ((_newZPos toFixed 1) == (_objectPos select 2) toFixed 1) exitWith {
	// Add action
	[_object, ["<t color='#ffa500'>" + "Platform Cargo", "[] spawn platformCargo_fnc_openGui; idAction = _this select 2","",1.5,false,false,"true","true",9]] remoteExec ["addAction", 0, true];
};

_step = 0.025;
_diff = (_objectPos select 2) - _newZPos;
if (_diff > 0) then {
	_step = -(_step);
} else {
	_diff = abs _diff;
};

// Animate legs
_phase = ((100 - _position) / 100) * _length;
_coef = _length / 8.8;
_object animateSource ['Leg_1_move_source', _phase, _coef];
_object animateSource ['Leg_2_move_source', _phase, _coef];
_object animateSource ['Leg_3_move_source', _phase, _coef];
_object animateSource ['Leg_4_move_source', _phase, _coef];

// Elevator animation
_height = 0;
_i = 1;

[_object, false] remoteExec ["enableSimulation", 0];
[_object, "platformCargo"] remoteExec ["sound_fnc_say3DGlobal", 0];

while {_height < _diff} do {
	[_object, [
		_objectPos select 0,
		_objectPos select 1,
		(_objectPos select 2) + (_i * _step)
	]] remoteExec ["setPosATL", 0];

	_height = _i * 0.025;
	_i = _i + 1;

	sleep .01;
};

[_object, "platformCargo"] remoteExec ["sound_fnc_say3DGlobal", 0];
[_object, true] remoteExec ["enableSimulation", 0];

// Add action
[_object, ["<t color='#ffa500'>" + "Platform Cargo", "[] spawn platformCargo_fnc_openGui; idAction = _this select 2","",1.5,false,false,"true","true",9]] remoteExec ["addAction", 0, true];
