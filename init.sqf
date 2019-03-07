call compile preprocessFileLineNumbers "Engima\ReviveFix\Code\Init.sqf";
call compile preprocessFileLineNumbers "Sqx\UnitTest\Init.sqx.sqf"; //call Sqx_UnitTest_TestEngine_RunDelayedAsync; // Added by Sqx.UnitTest
call compile preprocessFileLineNumbers "Sqx\Markers\Init.sqx.sqf"; // Added by Sqx.Markers
execVM "init.sqx.sqf";
