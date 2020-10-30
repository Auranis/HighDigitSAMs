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


-- S-300PMU1 SENSORS

TOMB_STONE =
        {
			Name = "S-300PMU1 40B6M tr",
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

declare_sensor(TOMB_STONE)


-- S-300VM SENSORS

GRILL_PAN =
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

declare_sensor(GRILL_PAN)

HIGH_SCREEN =
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

declare_sensor(HIGH_SCREEN)

BILL_BOARD =
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

declare_sensor(BILL_BOARD)


-- S-300PMU2 SENSORS

BIG_BIRD_E =
        {
			Name = "S-300PMU2 64H6E2 sr",
			category = SENSOR_RADAR,
            type = RADAR_AS,
            scan_volume =
            {
                azimuth = {-180.0, 180.0},
                elevation = {-15.0, 75.0}
            },
            max_measuring_distance = 400000.0,
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
                radial_velocity_min = 10.0,
            },
            scan_period = 1.0,
        }

declare_sensor(BIG_BIRD_E)
 
GRAVE_STONE =
        {
            Name = "S-300PMU2 92N6E tr",
            category = SENSOR_RADAR,
            type = RADAR_AS,
            scan_volume =
            {
                azimuth = {-180.0, 180.0},
                elevation = {-15.0, 75.0}
            },
            max_measuring_distance = 340000.0,
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
            lock_on_distance_coeff = 0.9,
            multiple_targets_tracking = true,
            velocity_limits =
            {
                radial_velocity_min = 10.0,
            },
            scan_period = 1.0,
        },

declare_sensor(GRAVE_STONE)