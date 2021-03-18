--S-300V CP 9S457

GT = {};
GT_t.ws = 0;
set_recursive_metatable(GT, GT_t.generic_stationary)
set_recursive_metatable(GT.chassis, GT_t.CH_t.MAZ543M);

GT.visual.shape = "9s457me"
GT.visual.shape_dstr = "9s457me_d"

GT.CustomAimPoint = {0,1.5,0}

--chassis
GT.swing_on_run = false


--Burning after hit
GT.visual.fire_size = 0.7 --relative burning size
GT.visual.fire_pos[1] = 0 -- center of burn at long axis shift(meters)
GT.visual.fire_pos[2] = 0 -- center of burn shift at vertical shift(meters)
GT.visual.fire_pos[3] = 0 -- center of burn at transverse axis shift(meters)
GT.visual.fire_time = 900 --burning time (seconds)

GT.sensor = {};
GT.sensor.max_range_finding_target = 300000;
GT.sensor.min_range_finding_target = 1;
GT.sensor.max_alt_finding_target = 80000;
GT.sensor.height = 8.68;

GT.WS = {};
GT.WS.maxTargetDetectionRange = 300000;

local ws = 0;
for i = 1,15 do
    ws = GT_t.inc_ws();
	GT.WS[ws] = {};
    GT.WS[ws].pos = {0,3,0};
	GT.WS[ws].angles = {
					{math.rad(180), math.rad(-180), math.rad(-89), math.rad(89)},
					};
    GT.WS[ws].omegaY = 3;
    GT.WS[ws].omegaZ = 3;

    GT.WS[ws].LN = {};
    GT.WS[ws].LN[1] = {};
    GT.WS[ws].LN[1].type = 100;
    GT.WS[ws].LN[1].reactionTime = 0.1;
    GT.WS[ws].LN[1].distanceMin = GT.sensor.min_range_finding_target;
    GT.WS[ws].LN[1].distanceMax = GT.sensor.max_range_finding_target;
	GT.WS[ws].LN[1].reflection_limit = 0.049;
    GT.WS[ws].LN[1].min_trg_alt = 5
    GT.WS[ws].LN[1].max_trg_alt = GT.sensor.max_alt_finding_target;
    GT.WS[ws].LN[1].depends_on_unit = {{{"S-300V 9S15 sr",},},{{"S-300V 9S19 sr",},},};
end

GT.Name = "S-300V 9S457 cp"
GT.DisplayName = _("SAM SA-12 S-300V 9S457 CP")
GT.Rate = 20

GT.Sensors = {RADAR = {"GRILL PAN"}};

GT.DetectionRange  = 0;
GT.ThreatRange = 0;
GT.mapclasskey = "P0091000046";
GT.attribute = {wsType_Ground,wsType_SAM,wsType_NoWeapon,wsType_GenericVehicle,
				"SAM CC",
				"CustomAimPoint",
				};
GT.category = "Air Defence";
GT.Countries = {"Ukraine", "Russia"}
