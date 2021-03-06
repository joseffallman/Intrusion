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
	        ["Power Station (Factory)", "FACTORY", [10587.9,4363.85,0]],
	        ["Harbor (Factory)", "FACTORY", [9349.94,3827.27,0]],
	        ["The Mast (Office)", "OFFICE", [11322.6,4132.99,0]],
	        ["Training Camp (Office)", "OFFICE", [10521.1,4048.53,0]],
	        ["Military Base (Office)", "OFFICE", [9779.7,3919.16,0]]
	    ]
    ],
    [
        "Southern Harbors",
        [
            ["RespawnMarkerWest", [7569.01,6660.63,0], 61],
            ["WeaponsMarkerWest", [7576.67,6661.99,0], 317],
            ["VehicleMarkerWest", [7636.35,6679.25,0], 290],
            ["RespawnMarkerEast", [6718.98,3230.26,0], 31],
            ["VehicleMarkerEast", [6739.48,3255.97,0], 356],
            ["VehicleMarkerEast", [6741.97,3289.75,0], 127]
        ],
        [
            ["Le Port East Harbor (Factory)", "FACTORY", [8400.92,3740.41,0]],
            ["Creative Valley (Factory)", "FACTORY", [6761.3,5390.87,0]],
            ["Tim's Hardware (Factory)", "FACTORY", [5952.4,3438.13,0]],
            ["Le Port West Harbor (Factory)", "FACTORY", [7818.3,3248.7,0]],
            ["Lighthouse (Office)", "OFFICE", [8287.71,6050.43,0]],
            ["Com Center (Office)", "OFFICE", [7391.75,4133.73,0]],
            ["Chief's Residence (Office)", "OFFICE", [6574.68,6049.62,0]]
        ]
    ],
    [
        "La Trinité",
        [
            ["RespawnMarkerWest", [7594.44,9342.66,0], 10],
            ["WeaponsMarkerWest", [7594.13,9333.16,0], 348],
            ["VehicleMarkerWest", [7554.41,9354.52,0], 182],
            ["RespawnMarkerEast", [7122.31,6703.81,0], 279],
            ["VehicleMarkerEast", [7120.08,6718.19,0], 349],
            ["VehicleMarkerEast", [7143.46,6666.85,0], 355]
        ],
        [
            ["Saint Louis (Factory)", "FACTORY", [7214.71,9003.71,0]],
            ["Super Market (Factory)", "FACTORY", [7279.94,7851.56,0]],
            ["Power Plant (Factory)", "FACTORY", [6991.09,7844.47,0]],
            ["Dourdan (Office)", "OFFICE", [7016.98,7122.17,0]],
            ["The Chapel (Office)", "OFFICE", [7229,8042.47,0]],
            ["Engineering Room (Office)", "OFFICE", [7424.74,8113.81,0]]
        ]
    ]
];
