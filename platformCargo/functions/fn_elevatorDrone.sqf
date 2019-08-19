/**
*  fn_elevatorDrone
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

// Create drone
_uav = createVehicle ["B_UAV_01_F", [_objectPos select 0,
	_objectPos select 1,
	(_objectPos select 2) + 50], [], 0, "FLY" ];
_uav engineOn true;
createVehicleCrew _uav;
_uav allowDamage false;
_uav setdir _dir;

_wp = group _uav addWaypoint [[_objectPos select 0,
	_objectPos select 1,
	(_objectPos select 2) + 20], 0]; 
_wp setWaypointType "HOLD";
diag_log(format ["uav: %1", getPosATL _uav]);

_uavPos = getPosATL _uav;
diag_log(format ["uav: %1", getPosATL _uav]);
_uav flyInHeight (_uavPos select 2);

sleep 5;

_object attachTo [_uav];

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
	_uav flyInHeight ((_uavPos select 2) + (_i * _step));
	diag_log(format ["height: %1 - motor: %2 - tower: %3", _height, getPosATL _uav, getPosATL _object]);

	_height = _i * PLATFORM_ELEVATOR_STEP;
	_i = _i + 1;

	sleep 0.01;
};

detach _object;
deleteVehicle _uav;
deleteWaypoint _wp;

// Force position
[_object, [
	_objectPos select 0,
	_objectPos select 1,
	(_objectPos select 2) + (_i * _step)
]] remoteExec ["setPosATL", 0];

waitUntil {(_object animationSourcePhase "Leg_1_move_source") == _phase};

[_object, "platformCargo"] remoteExec ["sound_fnc_say3DGlobal", 0];
[_object, true] remoteExec ["enableSimulation", 0];

[_object, ["<t color='#ffa500'>" + "Platform Cargo", "[] spawn platformCargo_fnc_openGui; idAction = _this select 2","",1.5,false,false,"true","true",9]] remoteExec ["addAction", 0, true];
