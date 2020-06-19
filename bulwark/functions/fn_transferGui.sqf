/**
*  fn_transferGui
*
*  Displays GUI for transfer points between players.
*
*  Domain: Client
**/

disableSerialization;

createDialog "transferBox_Dialog";
waitUntil {!isNull (findDisplay 8888);};

_ctrl = (findDisplay 8888) displayCtrl 2500;
{
    if (_x != player) then {
        _ctrl lbAdd format ["%1", name _x];
    }
} forEach allPlayers;

_ctrl = (findDisplay 8888) displayCtrl 2501;
{
    _ctrl lbAdd format ["%1", _x];
} forEach BULWARK_TRANSFERPOINT;
