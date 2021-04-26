-- SAM 9A310M1-2 'BUK' ln

GT = {};
GT_t.ws = 0;
set_recursive_metatable(GT, GT_t.generic_track_vehicle);
set_recursive_metatable(GT.chassis, GT_t.CH_t.MTT);

GT.visual.shape = "9a310m1";
GT.visual.shape_dstr = "9a310m1_p_1";
GT.toggle_alarm_state_interval = 15;

--chassis
GT.swing_on_run = true;

GT.sensor = {};
GT.sensor.max_range_finding_target = 120000;
GT.sensor.min_range_finding_target = 3000;
GT.sensor.max_alt_finding_target = 50000;
GT.sensor.min_alt_finding_target = 15;
GT.sensor.height = 6.931;

--Burning after hit
GT.visual.fire_size = 0.9; --relative burning size
GT.visual.fire_pos[1] = 0; -- center of burn at long axis shift(meters)
GT.visual.fire_pos[2] = 0; -- center of burn shift at vertical shift(meters)
GT.visual.fire_pos[3] = 0; -- center of burn at transverse axis shift(meters)
GT.visual.fire_time = 1000; --burning time (seconds)

-- weapon systems

GT.WS = {};

GT.WS.radar_type = 103;
GT.WS.maxTargetDetectionRange = 60000;
GT.WS.fire_on_march = false;

-- virtual trackers
--primary
local ws = GT_t.inc_ws();
GT.WS[ws] = {};
local base = ws;
GT.WS[ws].pos = {0, 3.1,0};
GT.WS[ws].angles = {
					{math.rad(180), math.rad(-180), math.rad(-5), math.rad(90)},
					};
GT.WS[ws].drawArgument1 = 0;
GT.WS[ws].mount_before_move = true;
GT.WS[ws].omegaY = 0.523599;
GT.WS[ws].omegaZ = math.rad(10);
GT.WS[ws].pidY = {p=40, i=0.1, d=7, inn=4};
GT.WS[ws].reference_angle_Y = math.pi;
GT.WS[ws].LN = {};
GT.WS[ws].LN[1] = {};
GT.WS[ws].LN[1].type = 102;
GT.WS[ws].LN[1].max_number_of_missiles_channels = 2;
GT.WS[ws].LN[1].distanceMax = GT.sensor.max_range_finding_target;
GT.WS[ws].LN[1].ECM_K = 0.65;
GT.WS[ws].LN[1].distanceMin = GT.sensor.min_range_finding_target;
GT.WS[ws].LN[1].max_trg_alt = GT.sensor.max_alt_finding_target;
GT.WS[ws].LN[1].min_trg_alt = GT.sensor.min_alt_finding_target;
GT.WS[ws].LN[1].reflection_limit = 0.02;
GT.WS[ws].LN[1].reactionTime = 4;
GT.WS[ws].LN[1].beamWidth = math.rad(90);
GT.WS[ws].LN[1].maxShootingSpeed = 0;
-- own searching radar(2 targets) and external target designation from CC
GT.WS[ws].LN[1].depends_on_unit = {{{"self", 4}}, {{"self", 5}}, {{"SA-11 Buk CC 9S470M1"}}}; 

--secondary
ws = GT_t.inc_ws();
GT.WS[ws] = {};
GT.WS[ws].pos = {0.0, 0.0, 0.0};
GT.WS[ws].base = base;
GT.WS[ws].angles = {
					{math.rad(15), math.rad(-15), math.rad(-5), math.rad(90)},
					};
GT.WS[ws].omegaY = 1;
GT.WS[ws].omegaZ = 1;
GT.WS[ws].LN = {};
GT.WS[ws].LN[1] = {};
GT.WS[ws].LN[1].type = 102;
GT.WS[ws].LN[1].max_number_of_missiles_channels = 2;
GT.WS[ws].LN[1].distanceMax = GT.sensor.max_range_finding_target;
GT.WS[ws].LN[1].ECM_K = 0.65;
GT.WS[ws].LN[1].distanceMin = GT.sensor.min_range_finding_target;
GT.WS[ws].LN[1].max_trg_alt = GT.sensor.max_alt_finding_target;
GT.WS[ws].LN[1].min_trg_alt = GT.sensor.min_alt_finding_target;
GT.WS[ws].LN[1].reflection_limit = 0.02;
GT.WS[ws].LN[1].reactionTime = 4;
GT.WS[ws].LN[1].beamWidth = math.rad(90);
GT.WS[ws].LN[1].maxShootingSpeed = 0;
-- own searching radar(2 targets) and external target designation from CC
GT.WS[ws].LN[1].depends_on_unit = {{{"self", 4}}, {{"self", 5}}, {{"SA-11 Buk CC 9S470M1"}}};

--launcher
ws = GT_t.inc_ws();
GT.WS[ws] = {};
GT.WS[ws].pos = {0, 0, 0};
GT.WS[ws].base = base;
base = ws;
GT.WS[ws].reference_angle_Z = math.rad(2);
GT.WS[ws].angles = {
					{math.rad(2), math.rad(-2), math.rad(-5), math.rad(90)},
					};
