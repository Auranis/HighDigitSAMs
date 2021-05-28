-- SAMT/T Module de Commandement (Command Module)

GT = {};
GT_t.ws = 0;
set_recursive_metatable(GT, GT_t.generic_stationary)
set_recursive_metatable(GT.chassis, GT_t.CH_t.M818);

GT.visual.shape = "SAMPT_MC"
GT.visual.shape_dstr = "SAMPT_Standard_Destroyed"

GT.swing_on_run = false

GT.r_max = 0.46

--Burning after hit
GT.visual.fire_size = 0.8 --relative burning size
GT.visual.fire_pos[1] = -2.0 -- center of burn at long axis shift(meters)
GT.visual.fire_pos[2] = 0 -- center of burn shift at vertical shift(meters)
GT.visual.fire_pos[3] = 0 -- center of burn at transverse axis shift(meters)
GT.visual.fire_time = 1000 --burning time (seconds)

GT.sensor = {};
GT.sensor.max_range_finding_target = 160000;
GT.sensor.min_range_finding_target = 3000;
GT.sensor.max_alt_finding_target = 30000;
GT.sensor.height = 5.895;

GT.WS = {};
GT.WS.maxTargetDetectionRange = 200000;

local ws = 0;
for i = 1,8 do
    ws = GT_t.inc_ws();
	GT.WS[ws] = {};
    GT.WS[ws].pos = {0,3,0};
	GT.WS[ws].angles = {
					{math.rad(180), math.rad(-180), math.rad(-90), math.rad(90)},
					};
    GT.WS[ws].omegaY = 3;
    GT.WS[ws].omegaZ = 3;

    GT.WS[ws].LN = {};
    GT.WS[ws].LN[1] = {};
    GT.WS[ws].LN[1].type = 100;
    GT.WS[ws].LN[1].reactionTime = 1;
    GT.WS[ws].LN[1].distanceMin = GT.sensor.min_range_finding_target;
    GT.WS[ws].LN[1].distanceMax = GT.sensor.max_range_finding_target;
	GT.WS[ws].LN[1].ECM_K = 0.4;
	GT.WS[ws].LN[1].reflection_limit = 0.029;
    GT.WS[ws].LN[1].min_trg_alt = 10;
    GT.WS[ws].LN[1].max_trg_alt = GT.sensor.max_alt_finding_target;
	GT.WS[ws].LN[1].max_number_of_missiles_channels = 2;

end

GT.Sensors = {RADAR = "SAMP/T NG MRI GF300", "SAMP/T MRI ARABEL" };

GT.Name = "SAMP/T MC"
GT.DisplayName = _("SAM SAMP/T MC")
GT.Rate = 20

GT.EPLRS = true

GT.DetectionRange  = 0;
GT.ThreatRange = 0;
GT.mapclasskey = "P0091000046";
GT.attribute = {wsType_Ground,wsType_SAM,wsType_NoWeapon,
				"Trucks",
				"SAM CC",
				};
GT.category = "Air Defence";
GT.Countries = {"France", "Italia", "Russia"}