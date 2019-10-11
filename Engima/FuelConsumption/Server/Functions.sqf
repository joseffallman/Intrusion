/*
kp_fuel_consumption.sqf
Author: Wyqer
Website: www.killahpotatoes.de
Date: 2017-02-02

Description:
This script handles the fuel consumption of vehicles, so that refueling will be necessary more often.

Parameters:
_this select 0 - OBJECT - Vehicle
*/

private ["_kp_neutral_consumption","_kp_normal_consumption","_kp_max_consumption"];

/*
CONFIG
*/
// Time in Minutes till a full tank depletes when the vehicle is standing with running engine (180)
_kp_neutral_consumption = 60;
// Time in Minutes till a full tank depletes when the vehicle is driving (60)
_kp_normal_consumption = 30;
// Time in Minutes till a full tank depletes when the vehicle is driving at max speed
_kp_max_consumption = 20;

/*
DO NOT EDIT BELOW
*/

while { true } do
{
	{
		if (isEngineOn _x) then {
			if (speed _x > 5) then {
				if (speed _x > (getNumber (configFile >> "CfgVehicles" >> typeOf _x >> "maxSpeed") * 0.9)) then {
					_x setFuel (fuel _x - (1 / (_kp_max_consumption * 60)));
				} else {
					_x setFuel (fuel _x - (1 / (_kp_normal_consumption * 60)));
				};
			} else {
				_x setFuel (fuel _x - (1 / (_kp_neutral_consumption * 60)));
			};
		};
	} foreach vehicles;
	
	sleep 1;
};

/*
if (isNil "kp_fuel_consumption_vehicles") then {
	kp_fuel_consumption_vehicles = [];
};

if (!((_this select 0) in kp_fuel_consumption_vehicles)) then {
	kp_fuel_consumption_vehicles pushBack (_this select 0);
	while {local (_this select 0)} do {
		if (isEngineOn (_this select 0)) then {
			if (speed (_this select 0) > 5) then {
				if (speed (_this select 0) > (getNumber (configFile >> "CfgVehicles" >> typeOf (_this select 0) >> "maxSpeed") * 0.9)) then {
					(_this select 0) setFuel (fuel (_this select 0) - (1 / (_kp_max_consumption * 60)));
				} else {
					(_this select 0) setFuel (fuel (_this select 0) - (1 / (_kp_normal_consumption * 60)));
				};
			} else {
				(_this select 0) setFuel (fuel (_this select 0) - (1 / (_kp_neutral_consumption * 60)));
			};
		};
		uiSleep 1;
	};
	kp_fuel_consumption_vehicles deleteAt (kp_fuel_consumption_vehicles find (_this select 0));
};
*/