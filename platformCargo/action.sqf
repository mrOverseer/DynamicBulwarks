/**
*  action
*
*  Actor for the "Platform Cargo" dialog button
*
*  Domain: Client
**/

_action = _this select 0;
_value = _this select 1;
_extra = _this select 2;
_object = PLATFORM_CARGO;

switch (_action) do {
	case "elevator": {
		[_object, _value] spawn platformCargo_fnc_elevator;
	};
	case "toggle": {
		[_object, _value, _extra] spawn platformCargo_fnc_togglePanel;
	};
	case "rotate": {
		[_object, _value, _extra] spawn platformCargo_fnc_rotatePanel;
	};
	default { };
};

closeDialog 0;
