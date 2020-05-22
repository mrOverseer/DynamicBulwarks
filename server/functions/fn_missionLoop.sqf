#include "..\..\shared\bulwark.hpp"

{
	[_x, false] remoteExec ["setUnconscious", 0];
	_X action ["CancelAction", _X];
	_X switchMove "PlayerStand";
	[ "#rev", 1, _x ] remoteExecCall ["BIS_fnc_reviveOnState", _x];
	_x setDamage 0;
} forEach allPlayers;

private _maxWaves = (BULWARK_PARAM_MAX_WAVES call shared_fnc_getCurrentParamValue);

attkWave = 0;
publicVariable "attkWave";
suicideWave = false;

waveUnits = [[],[],[]];
revivedPlayers = [];
MIND_CONTROLLED_AI = [];
wavesSinceArmour = 0;
wavesSinceCar = 0;
wavesSinceSpecial = 0;
SatUnlocks = [];
publicVariable 'SatUnlocks';

//spawn start loot
if (isServer) then {
	execVM "loot\spawnLoot.sqf";
};

sleep 15;
runMissionLoop = true;
missionFailure = false;

// start in build phase
missionNamespace setVariable ["buildPhase", true, true];

[west, RESPAWN_TICKETS] call BIS_fnc_respawnTickets;

while {runMissionLoop} do {

	//Reset the AI position checks
	AIstuckcheck = 0;
	AIStuckCheckArray = [];

	[] call bulwark_fnc_startWave;

	//
	// TODO: This is a tight loop, see if we can refactor into something
	// event driven.
	// Thought: If we can attach event handlers to when units are killed and players are killed,
	// then when any of those events fire, we can just do the check for:
	// 1. If all enemies are dead, end the wave
	// 2, If all players are down and there are no tickets left, end the game
	// otherwise wait.
	//
	while {runMissionLoop} do {

		// Get all human players in this wave cycle // moved to contain players that respawned in this wave
		_allHCs = entities "HeadlessClient_F";
		_allHPs = allPlayers - _allHCs;

		//Check if all hostiles dead
		if (EAST countSide allUnits == 0) exitWith {};

		//check if all players dead or unconscious
		_deadUnconscious = [];
		{
			if ((!alive _x) || ((lifeState _x) == "INCAPACITATED")) then {
				_deadUnconscious pushBack _x;
			};
		} foreach _allHPs;
		_respawnTickets = [west] call BIS_fnc_respawnTickets;
		if (count (_allHPs - _deadUnconscious) <= 0 && _respawnTickets <= 0) then {
			sleep 1;

			//Check that Players have not been revived
			_deadUnconscious = [];
			{
				if ((!alive _x) || ((lifeState _x) == "INCAPACITATED")) then {
					_deadUnconscious pushBack _x;
				};
			} foreach _allHPs;
			if (count (_allHPs - _deadUnconscious) <= 0 && _respawnTickets <= 0) then {
				sleep 1;
				if (count (_allHPs - _deadUnconscious) <= 0 && _respawnTickets <= 0) then {
					runMissionLoop = false;
					missionFailure = true;
					"End1" call BIS_fnc_endMissionServer;
				};
			};
		};

		// TODO: Should this be happening *constantly*, or just at the
		// start of the wave/when players join?
		//Add objects to zeus
		{
			mainZeus addCuratorEditableObjects [[_x], true];
		} foreach _allHPs;
	};

	if(missionFailure) exitWith {};

	if (attkWave == _maxWaves) exitWith {
		"End2" call BIS_fnc_endMissionServer;
	};

	[] call bulwark_fnc_endWave;

};