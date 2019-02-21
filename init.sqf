call compile preprocessFileLineNumbers "Sqx\Waypoints\Init.sqx.sqf"; // Added by Sqx.Waypoints
call compile preprocessFileLineNumbers "Sqx\UnitTest\Init.sqx.sqf"; //call Sqx_UnitTest_TestEngine_RunDelayedAsync; // Added by Sqx.UnitTest
call compile preprocessFileLineNumbers "Sqx\Markers\Init.sqx.sqf"; // Added by Sqx.Markers
execVM "init.sqx.sqf";

/*
[] spawn {
	waitUntil {!isNull findDisplay 46};
	disableSerialization;

	_ctrl = findDisplay 46 ctrlCreate ["RscStructuredText", -1];
	_ctrl ctrlSetPosition [safeZoneX, safeZoneY, safeZoneW, safeZoneH];
	_ctrl ctrlCommit 0;

	//while {true} do {
		_ctrl ctrlSetStructuredText parseText format[
			"<t color='#ff0000' align='left' size='1.4'> Score:%1</t>",
			"112233"
		];
	//};
};
*/