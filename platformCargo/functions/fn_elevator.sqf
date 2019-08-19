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
[_object, idAction] remoteExec ["removeAction", 0];

_length = PLATFORM_ELEVATOR_LENGTH;
_base = (PLATFORM_POSITION select 2) - _length;
_newZPos = _base + ((_length * _position) / 100);
_objectPos = getPosATL _object;

diag_log(format ["object: %1", _object]);
diag_log(format ["base pos %1 - object pos: %2 - new pos: %3", _base, _objectPos, _newZPos]);

if ((_newZPos toFixed 1) == (_objectPos select 2) toFixed 1) exitWith {
	// Add action
	[_object, ["<t color='#ffa500'>" + "Platform Cargo", "[] spawn platformCargo_fnc_openGui; idAction = _this select 2","",1.5,false,false,"true","true",9]] remoteExec ["addAction", 0, true];
};

_step = PLATFORM_ELEVATOR_STEP;
_diff = (_objectPos select 2) - _newZPos;
if (_diff > 0) then {
	_step = -(_step);
} else {
	_diff = abs _diff;
};

[_object, false] remoteExec ["enableSimulation", 0];
[_object, "platformCargo"] remoteExec ["sound_fnc_say3DGlobal", 0];

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
		// Animation
		[_object, _position, _diff, _step] spawn platformCargo_fnc_elevatorAnimation;
	};
	case 5: {
		// Static object
		[_object, _position, _diff, _step] spawn platformCargo_fnc_elevatorStatic;
	};
	default {
		[_object, _position, _diff, _step] spawn platformCargo_fnc_elevatorPosition;
	};
};

// waituntil{(_object animationphase "elev_ext_1_rail") == 0};
// {
// 	_x animate ["elev_ext_1",0];
// } forEach _Vehs;
// _Vehs = nearestobjects [_object,["Car","Man"],9];
// sleep 0.1;
// while {(_object animationphase "elev_ext_1") < 0} do {
// 	{_x setvelocity [0,0,0.1];}foreach _Vehs;
// };

// [_object, "platformCargo"] remoteExec ["sound_fnc_say3DGlobal", 0];
// [_object, true] remoteExec ["enableSimulation", 0];

// [_object, ["<t color='#ffa500'>" + "Platform Cargo", "[] spawn platformCargo_fnc_openGui; idAction = _this select 2","",1.5,false,false,"true","true",9]] remoteExec ["addAction", 0, true];
