--SENSOR TYPE
local SENSOR_OPTICAL = 0
local SENSOR_RADAR = 1
local SENSOR_IRST = 2
local SENSOR_RWR = 3
--RADAR
local RADAR_AS = 0
local RADAR_SS = 1
local RADAR_MULTIROLE = 2
--
local ASPECT_HEAD_ON = 0
local ASPECT_TAIL_ON = 1
--
local HEMISPHERE_UPPER = 0
local HEMISPHERE_LOWER = 1
--IRST
local ENGINE_MODE_FORSAGE = 0
local ENGINE_MODE_MAXIMAL = 1
local ENGINE_MODE_MINIMAL = 2
--OPTIC
local OPTIC_SENSOR_TV = 0
local OPTIC_SENSOR_LLTV = 1
local OPTIC_SENSOR_IR = 2

-- Buk-M1-2 SENSORS

CHAIR_BACK = 
		{
			Name = "SA-17 Buk TR",
			category = SENSOR_RADAR,
			type = RADAR_AS,
            scan_volume =
            {
                azimuth = {-180.0, 180.0},
                elevation = {-15.0, 60.0}
            },
            max_measuring_distance = 120000.0,
            detection_distance =
            {
                [HEMISPHERE_UPPER] =
                {
                    [ASPECT_HEAD_ON] = 120000.0,
                    [ASPECT_TAIL_ON] = 120000.0
                },
                [HEMISPHERE_LOWER] =
                {
                    [ASPECT_HEAD_ON] = 120000.0,
                    [ASPECT_TAIL_ON] = 120000.0
                }
            },
            lock_on_distance_coeff = 0.5,
            velocity_limits =
            {
                radial_velocity_min = 10,
            },
            scan_period = 1.0,
		}
		
declare_sensor(CHAIR_BACK)


-- S-300V SENSORS

GRILL_PAN =
        {
			Name = "S-300V 9S32 tr",
			category = SENSOR_RADAR,
            type = RADAR_AS,
             scan_volume = 
		    {
			    azimuth = {-180.0, 180.0},
                elevation = {-15.0, 80.0}
		    },
		    max_measuring_distance = 240000,
		    detection_distance = 
		    {
			    [HEMISPHERE_UPPER] =
			    {
			    	[ASPECT_HEAD_ON] = 150000.0,
			    	[ASPECT_TAIL_ON] = 150000.0
			    },
			    [HEMISPHERE_LOWER] =
			    {
			    	[ASPECT_HEAD_ON] = 150000.0,
			    	[ASPECT_TAIL_ON] = 150000.0
			    }
		    },
		    lock_on_distance_coeff =0.8,
			multiple_targets_tracking = true,
            velocity_limits =
            {
                radial_velocity_min = 10.0,
            },
            scan_period = 1.0,
        }

declare_sensor(GRILL_PAN)

HIGH_SCREEN =
        {
			Name = "S-300V 9S19 sr",
			category = SENSOR_RADAR,
            type = RADAR_AS,
            scan_volume =
            {
                azimuth = {-180.0, 180.0},
                elevation = {-15.0, 70.0}
            },
            max_measuring_distance = 280000.0,
            detection_distance =
            {
                [HEMISPHERE_UPPER] =
                {
                    [ASPECT_HEAD_ON] = 175000.0,
                    [ASPECT_TAIL_ON] = 175000.0
                },
                [HEMISPHERE_LOWER] =
                {
                    [ASPECT_HEAD_ON] = 175000.0,
                    [ASPECT_TAIL_ON] = 175000.0
                }
            },
            lock_on_distance_coeff = 0.8,
			multiple_targets_tracking = true,
            velocity_limits =
            {
                radial_velocity_min = 10.0,
            },
            scan_period = 1.0,
        }

declare_sensor(HIGH_SCREEN)

