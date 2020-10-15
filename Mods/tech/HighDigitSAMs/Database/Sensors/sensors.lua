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
            scan_period = 0.1,
        }

declare_sensor(TOMB_STONE)