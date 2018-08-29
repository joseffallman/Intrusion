// Mission constants

// Basic Weapons West
dre_arr_CC_BasicWeaponsWest = [
    ["arifle_MX_F", ["30Rnd_65x39_caseless_mag"]],
    ["arifle_MX_GL_F", ["30Rnd_65x39_caseless_mag"]],
    ["arifle_MX_SW_F", ["30Rnd_65x39_caseless_mag"]],
    ["arifle_MXC_F", ["30Rnd_65x39_caseless_mag"]],
    ["hgun_P07_F", ["16Rnd_9x21_Mag"]]
];

// Basic Weapons East
dre_arr_CC_BasicWeaponsEast = [
    ["arifle_Katiba_F", ["30Rnd_65x39_caseless_green"]],
    ["arifle_Katiba_C_F", ["30Rnd_65x39_caseless_green"]],
    ["arifle_Katiba_GL_F", ["30Rnd_65x39_caseless_green"]],
    ["LMG_Zafir_F", ["150Rnd_762x54_Box"]],
    ["hgun_Rook40_F", ["16Rnd_9x21_Mag"]]
];

// Grenades West
dre_arr_CC_GrenadesWest = ["HandGrenade", "SmokeShell", "SmokeShellRed", "SmokeShellGreen", "SmokeShellBlue", "1Rnd_HE_Grenade_shell", "1Rnd_Smoke_Grenade_shell", "1Rnd_SmokeRed_Grenade_shell", "1Rnd_SmokeGreen_Grenade_shell", "1Rnd_SmokeBlue_Grenade_shell"];

// Grenades East
dre_arr_CC_GrenadesEast = ["HandGrenade", "SmokeShell", "SmokeShellRed", "SmokeShellGreen", "SmokeShellBlue", "1Rnd_HE_Grenade_shell", "1Rnd_Smoke_Grenade_shell", "1Rnd_SmokeRed_Grenade_shell", "1Rnd_SmokeGreen_Grenade_shell", "1Rnd_SmokeBlue_Grenade_shell"];

// Basic AT Launcher West
dre_arr_CC_BasicATLaunchersWest = [
    ["launch_NLAW_F", ["NLAW_F"]]
];

// Basic AT Launcher East
dre_arr_CC_BasicATLaunchersEast = [
    ["launch_RPG32_F", ["RPG32_F"]]
];


// Initialization

dre_loc_CC_BasicWeaponBoxWest = objNull;
dre_loc_CC_BasicWeaponBoxEast = objNull;
dre_loc_CC_GrenadesBoxWest = objNull;
dre_loc_CC_GrenadesBoxEast = objNull;
dre_loc_CC_LaunchersBoxWest = objNull;
dre_loc_CC_LaunchersBoxEast = objNull;
dre_loc_allWeaponBoxesWest = [];
dre_loc_allWeaponBoxesEast = [];

// Ammo box west

// Ammo box east


// Ammo box refill thread for west and east

