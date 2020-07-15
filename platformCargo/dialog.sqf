/**
*  restoreActions
*
*  Event handler for dialog.
*
*  Domain: Client
**/

_mode = _this param [0,"",[""]];
if (_mode isEqualTo "") exitWith {false};

_object = platform; // From fn_openGui

pc_fnc_restoreActions = {
	private "_object";
	_object = _this select 0;
	{
		_x resize 9;
		[_object, _x] remoteExec ['addAction', 0, true];
	} forEach dialogActions;
};

switch (toLower _mode) do {
	case "onload" : {
		_params = _this param [1,[],[[]]];
		_display = _params select 0;
		
		// Save and remove actions
		dialogActions = [];
		{
			dialogActions pushBack (_object actionParams _x);
		} forEach actionIDs _object;
		[_object] remoteExec ["removeAllActions", 0];
		diag_log(format ["ACTIONS: %1", dialogActions]);
	};
	
	// case "example" : {
	// 	_params = _this param [1,[],[[]]];
	// 	_control = _params select 0;
	// 	_selection = _params select 1;
	// };
	// You can define other cases

	case "elevator" : {
		_value = _this param [2,0,[0]];

		closeDialog 0;
		[_object, _value, "[_this select 0] spawn pc_fnc_restoreActions"] spawn platformCargo_fnc_elevator;
	};

	// Always include a default case
	default {};
};

true; // returns true