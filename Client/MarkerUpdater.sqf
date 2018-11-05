private ["_enemyMarkerColor", "_vehicleMarkers", "_currentSpecialization", "_friendlyMarkerColor", "_friendlyBaseMarker", "_myPosMarker"];
private ["_fnc_GetPercievedPosAndAccuracy", "_fnc_UpdateVehicleMarkers"];

_groupMarkers = []; // def: [leader, marker]
_vehicleMarkers = []; // def: [vehicle, marker]
_oldLeaders = [];
_enemyGroupMarkers = [];
_oldEnemyLeaders = [];

_friendlySide = east;
_enemySide = west;
_friendlyRespawnMarker = "respawn_east";
if (playerSide == west) then {
	_friendlySide = west;
    _enemySide = east;
	_friendlyRespawnMarker = "respawn_west";
};
_friendlyMarkerColor = "ColorBLUFOR";
_enemyMarkerColor = "ColorOPFOR";

_fnc_GetPercievedPosAndAccuracy = { 
    params ["_enemyUnits", "_enemyUnit"];
    private ["_result"];
	
	_result = [[0, 0, 0], 0];
    
    {
        private ["_unit", "_percievedPos", "_accuracy"];
        
        _unit = _x select 0;
        _percievedPos = _x select 1;
        _accuracy = _x select 2;
        
        if (_unit == _enemyUnit) exitWith {
            _result = [_percievedPos, _accuracy];
        };
    } foreach _enemyUnits;
    
    _result
};

_fnc_UpdateVehicleMarkers = {
    params ["_vehicleMarkers", "_specialization"];
    private ["_newVehicleMarkers", "_vehicles", "_vehicle", "_marker", "_side", "_needSupport", "_ownerGroup", "_ourVehicle"];
    
    _newVehicleMarkers = [];
    _vehicles = [];
    
    // Update existing vehicles
    {
        _vehicle = _x select 0;
        _marker = _x select 1;
        _ourVehicle = _x select 2;
        
        _needSupport = false;
        if (_specialization == "FUEL" && fuel _vehicle < 0.25) then {
            _needSupport = true;
        };

        if (_specialization == "AMMO" && !someAmmo _vehicle && ((typeOf _vehicle) in (dre_arr_WestArmedVehicles + dre_arr_EastArmedVehicles))) then {
            _needSupport = true;
        };
        if (_specialization == "REPAIR" && damage _vehicle > 0.025) then {
            _needSupport = true;
        };
        
        if (alive _vehicle && (_needSupport || _ourVehicle)) then {
            _marker setMarkerPosLocal getPos _vehicle;
            _vehicles set [count _vehicles, _vehicle];
            _newVehicleMarkers set [count _newVehicleMarkers, [_vehicle, _marker, _ourVehicle]];
        }
        else {
            deleteMarkerLocal _marker;
        };
    } foreach _vehicleMarkers;
    
    // Add new vehicles
    {
        _vehicle = _x select 0;
        _side = _x select 1;
        
        _needSupport = false;
        if (_specialization == "FUEL" && fuel _vehicle < 0.25) then {
            _needSupport = true;
        };
        if (_specialization == "AMMO" && !someAmmo _vehicle && ((typeOf _vehicle) in (dre_arr_WestArmedVehicles + dre_arr_EastArmedVehicles))) then {
            _needSupport = true;
        };
        if (_specialization == "REPAIR" && damage _vehicle > 0.025) then {
            _needSupport = true;
        };
        
        _ownerGroup = _vehicle getVariable ["dre_vehicleOwner", grpNull];
        //_specialization = _vehicle getVariable ["dre_specialization", "INFANTRY"];
        
        _ourVehicle = false;
        if (!isNull _ownerGroup) then {
            if (_ownerGroup == group player) then {
                _ourVehicle = true;
            };
        };
        
        if (_side == playerSide && alive _vehicle && _needSupport && !(_vehicle in _vehicles)) then {
            _marker = createMarkerLocal [vehicleVarName _vehicle + "VehicleMarker", getPos _vehicle];
            _marker setMarkerShapeLocal "ICON";
            _marker setMarkerTypeLocal "mil_dot";
            _marker setMarkerTextLocal ("!");
            _marker setMarkerColorLocal "ColorOrange";
            _newVehicleMarkers set [count _newVehicleMarkers, [_vehicle, _marker, _ourVehicle]];
        };
        
        if (_ourVehicle && !(_vehicle in _vehicles)) then {
            _marker = createMarkerLocal [vehicleVarName _vehicle + "VehicleMarker", getPos _vehicle];
            _marker setMarkerShapeLocal "ICON";
            _marker setMarkerTypeLocal "mil_dot";
            _marker setMarkerColorLocal "ColorBlue";
            _newVehicleMarkers set [count _newVehicleMarkers, [_vehicle, _marker, _ourVehicle]];
        };
    } foreach dre_arr_CC_allSpawnedVehicles;
    
    _newVehicleMarkers
};

