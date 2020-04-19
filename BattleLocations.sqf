/*
 * Here are all battle locations of the current map specified.
 *
 * To add a battle location, extend the array below.
 *
 * An item in the list below contains the name of the battle location, the positions and directions of base markers, and positions and types
 * of all resource locations.
 *
 * Note that the indexes of this list applies to the values[] part of the mission parameter BattleLocation in the file MissionParameters.ext.
 * The first item in the battle location list below has index 0, the second index 1 and so forth.
 */

Intrusion_BattleLocations = [
	[
		"Chapoi",
		[
			["RespawnMarkerWest", [3870.84,4661.16,0], 130],
			["WeaponsMarkerWest", [3886.11,4651.13,0], 83],
			["VehicleMarkerWest", [3899.94,4625.63,0], 85],
			["RespawnMarkerEast", [6972.3,3911.41,0], 178],
			["VehicleMarkerEast", [6971.71,3897.88,0], 126],
			["VehicleMarkerEast", [7010.81,3872.72,0], 172]
		],
		[
			["Production Lane (Factory)", "FACTORY", [6195.21,3164.14,0]],
			["La Riviére Harbor (Factory)", "FACTORY", [3617.58,3226.12,0]],
			["Cancon Harbor (Factory)", "FACTORY", [5785.93,2411,0]],
			["Cancon Office (Office)", "OFFICE", [5399.21,2977.31,0]],
			["The Cabin (Office)", "OFFICE", [4342.72,3572.53,0]],
			["Farmer's Ranch (Office)", "OFFICE", [5380.77,3685.97,0]]
		]
	],
    [
        "Military Island",
        [
	        ["RespawnMarkerWest", [11844.7,4651.78,0], 151],
	        ["WeaponsMarkerWest", [11838.2,4652.83,0], 190],
	        ["VehicleMarkerWest", [11876.5,4640.84,0], 182],
	        ["RespawnMarkerEast", [9472.24,3311.34,0], 271],
	        ["VehicleMarkerEast", [9473.48,3300.9,0], 87],
	        ["VehicleMarkerEast", [9493.38,3290.04,0], 3]
	    ],
    	[
	        ["Production Lane (Factory)", "FACTORY", [11611.8,4443.48,0]],
	        ["Engineering Room (Factory)", "FACTORY", [10587.9,4363.85,0]],
	        ["Harbor (Factory)", "FACTORY", [9349.94,3827.27,0]],
	        ["The Mast (Office)", "OFFICE", [11322.6,4132.99,0]],
	        ["Training Camp (Office)", "OFFICE", [10521.1,4048.53,0]],
	        ["Military Base (Office)", "OFFICE", [9779.7,3919.16,0]]
	    ]
    ]
];
