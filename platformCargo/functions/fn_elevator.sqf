/**
*  fn_elevator
*
*  Elevate the platform cargo.
*
*  Domain: Client
**/

_object = _this select 0;
_position = _this select 1;
_callback = _this select 2;

diag_log(format ["POSITIONS: %1", PC_START_POSITION]);

_objectInitPos = false;
{
	diag_log(format ["ID: %1", str _object splitstring ": " select 1]);
	if ((str _object splitstring ": " select 1) == _x select 0) exitWith {
		_objectInitPos = _x select 1;
	};
} forEach PC_START_POSITION;

if ("ARRAY" != typeName _objectInitPos) exitWith {
	diag_log('Platform start position NOT found!');
};

_length = PC_ELEVATOR_LENGTH;
_base = (_objectInitPos select 2) - _length;
_newZPos = _base + ((_length * _position) / 100);
_objectPos = getPosATL _object;

if ((_newZPos toFixed 1) == (_objectPos select 2) toFixed 1) exitWith {
	[_object] spawn pc_fnc_restoreActions;
};

_step = PC_ELEVATOR_STEP;
_diff = (_objectPos select 2) - _newZPos;
if (_diff > 0) then {
	_step = -(_step);
} else {
	_diff = abs _diff;
};

_extra = [_position, _diff, _step];

switch (PC_TYPE) do {
	case 2: {
		// Drone
		_object = [_object, _extra, _callback] spawn platformCargo_fnc_elevatorDrone;
	};
	case 3: {
		// Clone
		_object = [_object, _extra, _callback] spawn platformCargo_fnc_elevatorClone;
	};
	case 4: {
		// Test
		_object = [_object, _extra, _callback] spawn platformCargo_fnc_elevatorTest;
	};
	case 5: {
		// Static object
		_object = [_object, _extra, _callback] spawn platformCargo_fnc_elevatorStatic;
	};
	default {
		_object = [_object, _extra, _callback] spawn platformCargo_fnc_elevatorPosition;
	};
};
