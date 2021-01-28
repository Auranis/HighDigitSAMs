-- s-300pmu1 64n6e sr

GT = {};
GT_t.ws = 0;
set_recursive_metatable(GT, GT_t.generic_stationary);
set_recursive_metatable(GT.chassis, GT_t.CH_t.MAZ543M);
GT.chassis.life = 1;

GT.visual.shape = "Gazetchik";
GT.visual.shape_dstr = "Auto_crush";
GT.visual.fire_pos[2] = 1;

--chassis
--GT.animation_arguments.locator_rotation = 0;
--GT.radar_rotation_period = 0;
GT.snd.radarRotation = "RadarRotation";

GT.sensor = {};
GT.sensor.max_range_finding_target = 20000;
GT.sensor.min_range_finding_target = 20;
GT.sensor.max_alt_finding_target = 20000;
GT.sensor.height = 3.0;

GT.CustomAimPoint = {0,1.5,0}

GT.WS = {};
GT.WS.maxTargetDetectionRange = 200000;
GT.WS.radar_type = 102;
GT.WS.radar_rotation_type = 0;

--Burning after hit
GT.visual.fire_size = 1.0; --relative burning size
GT.visual.fire_pos[1] = 0; -- center of burn at long axis shift(meters)
GT.visual.fire_pos[2] = 0; -- center of burn shift at vertical shift(meters)
GT.visual.fire_pos[3] = 0; -- center of burn at transverse axis shift(meters)
GT.visual.fire_time = 1200; --burning time (seconds)

local ws = 0;
for i = 1,24 do 
    ws = GT_t.inc_ws();
	GT.WS[ws] = {}
    GT.WS[ws].pos = {0,5,0}
	GT.WS[ws].angles = {
					{math.rad(180), math.rad(-180), math.rad(-15), math.rad(50)},
					};
    GT.WS[ws].omegaY = 3
    GT.WS[ws].omegaZ = 3
    GT.WS[ws].LN = 
    {
        {
        type = 101,
		reflection_limit = 0.02,
        distanceMin = GT.sensor.min_range_finding_target,
        distanceMax = GT.sensor.max_range_finding_target,
		ECM_K = 0.9,
        min_trg_alt = 10,
        max_trg_alt = GT.sensor.max_alt_finding_target,
        reactionTime = 0.5;
        },
    }
end --for

GT.Name = "34Ya6E Gazetchik E decoy";
GT.DisplayName = _("34Ya6E Gazetchik E decoy");
GT.Rate = 20;

GT.Sensors = { RADAR = "34Ya6E Gazetchik E decoy" };

GT.DetectionRange  = GT.sensor.max_range_finding_target;
GT.ThreatRange = 0;
GT.mapclasskey = "P0091000083";
GT.attribute = {wsType_Ground,wsType_SAM,wsType_Radar,V_40B6M,
				"LR SAM",
				"SAM SR",
				"RADAR_BAND1_FOR_ARM",
				"CustomAimPoint",
				};
GT.category = "Air Defence";