BILL_BOARD =
        {
			Name = "S-300V 9S15 sr",
			category = SENSOR_RADAR,
            type = RADAR_AS,
            scan_volume =
            {
                azimuth = {-180.0, 180.0},
                elevation = {-15.0, 75.0}
            },
            max_measuring_distance = 385000.0,
            detection_distance =
            {
                [HEMISPHERE_UPPER] =
                {
                    [ASPECT_HEAD_ON] = 240000.0,
                    [ASPECT_TAIL_ON] = 240000.0
                },
                [HEMISPHERE_LOWER] =
                {
                    [ASPECT_HEAD_ON] = 240000.0,
                    [ASPECT_TAIL_ON] = 240000.0
                }
            },
            lock_on_distance_coeff = 0.8,
			multiple_targets_tracking = true,
            velocity_limits =
            {
                radial_velocity_min = 10.0,
            },
            scan_period = 1.0,
        }

declare_sensor(BILL_BOARD)


-- S-300VM SENSORS

GRILL_PAN_M =
        {
			Name = "S-300VM 9S32ME tr",
			category = SENSOR_RADAR,
            type = RADAR_AS,
             scan_volume = 
		    {
			    azimuth = {-180.0, 180.0},
                elevation = {-15.0, 80.0}
		    },
		    max_measuring_distance = 370000,
		    detection_distance = 
		    {
			    [HEMISPHERE_UPPER] =
			    {
			    	[ASPECT_HEAD_ON] = 230000.0,
			    	[ASPECT_TAIL_ON] = 230000.0
			    },
			    [HEMISPHERE_LOWER] =
			    {
			    	[ASPECT_HEAD_ON] = 230000.0,
			    	[ASPECT_TAIL_ON] = 230000.0
			    }
		    },
		    lock_on_distance_coeff =0.95,
			multiple_targets_tracking = true,
            velocity_limits =
            {
                radial_velocity_min = 10.0,
            },
            scan_period = 1.0,
        }

declare_sensor(GRILL_PAN_M)

HIGH_SCREEN_M =
        {
			Name = "S-300VM 9S19M2 sr",
			category = SENSOR_RADAR,
            type = RADAR_AS,
            scan_volume =
            {
                azimuth = {-180.0, 180.0},
                elevation = {-15.0, 70.0}
            },
            max_measuring_distance = 500000.0,
            detection_distance =
            {
                [HEMISPHERE_UPPER] =
                {
                    [ASPECT_HEAD_ON] = 310000.0,
                    [ASPECT_TAIL_ON] = 310000.0
                },
                [HEMISPHERE_LOWER] =
                {
                    [ASPECT_HEAD_ON] = 310000.0,
                    [ASPECT_TAIL_ON] = 310000.0
                }
            },
            lock_on_distance_coeff = 0.9,
			multiple_targets_tracking = true,
            velocity_limits =
            {
                radial_velocity_min = 10.0,
            },
            scan_period = 1.0,
        }

declare_sensor(HIGH_SCREEN_M)

BILL_BOARD_M =
        {
			Name = "S-300VM 9S15M2 sr",
			category = SENSOR_RADAR,
            type = RADAR_AS,
            scan_volume =
            {
                azimuth = {-180.0, 180.0},
                elevation = {-15.0, 75.0}
            },
            max_measuring_distance = 515000.0,
            detection_distance =
            {
                [HEMISPHERE_UPPER] =
                {
                    [ASPECT_HEAD_ON] = 320000.0,
                    [ASPECT_TAIL_ON] = 320000.0
                },
                [HEMISPHERE_LOWER] =
                {
                    [ASPECT_HEAD_ON] = 320000.0,
                    [ASPECT_TAIL_ON] = 320000.0
                }
            },
            lock_on_distance_coeff = 0.9,
			multiple_targets_tracking = true,
            velocity_limits =
            {
                radial_velocity_min = 10.0,
            },
            scan_period = 1.0,
        }

declare_sensor(BILL_BOARD_M)


-- S-300PS/PMU1 SENSORS

BIG_BIRD =
        {
			Name = "S-300PS 64H6E TRAILER sr",
			category = SENSOR_RADAR,
            type = RADAR_AS,
            scan_volume =
            {
                azimuth = {-180.0, 180.0},
                elevation = {-15.0, 60.0}
            },
            max_measuring_distance = 200000.0,
            detection_distance =
            {
                [HEMISPHERE_UPPER] =
                {
                    [ASPECT_HEAD_ON] = 200000.0,
                    [ASPECT_TAIL_ON] = 200000.0
                },
                [HEMISPHERE_LOWER] =
                {
                    [ASPECT_HEAD_ON] = 200000.0,
                    [ASPECT_TAIL_ON] = 200000.0
                }
            },
            lock_on_distance_coeff = 0.85,
			multiple_targets_tracking = true,
            velocity_limits =
            {
                radial_velocity_min = 15.0,
            },
            scan_period = 1.0,
        }

