/**
*  fn_elevator
*
*  Elevate the platform cargo.
*
*  Domain: Client
**/

_object = _this select 0;
_position = _this select 1;

diag_log(format ["POSITIONS: %1", PLATFORM_ELEVATOR_START_POSITION]);

_objectInitPos = false;
{
	diag_log(format ["ID: %1", str _object splitstring ": " select 1]);
	if ((str _object splitstring ": " select 1) == _x select 0) exitWith {
		_objectInitPos = _x select 1;
	};
} forEach PLATFORM_ELEVATOR_START_POSITION;

if ("ARRAY" != typeName _objectInitPos) exitWith {
	diag_log('Platform start position NOT found!');
};

_length = PLATFORM_ELEVATOR_LENGTH;
_base = (_objectInitPos select 2) - _length;
_newZPos = _base + ((_length * _position) / 100);
_objectPos = getPosATL _object;

if ((_newZPos toFixed 1) == (_objectPos select 2) toFixed 1) exitWith {};

// Remove actions
[_object] remoteExec ["removeAllActions", 0];

_step = PLATFORM_ELEVATOR_STEP;
_diff = (_objectPos select 2) - _newZPos;
if (_diff > 0) then {
	_step = -(_step);
} else {
	_diff = abs _diff;
};

switch (PLATFORM_ELEVATOR_TYPE) do {
	case 2: {
		// Drone
		[_object, _position, _diff, _step] spawn platformCargo_fnc_elevatorDrone;
	};
	case 3: {
		// Clone
		[_object, _position, _diff, _step] spawn platformCargo_fnc_elevatorClone;
	};
	case 4: {
		// Test
		[_object, _position, _diff, _step] spawn platformCargo_fnc_elevatorTest;
	};
	case 5: {
		// Static object
		[_object, _position, _diff, _step] spawn platformCargo_fnc_elevatorStatic;
	};
	default {
		[_object, _position, _diff, _step] spawn platformCargo_fnc_elevatorPosition;
	};
};