GT.WS[ws].omegaY = 1;
GT.WS[ws].omegaZ = 1;
GT.WS[ws].pidY = {p=4, i=0.1, d=2, inn=1};
GT.WS[ws].pidZ = {p=4, i=0.1, d=2, inn=1};
GT.WS[ws].drawArgument2 = 1;
GT.WS[ws].mount_before_move = true;
__LN = add_launcher(GT.WS[ws], GT_t.LN_t._9A310M12);
__LN.min_launch_angle = math.rad(20);
__LN.launch_delay = 5;
__LN.depends_on_unit = {{{"self", 1}}, {{"self", 2}}};
__LN.BR = {
			{connector_name = "POINT_ROCKET_01"},
			{connector_name = "POINT_ROCKET_02"},
			{connector_name = "POINT_ROCKET_03"},
			{connector_name = "POINT_ROCKET_04"},
		};
__LN = nil;

-- unit's own searching radar (for 2 targets)
-- Îïèñûâàþòñÿ ïîñëå ðàêåòíîãî ëàóí÷åðà äëÿ òîãî,
-- ÷òîáû åãî WS ñäåëàòü áàçîâîé äëÿ ïðàâèëüíîé ðåàëèçàöèè ïîèñêîâûõ âîçìîæíîñòåé ðàäàðà ïóñêîâîé óñòàíîâêè
-- (èùåì òîëüêî â óçêîì ñåêòîðå îòíîñèòåëüíî íàïðàâëåíèÿ ãîëîâû).
-- Îñíîâíîé ëó÷ ðàäàðà ïîäñâåòà öåëè ÍÅËÜÇß èñïîëüçîâàòü êàê áàçó èç-çà îñîáåííîñòåé ðåàëèçàöèè

ws = GT_t.inc_ws();
GT.WS[ws] = {};
GT.WS[ws].pos = {0, 0, 0};
GT.WS[ws].base = base;
GT.WS[ws].angles = {
					{math.rad(60), math.rad(-60), math.rad(-5), math.rad(90)},
					};
GT.WS[ws].omegaY = 1;
GT.WS[ws].omegaZ = 1;
GT.WS[ws].pidY = {p=10,i=0.1,d=3, inn=3};
GT.WS[ws].pidZ = {p=10,i=0.1,d=3, inn=3};
GT.WS[ws].LN = {};
GT.WS[ws].LN[1] = {};
GT.WS[ws].LN[1].type = 101;
GT.WS[ws].LN[1].max_number_of_missiles_channels = 2;
GT.WS[ws].LN[1].distanceMax = GT.sensor.max_range_finding_target;
GT.WS[ws].LN[1].ECM_K = 0.65;
GT.WS[ws].LN[1].distanceMin = GT.sensor.min_range_finding_target;
GT.WS[ws].LN[1].max_trg_alt = GT.sensor.max_alt_finding_target;
GT.WS[ws].LN[1].min_trg_alt = GT.sensor.min_alt_finding_target;
GT.WS[ws].LN[1].reflection_limit = 0.02;
GT.WS[ws].LN[1].reactionTime = 20;
GT.WS[ws].LN[1].beamWidth = math.rad(90);
GT.WS[ws].LN[1].maxShootingSpeed = 0;
--2
ws = GT_t.inc_ws();
GT.WS[ws] = {};
GT.WS[ws].pos = {0, 0, 0};
GT.WS[ws].base = base;
GT.WS[ws].angles = {
					{math.rad(60), math.rad(-60), math.rad(-5), math.rad(90)},
					};
GT.WS[ws].omegaY = 1;
GT.WS[ws].omegaZ = 1;
GT.WS[ws].pidY = {p=10,i=0.1,d=3, inn=3};
GT.WS[ws].pidZ = {p=10,i=0.1,d=3, inn=3};
GT.WS[ws].LN = {};
GT.WS[ws].LN[1] = {};
GT.WS[ws].LN[1].type = 101;
GT.WS[ws].LN[1].max_number_of_missiles_channels = 2;
GT.WS[ws].LN[1].distanceMax = GT.sensor.max_range_finding_target;
GT.WS[ws].LN[1].ECM_K = 0.65;
GT.WS[ws].LN[1].distanceMin = GT.sensor.min_range_finding_target;
GT.WS[ws].LN[1].max_trg_alt = GT.sensor.max_alt_finding_target;
GT.WS[ws].LN[1].min_trg_alt = GT.sensor.min_alt_finding_target;
GT.WS[ws].LN[1].reflection_limit = 0.02;
GT.WS[ws].LN[1].reactionTime = 20;
GT.WS[ws].LN[1].beamWidth = math.rad(90);
GT.WS[ws].LN[1].maxShootingSpeed = 0;

GT.Name = "SA-17 Buk M1-2 LN 9A310M1-2";
GT.DisplayName = _("SAM SA-17 Buk M1-2 LN 9A310M1-2");
GT.Rate = 70;

GT.Sensors = { OPTIC = {"Karat visir"}, RADAR = {"SA-17 Buk TR"}};

GT.DetectionRange  = GT.sensor.max_range_finding_target;
GT.ThreatRange = GT.WS[3].LN[1].distanceMax;
GT.mapclasskey = "P0091000081";
GT.attribute = {wsType_Ground,wsType_SAM,wsType_Radar_Miss,BUK_PU,
				"AA_missile",
				"MR SAM",
				"SAM TR",
				"SAM LL",
				"RADAR_BAND1_FOR_ARM",
				"RADAR_BAND2_FOR_ARM",
				};
GT.category = "Air Defence";
GT.tags  =
{
    "Air Defence",
	"SAM TEL",
}
GT.Countries = {"Algeria", "Belarus", "Iran", "Kazakhstan", "North Korea", "Russia", "Syria","Ukraine"}