declare_sensor(BIG_BIRD)

CLAM_SHELL =
        {
			Name = "S-300PS SA-10B 40B6MD MAST sr",
			category = SENSOR_RADAR,
            type = RADAR_AS,
            scan_volume =
            {
                azimuth = {-180.0, 180.0},
                elevation = {-15.0, 60.0}
            },
            max_measuring_distance = 260000.0,
            detection_distance =
            {
                [HEMISPHERE_UPPER] =
                {
                    [ASPECT_HEAD_ON] = 120000.0,
                    [ASPECT_TAIL_ON] = 120000.0
                },
                [HEMISPHERE_LOWER] =
                {
                    [ASPECT_HEAD_ON] = 120000.0,
                    [ASPECT_TAIL_ON] = 120000.0
                }
            },
            lock_on_distance_coeff = 0.85,
			multiple_targets_tracking = true,
            velocity_limits =
            {
                radial_velocity_min = 15.0,
            },
            scan_period = 1.0,
        }

declare_sensor(CLAM_SHELL)
 
FLAP_LID =
        {
            Name = "S-300PS 40B6M MAST tr",
            category = SENSOR_RADAR,
            type = RADAR_AS,
            scan_volume =
            {
                azimuth = {-180.0, 180.0},
                elevation = {-15.0, 60.0}
            },
            max_measuring_distance = 260000.0,
            detection_distance =
            {
                [HEMISPHERE_UPPER] =
                {
                    [ASPECT_HEAD_ON] = 160000.0,
                    [ASPECT_TAIL_ON] = 160000.0
                },
                [HEMISPHERE_LOWER] =
                {
                    [ASPECT_HEAD_ON] = 160000.0,
                    [ASPECT_TAIL_ON] = 160000.0
                }
            },
            lock_on_distance_coeff = 0.85,
            multiple_targets_tracking = true,
            velocity_limits =
            {
                radial_velocity_min = 10.0,
            },
            scan_period = 1.0,
        }

declare_sensor(FLAP_LID)

FLAP_LID_TRUCK =
        {
            Name = "S-300PS 30H6 TRAILER tr",
            category = SENSOR_RADAR,
            type = RADAR_AS,
            scan_volume =
            {
                azimuth = {-180.0, 180.0},
                elevation = {-15.0, 60.0}
            },
            max_measuring_distance = 260000.0,
            detection_distance =
            {
                [HEMISPHERE_UPPER] =
                {
                    [ASPECT_HEAD_ON] = 160000.0,
                    [ASPECT_TAIL_ON] = 160000.0
                },
                [HEMISPHERE_LOWER] =
                {
                    [ASPECT_HEAD_ON] = 160000.0,
                    [ASPECT_TAIL_ON] = 160000.0
                }
            },
            lock_on_distance_coeff = 0.85,
            multiple_targets_tracking = true,
            velocity_limits =
            {
                radial_velocity_min = 10.0,
            },
            scan_period = 1.0,
        }

declare_sensor(FLAP_LID_TRUCK)


-- S-300PMU2 SENSORS

BIG_BIRD_E =
        {
			Name = "S-300PMU2 64H6E2 sr",
			category = SENSOR_RADAR,
            type = RADAR_AS,
            scan_volume =
            {
                azimuth = {-180.0, 180.0},
                elevation = {-15.0, 60.0}
            },
            max_measuring_distance = 330000.0,
            detection_distance =
            {
                [HEMISPHERE_UPPER] =
                {
                    [ASPECT_HEAD_ON] = 330000.0,
                    [ASPECT_TAIL_ON] = 330000.0
                },
                [HEMISPHERE_LOWER] =
                {
                    [ASPECT_HEAD_ON] = 330000.0,
                    [ASPECT_TAIL_ON] = 330000.0
                }
            },
            lock_on_distance_coeff = 0.85,
			multiple_targets_tracking = true,
            velocity_limits =
            {
                radial_velocity_min = 15.0,
            },
            scan_period = 1.0,
        }

