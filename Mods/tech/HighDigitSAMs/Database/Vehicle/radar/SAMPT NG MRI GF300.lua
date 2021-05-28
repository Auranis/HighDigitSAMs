-- SAMP/T NG Ground Fire 300

GT = {};
GT_t.ws = 0;
set_recursive_metatable(GT, GT_t.generic_stationary);
set_recursive_metatable(GT.chassis, GT_t.CH_t.MAZ543M);
GT.chassis.life = 4;

GT.visual.shape = "SAMPT_MRI";
GT.visual.shape_dstr = "SAMPT_Standard_Destroyed";
GT.visual.fire_pos[2] = 1;

--chassis
GT.animation_arguments.locator_rotation = 1;
GT.radar_rotation_period = 6.0;
GT.snd.radarRotation = "RadarRotation";

GT.sensor = {};
GT.sensor.max_range_finding_target = 160000;
GT.sensor.min_range_finding_target = 2000;
GT.sensor.max_alt_finding_target = 27000;
GT.sensor.height = 5.0;

GT.CustomAimPoint = {0,1.5,0}

GT.WS = {};
GT.WS.maxTargetDetectionRange = 160000;
GT.WS.radar_type = 103;
GT.WS.radar_rotation_type = 0;
--GT.WS.max_number_of_missiles_channels = 2;

--Burning after hit
GT.visual.fire_size = 1.0; --relative burning size
GT.visual.fire_pos[1] = 0; -- center of burn at long axis shift(meters)
GT.visual.fire_pos[2] = 0; -- center of burn shift at vertical shift(meters)
GT.visual.fire_pos[3] = 0; -- center of burn at transverse axis shift(meters)
GT.visual.fire_time = 1200; --burning time (seconds)

local ws = 0;
for i = 1,15 do 
    ws = GT_t.inc_ws();
	GT.WS[ws] = {}
    GT.WS[ws].pos = {0,5,0}
	GT.WS[ws].angles = {
					{math.rad(180), math.rad(-180), math.rad(-15), math.rad(80)},
					};
    GT.WS[ws].omegaY = 3
    GT.WS[ws].omegaZ = 3
    GT.WS[ws].LN = 
    {
        {
        type = 103,
		reflection_limit = 0.029,
        distanceMin = GT.sensor.min_range_finding_target,
        distanceMax = GT.sensor.max_range_finding_target,
		ECM_K = 0.4,
        min_trg_alt = 100, -- acquisition at 100m min.
        max_trg_alt = GT.sensor.max_alt_finding_target,
        reactionTime = 3;
		max_number_of_missiles_channels = 2,
        },
    }
end --for

GT.Name = "SAMP/T NG MRI GF300";
GT.DisplayName = _("SAM SAMP/T NG MRI GF300");
GT.Rate = 20;

GT.Sensors = {RADAR = "SAMP/T NG GF300 str" };

GT.DetectionRange  = GT.sensor.max_range_finding_target;
GT.ThreatRange = 0;
GT.mapclasskey = "P0091000083";
GT.attribute = {wsType_Ground,wsType_SAM,wsType_Radar,
				"LR SAM",
				"SAM SR",
				"SAM TR",
				"RADAR_BAND1_FOR_ARM",
				"Datalink"
				};
GT.category = "Air Defence";
GT.Countries = {"France", "Italia", "Russia"}