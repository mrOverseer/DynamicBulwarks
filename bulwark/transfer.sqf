/**
*  bulwark/transfer
*
*  Actor for the "Transfer points" dialog button
*
*  Domain: Client
**/

_indexPlayer = lbCurSel 2500;
_indexQuantity = lbCurSel 2501;

if (_indexPlayer == -1 || _indexQuantity == -1) exitWith {};

_players = [];
{
    if (_x != player) then {
        _players set [(count _players), _x];
    }
} forEach allPlayers;

_player = _players select _indexPlayer;
_quantity = BULWARK_TRANSFERPOINT select _indexQuantity;

if (player getVariable "killPoints" >= _quantity) then {
    [player, _quantity] remoteExec ["killPoints_fnc_spend", 2];
    [_player, _quantity] remoteExec ["killPoints_fnc_add", 2];
    transferComplete = true;
} else {
    [format ["<t size='0.6' color='#ff3300'>Not enough points for %1!</t>", _quantity], -0, -0.02, 2, 0.1] call BIS_fnc_dynamicText;
    transferComplete = false;
};

sleep 0.1;

if (transferComplete) then {
    closeDialog 0;
    [_player, "pointsLootSound"] remoteExec ["sound_fnc_say3DGlobal", 0];
    [format ["<t size='0.6' color='#00ff00'>Transfer %1 points to %2</t>", _quantity, name _player], -0, -0.02, 5, 0.1] call BIS_fnc_dynamicText;
	[format ["<t size='0.6' color='#00ff00'>%1 points received from %2</t>", _quantity, name player], -0, -0.02, 5, 0.1] remoteExec ["BIS_fnc_dynamicText", _player];
};