//_fnc_DeleteAllVehicleMarkers = {
//    private ["_vehicleMarkers"];
//    
//    _vehicleMarkers = _this select 0;
//    
//    {
//        deleteMarkerLocal (_x select 1);
//    } foreach _vehicleMarkers;
//};

// Set friendly base
_friendlyBaseMarker = "dre_friendlyBaseMarker";
createMarkerLocal [_friendlyBaseMarker, getMarkerPos _friendlyRespawnMarker];
_friendlyBaseMarker setMarkerColorLocal _friendlyMarkerColor;
_friendlyBaseMarker setMarkerShapeLocal "ICON";
_friendlyBaseMarker setMarkerTypeLocal "b_hq";

// Set my position
_myPosMarker = "dre_myPosMarker";
createMarkerLocal [_myPosMarker, getMarkerPos _friendlyRespawnMarker];
_myPosMarker setMarkerColorLocal _friendlyMarkerColor;
_myPosMarker setMarkerShapeLocal "ICON";
_myPosMarker setMarkerTypeLocal "mil_dot";
_myPosMarker setMarkerTextLocal "Me";

while {true} do {
	// My position
	if (player != leader group player) then {
		_myPosMarker setMarkerTypeLocal "mil_dot";
		_myPosMarker setMarkerPosLocal getPos player;
	}
	else {
		_myPosMarker setMarkerTypeLocal "Empty";
	};

	// Friendly base
	if (!([getMarkerPos _friendlyBaseMarker, getMarkerPos _friendlyRespawnMarker] call BIS_fnc_areEqual)) then {
		_friendlyBaseMarker setMarkerPosLocal getMarkerPos _friendlyRespawnMarker;
	};

    _leaders = [];
    _enemyLeaders = [];
    _currentSpecialization = [group player, "INFANTRY"] call dre_fnc_CC_GetSpecializationByGroup;
    
    // Get all group leaders on same side
    {
        _leader = leader _x;
        if (alive _leader && (side group _leader == playerSide)) then {
            _leaders set [count _leaders, _leader];
        };
    } foreach allGroups;
    
    // Remove all group markers with no leader and update existing
    _tempGroupMarkers = [];
    {
        private ["_leader", "_marker", "_markerType"];
        
        _leader = _x select 0;
        _marker = _x select 1;
        
        if (_leader in _leaders) then {
            _tempGroupMarkers set [count _tempGroupMarkers, [_leader, _marker]];
            
            // Adjust the marker if unit has got into a vehicle or something (figure out what type he/she is)
            _markerType = [group _leader, true] call dre_fnc_CC_GetMarkerTypeForGroup;
            _marker setMarkerTypeLocal _markerType;
            _marker setMarkerPosLocal getPos _leader;
            _marker setMarkerTextLocal (name _leader + " (" + str count units group _leader + ")");
        }
        else {
            // Remove marker
            deleteMarkerLocal _marker;
        };
        
    } foreach _groupMarkers;
    
    _groupMarkers = _tempGroupMarkers;
    
    // Add markers for new leaders
    {
        private ["_marker"];
        
        if (!(_x in _oldLeaders) && alive _x) then {
            private ["_markerType"];
            
            _markerType = [group _x, true] call dre_fnc_CC_GetMarkerTypeForGroup;
            
            _marker = createMarkerLocal [vehicleVarName _x, getPos _x];
            _marker setMarkerShapeLocal "ICON";
            _marker setMarkerTypeLocal _markerType;
            _marker setMarkerTextLocal (name _x + " (" + str count units group _x + ")");
            _marker setMarkerColorLocal (if (side _x == _enemySide) then { _enemyMarkerColor } else { _friendlyMarkerColor });
            
            _groupMarkers set [count _groupMarkers, [_x, _marker]];
        };
    } foreach _leaders;
    
    // Enemies
    
    private ["_enemyGroups", "_enemyUnits"];
    _enemyUnits = [];
    _enemyGroups = [];
    
    {
        private ["_leader", "_targets"];
        _leader = _x;
        
        _targets = _leader nearTargets 4000;
        
        {
            private ["_percievedPos", "_side", "_target", "_accuracy"];
            _percievedPos = _x select 0;
            _side = _x select 2;
            _target = _x select 4;
            _accuracy = _x select 5;

            if (_side == _enemySide && _accuracy < 25) then {
                _enemyUnits set [count _enemyUnits, [_target, _percievedPos, _accuracy]];
                
                if (!(group _target in _enemyGroups)) then {
                    _enemyGroups set [count _enemyGroups, group _target];
                };
            };
        } foreach _targets;
    } foreach _leaders;
    
    // Now we have a list with enemy groups and another for units
    // Make a list with possible enemy leaders (you don't know exactly who is the leader)
    
    {
        private ["_enemyGroup"];
        _enemyGroup = _x;
        
        {
            private ["_unit"];
            _unit = _x select 0;
            
            if (group _unit == _enemyGroup) exitWith {
                _enemyLeaders set [count _enemyLeaders, _unit];
            };
        } foreach _enemyUnits;
    } foreach _enemyGroups;

    // Now we have a list with possible enemy leaders

    // Remove all enemy group markers with no leader and update existing
    _tempEnemyMarkers = [];
    {
        private ["_enemyLeader", "_marker", "_markerType", "_percievedPos", "_accuracy", "_percievedPosAndAccuracy"];
        
        _enemyLeader = _x select 0;
        _marker = _x select 1;
        
        if (_enemyLeader in _enemyLeaders) then {
            _tempEnemyMarkers set [count _tempEnemyMarkers, [_enemyLeader, _marker]];
            
			_percievedPosAndAccuracy = ([_enemyUnits, _enemyLeader] call _fnc_GetPercievedPosAndAccuracy);
			_percievedPos = _percievedPosAndAccuracy select 0;
			_accuracy = _percievedPosAndAccuracy select 1;

            // Adjust the marker if unit has got into a vehicle or something (figure out what type he/she is)
            _markerType =  [group _enemyLeader, false] call dre_fnc_CC_GetMarkerTypeForGroup;
            _marker setMarkerTypeLocal _markerType;
            _marker setMarkerPosLocal _percievedPos;
            _marker setMarkerColorLocal ( if (_accuracy > 8) then { "ColorGrey" } else { _enemyMarkerColor } );
        }
        else {
            // Remove marker
            deleteMarkerLocal _marker;
        };        
    } foreach _enemyGroupMarkers;
    
    _enemyGroupMarkers = _tempEnemyMarkers;

    // Add markers for new enemies
    {
        private ["_marker", "_percievedPosAndAccuracy"];

        if (!(_x in _oldEnemyLeaders) && alive _x) then {
            private ["_markerType", "_percievedPos", "_accuracy"];
            
            //_markerType = [group _x, false] call dre_fnc_CC_GetMarkerTypeForGroup;

			_percievedPosAndAccuracy = ([_enemyUnits, _x] call _fnc_GetPercievedPosAndAccuracy);
			_percievedPos = _percievedPosAndAccuracy select 0;
			_accuracy = _percievedPosAndAccuracy select 1;

            // Adjust the marker if unit has got into a vehicle or something (figure out what type he/she is)
            _markerType =  [group _x, false] call dre_fnc_CC_GetMarkerTypeForGroup;
			
            _marker = createMarkerLocal [vehicleVarName _x, _percievedPos];
            _marker setMarkerShapeLocal "ICON";
            _marker setMarkerTypeLocal _markerType;
            _marker setMarkerColorLocal ( if (_accuracy > 8) then { "ColorGrey" } else { _enemyMarkerColor } );
            
            _enemyGroupMarkers set [count _enemyGroupMarkers, [_x, _marker]];
        };
    } foreach _enemyLeaders;
    
    _oldLeaders = _leaders;
    _oldEnemyLeaders = _enemyLeaders;
    
    // Vehicles that need refuel
    _vehicleMarkers = [_vehicleMarkers, _currentSpecialization] call _fnc_UpdateVehicleMarkers;
    
    sleep 1;
};
