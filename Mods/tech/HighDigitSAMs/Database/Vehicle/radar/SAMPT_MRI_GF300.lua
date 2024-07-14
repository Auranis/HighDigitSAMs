-- SAMP/T MRI ARABEL radar by zahnatom (except for the sensor)
GT = {};
GT_t.ws = 0;
set_recursive_metatable(GT, GT_t.generic_stationary);
set_recursive_metatable(GT.chassis, GT_t.CH_t.STATIC);

GT.visual.shape = "sampt_mri";
GT.visual.shape_dstr = "sampt_standard_destroyed";

GT.swing_on_run = false
GT.IR_emission_coeff = 0.06
GT.visual.IR = { coeffs = {GT_t.IR_COEFFS_ENGINE_APC, GT_t.IR_COEFFS_WHEELS_Car, {0, 0}, IR_COEFFS_BODY, {0.18, 0.18/800}}}

GT.toggle_alarm_state_interval = 0.01;

GT.animation_arguments.locator_rotation = 1;
GT.radar_rotation_period = 1;
GT.snd.radarRotation = "GndTech/RadarRotation";

GT.visual.fire_size = 1.2; -- relative burning size
GT.visual.fire_pos[1] = 0; -- center of burn at long axis shift(meters)
GT.visual.fire_pos[2] = 2; -- center of burn shift at vertical shift(meters)
GT.visual.fire_pos[3] = 0; -- center of burn at transverse axis shift(meters)
GT.visual.fire_time = 600; -- burning time (seconds)
GT.visual.dust_pos = {1.00, 0.05, 0}
GT.visual.dirt_pos = {-1.00, 0.05, 0}

GT.visual.min_time_agony = 5
GT.visual.max_time_agony = 120
GT.visual.agony_explosion_size = 5

GT.sensor = {};
GT.sensor.max_range_finding_target = 220000;
GT.sensor.min_range_finding_target = 10;
GT.sensor.max_alt_finding_target = 100000;
GT.sensor.height = 7;

GT.WS = {}
GT.WS.maxTargetDetectionRange = 220000;
GT.WS.radar_type = 102;
GT.WS.radar_rotation_type = 1;
GT.WS.requiredUnits = {{"SAMPT_MGE", 1000, GT_t.REQUIRED_UNIT.NEED_AI_ON}};
GT.WS.searchRadarMaxElevation = math.rad(75);
GT.WS.searchRadarFrequencies = {{8e9, 12e9}};
GT.WS.fire_on_march = false;

local ws = GT_t.inc_ws();
GT.WS[ws] = {};
GT.WS[ws].pos = {0, 0, 0};
GT.WS[ws].angles = {{math.rad(180), math.rad(180), math.rad(-10), math.rad(75)}};
GT.WS[ws].moveable = false;
GT.WS[ws].mount_before_move = false;
GT.WS[ws].LN = {};
GT.WS[ws].LN[1] = {};
GT.WS[ws].LN[1].max_number_of_missiles_channels = 1;
GT.WS[ws].LN[1].type = 102;
GT.WS[ws].LN[1].frequencyRange = {8e9, 12e9};
GT.WS[ws].LN[1].reactionTime = 0.1;
GT.WS[ws].LN[1].distanceMin = 100;
GT.WS[ws].LN[1].distanceMax = GT.sensor.max_range_finding_target;
GT.WS[ws].LN[1].ECM_K = 0;
GT.WS[ws].LN[1].min_trg_alt = 1;
GT.WS[ws].LN[1].max_trg_alt = 100000;
GT.WS[ws].LN[1].maxShootingSpeed = 0;

for i = 2, 48 do
    ws = GT_t.inc_ws();
    GT.WS[ws] = {};
    GT.WS[ws].pos = {0, 0, 0};
    GT.WS[ws].angles = {
        {math.rad(180), math.rad(180), math.rad(-10), math.rad(75)}
    };
    GT.WS[ws].moveable = false;
    GT.WS[ws].mount_before_move = false;
    GT.WS[ws].LN = {};
    GT.WS[ws].LN[1] = {};
    GT.WS[ws].LN[1].frequencyRange = {8e9, 12e9};
    GT.WS[ws].LN[1].distanceMin = 100;
    GT.WS[ws].LN[1].distanceMax = GT.sensor.max_range_finding_target;
    set_recursive_metatable(GT.WS[ws].LN[1], GT.WS[1].LN[1]);
end

GT.Name = "SAMPT_MRI_GF300";
GT.DisplayName = _("SAMP/T MRI Ground Fire 300 STR");
GT.DisplayNameShort = _("SAMP/T MRI GF300");
GT.Rate = 20;

GT.Sensors = {RADAR = "SAMP/T NG GF300 str",};

GT.EPLRS = true;

GT.DetectionRange = 400000;
GT.ThreatRange = 0;
GT.mapclasskey = "P0091000083";
GT.attribute = {
    wsType_Ground, wsType_SAM, wsType_Radar, WSTYPE_PLACEHOLDER, 
    "LR SAM",
    "SAM SR",
    "SAM TR",
    "RADAR_BAND1_FOR_ARM",
    "RADAR_BAND2_FOR_ARM",
    "Datalink"
};
GT.category = "Air Defence";
GT.tags = {"Air Defence", "Search & Track Radar"}

GT.Countries = {"France", "Italy", "Ukraine"}

add_surface_unit(GT)
