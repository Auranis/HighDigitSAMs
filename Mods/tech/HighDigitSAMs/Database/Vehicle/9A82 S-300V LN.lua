-- S-300v 9a82 ln

GT = {};
GT_t.ws = 0;
set_recursive_metatable(GT, GT_t.generic_stationary);
set_recursive_metatable(GT.chassis, GT_t.CH_t.MAZ543M);
GT.chassis.life = 2;

GT.visual.shape = "9a82me";
GT.visual.shape_dstr = "9a82me_d";

--chassis

GT.sensor = {};
set_recursive_metatable(GT.sensor, GT_t.SN_visual);
GT.sensor.height = 8.225;

--Burning after hit
GT.visual.fire_size = 1.1; --relative burning size
GT.visual.fire_pos[1] = 2; -- center of burn at long axis shift(meters)
GT.visual.fire_pos[2] = 0; -- center of burn shift at vertical shift(meters)
GT.visual.fire_pos[3] = 0; -- center of burn at transverse axis shift(meters)
GT.visual.fire_time = 1100; --burning time (seconds)

-- weapon systems

GT.WS = {};
GT.WS.maxTargetDetectionRange = 150000;

local ws = GT_t.inc_ws();
GT.WS[ws] = {};
set_recursive_metatable(GT.WS[ws], GT_t.WS_t.S300V_9M82);
GT.WS[ws].pos = {-4.915, 2.036,0};
GT.WS[ws].LN[1].ECM_K = -1
GT.WS[ws].LN[1].beamWidth = 0.0;
GT.WS[ws].LN[1].barrels_reload_type = 3
GT.WS[ws].LN[1].depends_on_unit = {{{"S-300V 9S32 tr"},},};
GT.WS[ws].LN[1].reactionTime = 1.0;
GT.WS[ws].LN[1].PL[1].ammo_capacity = 2;
GT.WS[ws].LN[1].PL[1].shot_delay = 0.1;
GT.WS[ws].LN[1].PL[1].reload_time = 7200;
GT.WS[ws].LN[1].BR[1] = {pos = {10.05, 0.216,-1.045}, drawArgument = 3 };
GT.WS[ws].LN[1].BR[2] = {pos = {10.05, 1.204,-0.614}, drawArgument = 4 };
GT.WS[ws].LN[1].BR[3] = {pos = {10.05, 1.204, 0.614}, drawArgument = 2 };
GT.WS[ws].LN[1].BR[4] = {pos = {10.05, 0.216, 1.045}, drawArgument = 3 };

GT.Name = "S-300V 9A82 ln";
GT.DisplayName = _("SAM SA-12 S-300V 9A82 LN");
GT.Rate = 10;

GT.DetectionRange  = 0;
GT.ThreatRange = GT.WS[1].LN[1].distanceMax;
GT.mapclasskey = "P0091000079";
GT.attribute = {wsType_Ground,wsType_SAM,wsType_Miss,PU_5P85D,
				"AA_missile",
				"SAM LL",
				};
GT.category = "Air Defence";
GT.Countries = {"Russia"}