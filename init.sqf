//call compile preprocessFileLineNumbers "Engima\ReviveFix\Code\Init.sqf";
call compile preprocessFileLineNumbers "Sqx\Waypoints\Init.sqx.sqf"; // Added by Sqx.Waypoints
call compile preprocessFileLineNumbers "Sqx\UnitTest\Init.sqx.sqf"; //call Sqx_UnitTest_TestEngine_RunDelayedAsync; // Added by Sqx.UnitTest
call compile preprocessFileLineNumbers "Sqx\Markers\Init.sqx.sqf"; // Added by Sqx.Markers
call compile preprocessFileLineNumbers "Sqx\Collections\Sorter.sqx.sqf";
call compile preprocessFileLineNumbers "Sqx\UnitTest\Init.sqx.sqf"; // Added by Sqx.UnitTest
call compile preprocessFileLineNumbers "Engima\FuelConsumption\Init.sqf";

call compile preprocessFileLineNumbers "BattleLocations.sqf";

execVM "init.sqx.sqf";