declare_sensor(BIG_BIRD_E)

GRAVE_STONE =
        {
            Name = "S-300PMU2 92H6E tr",
            category = SENSOR_RADAR,
            type = RADAR_AS,
            scan_volume =
            {
                azimuth = {-180.0, 180.0},
                elevation = {-15.0, 60.0}
            },
            max_measuring_distance = 270000.0,
            detection_distance =
            {
                [HEMISPHERE_UPPER] =
                {
                    [ASPECT_HEAD_ON] = 270000.0,
                    [ASPECT_TAIL_ON] = 270000.0
                },
                [HEMISPHERE_LOWER] =
                {
                    [ASPECT_HEAD_ON] = 270000.0,
                    [ASPECT_TAIL_ON] = 270000.0
                }
            },
            lock_on_distance_coeff = 0.85,
            multiple_targets_tracking = true,
            velocity_limits =
            {
                radial_velocity_min = 10.0,
            },
            scan_period = 1.0,
        }

declare_sensor(GRAVE_STONE)

-- SAMPT/SAMPT NG SENSOR

ARABEL =
        {
			Name = "SAMP/T ARABEL str",
			category = SENSOR_RADAR,
            type = RADAR_AS,
            scan_volume =
            {
                azimuth = {-180.0, 180.0},
                elevation = {-10.0, 75.0}
            },
            max_measuring_distance = 220000.0,
            detection_distance =
            {
                [HEMISPHERE_UPPER] =
                {
                    [ASPECT_HEAD_ON] = 120000.0,
                    [ASPECT_TAIL_ON] = 120000.0
                },
                [HEMISPHERE_LOWER] =
                {
                    [ASPECT_HEAD_ON] = 120000.0,
                    [ASPECT_TAIL_ON] = 120000.0
                }
            },
            lock_on_distance_coeff = 0.9,
			multiple_targets_tracking = true,
            velocity_limits =
            {
                radial_velocity_min = 15.0,
            },
            scan_period = 1.0,
        }

declare_sensor(ARABEL)

GROUND_FIRE_300 =
        {
			Name = "SAMP/T NG GF300 str",
			category = SENSOR_RADAR,
            type = RADAR_AS,
            scan_volume =
            {
                azimuth = {-180.0, 180.0},
                elevation = {-15.0, 90.0}
            },
            max_measuring_distance = 650000.0,
            detection_distance =
            {
                [HEMISPHERE_UPPER] =
                {
                    [ASPECT_HEAD_ON] = 400000.0,
                    [ASPECT_TAIL_ON] = 400000.0
                },
                [HEMISPHERE_LOWER] =
                {
                    [ASPECT_HEAD_ON] = 400000.0,
                    [ASPECT_TAIL_ON] = 400000.0
                }
            },
            lock_on_distance_coeff = 0.95,
			-- multiple_targets_tracking = true,
            velocity_limits =
            {
                radial_velocity_min = 10.0,
            },
            scan_period = 1.0,
        }

declare_sensor(GROUND_FIRE_300)


-- SOVIET & RUSSIAN ARM DECOYS

GAZETCHIK_DECOY =
        {
			Name = "34Ya6E Gazetchik E decoy",
			category = SENSOR_RADAR,
            type = RADAR_AS,
            scan_volume =
            {
                azimuth = {-180.0, 180.0},
                elevation = {-15.0, 60.0}
            },
            max_measuring_distance = 20000.0,
            detection_distance =
            {
                [HEMISPHERE_UPPER] =
                {
                    [ASPECT_HEAD_ON] = 20000.0,
                    [ASPECT_TAIL_ON] = 20000.0
                },
                [HEMISPHERE_LOWER] =
                {
                    [ASPECT_HEAD_ON] = 20000.0,
                    [ASPECT_TAIL_ON] = 20000.0
                }
            },
            lock_on_distance_coeff = 0.01,
			multiple_targets_tracking = true,
            velocity_limits =
            {
                radial_velocity_min = 1.0,
            },
            scan_period = 0.2,
        }

declare_sensor(GAZETCHIK_DECOY)