[] spawn {
	while {true} do {
		private ["_box", "_weapon", "_magazines", "_boxAlive"];
		
		// Check that boxes still remains
		
		// West - Basic weapons
		_boxAlive = alive dre_loc_CC_BasicWeaponBoxWest;
		if (count dre_loc_allWeaponBoxesWest <= 0 || !_boxAlive) then {
			dre_loc_CC_BasicWeaponBoxWest = "Box_NATO_Wps_F" createVehicle getMarkerPos "CC_WeaponDepotMarkerWest";
			_box = dre_loc_CC_BasicWeaponBoxWest;
			dre_loc_allWeaponBoxesWest set [0, _box];
			clearWeaponCargoGlobal _box;
			clearMagazineCargoGlobal _box;
		};
		// West - Grenades
		_boxAlive = alive dre_loc_CC_GrenadesBoxWest;
		if (count dre_loc_allWeaponBoxesWest <= 1 || !_boxAlive) then {
			dre_loc_CC_GrenadesBoxWest = "Box_NATO_Grenades_F" createVehicle getMarkerPos "CC_WeaponDepotMarkerWest";
			_box = dre_loc_CC_GrenadesBoxWest;
			dre_loc_allWeaponBoxesWest set [1, _box];
			clearMagazineCargoGlobal _box;
		};
		// West - Launchers
		_boxAlive = alive dre_loc_CC_LaunchersBoxWest;
		if (dre_loc_var_WestInventedAT && !_boxAlive) then {
            dre_loc_CC_LaunchersBoxWest = "Box_NATO_WpsLaunch_F" createVehicle getMarkerPos "CC_WeaponDepotMarkerWest";
            _box = dre_loc_CC_LaunchersBoxWest;
			dre_loc_allWeaponBoxesWest set [2, _box];
            clearWeaponCargoGlobal _box;
            clearMagazineCargoGlobal _box;
            clearBackpackCargoGlobal _box;
		};

		// East - Basic weapons
		_boxAlive = alive dre_loc_CC_BasicWeaponBoxEast;
		if (count dre_loc_allWeaponBoxesEast <= 0 || !_boxAlive) then {
			dre_loc_CC_BasicWeaponBoxEast = "Box_East_Wps_F" createVehicle getMarkerPos "CC_WeaponDepotMarkerEast";
			_box = dre_loc_CC_BasicWeaponBoxEast;
			dre_loc_allWeaponBoxesEast set [0, _box];
			clearWeaponCargoGlobal _box;
			clearMagazineCargoGlobal _box;
		};
		// East - Grenades
		_boxAlive = alive dre_loc_CC_GrenadesBoxEast;
		if (count dre_loc_allWeaponBoxesEast <= 1 || !_boxAlive) then {
			dre_loc_CC_GrenadesBoxEast = "Box_East_Grenades_F" createVehicle getMarkerPos "CC_WeaponDepotMarkerEast";
			_box = dre_loc_CC_GrenadesBoxEast;
			dre_loc_allWeaponBoxesEast set [1, _box];
			clearMagazineCargoGlobal _box;
		};
		// East - Launchers
		_boxAlive = alive dre_loc_CC_LaunchersBoxEast;
		if (dre_loc_var_EastInventedAT && !_boxAlive) then {
            dre_loc_CC_LaunchersBoxEast = "Box_East_WpsLaunch_F" createVehicle getMarkerPos "CC_WeaponDepotMarkerEast";
            _box = dre_loc_CC_LaunchersBoxEast;
			dre_loc_allWeaponBoxesEast set [2, _box];
            clearWeaponCargoGlobal _box;
            clearMagazineCargoGlobal _box;
            clearBackpackCargoGlobal _box;
		};
		
		_box = dre_loc_CC_BasicWeaponBoxWest;
		{
			_weapon = _x select 0;
			_magazines = _x select 1;
			
			_box addWeaponCargoGlobal [_weapon, 30];
			_box addWeaponCargoGlobal ["FirstAidKit", 10];
			
			{
				_box addMagazineCargoGlobal [_x, 300];
			} foreach _magazines;
		} foreach dre_arr_CC_BasicWeaponsWest;
		
		_box = dre_loc_CC_GrenadesBoxWest;
		{
			_box addMagazineCargoGlobal [_x, 300];
		} foreach dre_arr_CC_GrenadesWest;
		
		if (dre_loc_var_WestInventedAT) then {
			_box = dre_loc_CC_LaunchersBoxWest;
			{
				_weapon = _x select 0;
				_magazines = _x select 1;
				
				_box addWeaponCargoGlobal [_weapon, 100];
				
				{
					_box addMagazineCargoGlobal [_x, 500];
				} foreach _magazines;
			} foreach dre_arr_CC_BasicATLaunchersWest;
		};

		// East
		
		_box = dre_loc_CC_BasicWeaponBoxEast;
		{
			_weapon = _x select 0;
			_magazines = _x select 1;
			
			_box addWeaponCargoGlobal [_weapon, 30];
			_box addWeaponCargoGlobal ["FirstAidKit", 10];
			
			{
				_box addMagazineCargoGlobal [_x, 300];
			} foreach _magazines;
		} foreach dre_arr_CC_BasicWeaponsEast;
		
		_box = dre_loc_CC_GrenadesBoxEast;
		{
			_box addMagazineCargoGlobal [_x, 300];    
		} foreach dre_arr_CC_GrenadesEast;
		
		if (dre_loc_var_EastInventedAT) then {
			_box = dre_loc_CC_LaunchersBoxEast;
			{
				_weapon = _x select 0;
				_magazines = _x select 1;
				
				_box addWeaponCargoGlobal [_weapon, 100];
				
				{
					_box addMagazineCargoGlobal [_x, 500];
				} foreach _magazines;
			} foreach dre_arr_CC_BasicATLaunchersEast;
		};
		
		sleep 20;
	};
};

