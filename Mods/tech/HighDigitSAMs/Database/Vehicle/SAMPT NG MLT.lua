-- SAMP/T MLT LN

GT = {};
GT_t.ws = 0;
set_recursive_metatable(GT, GT_t.generic_stationary);
set_recursive_metatable(GT.chassis, GT_t.CH_t.MAZ543M);
GT.chassis.life = 2;

GT.visual.shape = "SAMPT_MLT";
GT.visual.shape_dstr = "SAMPT_MLT_Destroyed";

--chassis

GT.sensor = {};
set_recursive_metatable(GT.sensor, GT_t.SN_visual);
GT.sensor.height = 5.0;

--Burning after hit
GT.visual.fire_size = 1.1; --relative burning size
GT.visual.fire_pos[1] = 2; -- center of burn at long axis shift(meters)
GT.visual.fire_pos[2] = 0; -- center of burn shift at vertical shift(meters)
GT.visual.fire_pos[3] = 0; -- center of burn at transverse axis shift(meters)
GT.visual.fire_time = 1100; --burning time (seconds)

-- weapon systems

GT.WS = {};
GT.WS.maxTargetDetectionRange = 250000;

local ws = GT_t.inc_ws();
GT.WS[ws] = {};
set_recursive_metatable(GT.WS[ws], GT_t.WS_t.SAMPT);
GT.WS[ws].pos = {-6.5,0,0};
GT.WS[ws].LN[1].ECM_K = -1
GT.WS[ws].LN[1].beamWidth = 0.0;
GT.WS[ws].LN[1].barrels_reload_type = 3; -- BarrelsReloadTypes.SEQUENTIALY
GT.WS[ws].LN[1].depends_on_unit = {{{"SAMP/T NG MRI GF300"},},{{"SAMP/T MRI ARABEL"},},};
GT.WS[ws].LN[1].reactionTime = 1.0;
GT.WS[ws].LN[1].PL[1].ammo_capacity = 8;
GT.WS[ws].LN[1].PL[1].shot_delay = 2.0;
GT.WS[ws].LN[1].PL[1].reload_time = 7200; --seconds, e.g 2h/8 missiles
GT.WS[ws].LN[1].BR[1] = {pos = {4.00, 0.15,-0.95}, drawArgument = 1 };
GT.WS[ws].LN[1].BR[2] = {pos = {4.00, 0.15,-0.40}, drawArgument = 2 };
GT.WS[ws].LN[1].BR[3] = {pos = {3.00, 1.204, 0.614}, drawArgument = 3 };
GT.WS[ws].LN[1].BR[4] = {pos = {3.00, 0.216, 1.045}, drawArgument = 4 };
GT.WS[ws].LN[1].BR[5] = {pos = {3.00, 0.216,-1.045}, drawArgument = 5 };
GT.WS[ws].LN[1].BR[6] = {pos = {3.00, 1.204,-0.614}, drawArgument = 6 };
GT.WS[ws].LN[1].BR[7] = {pos = {3.00, 1.204, 0.614}, drawArgument = 7 };
GT.WS[ws].LN[1].BR[8] = {pos = {3.00, 0.216, 1.045}, drawArgument = 8 };

GT.Name = "SAMP/T NG MLT LN";
GT.DisplayName = _("SAM SAMP/T NG MLT LN (Aster 30 Blk 1NT)");
GT.Rate = 10;

GT.DetectionRange  = 0;
GT.ThreatRange = GT.WS[1].LN[1].distanceMax;
GT.mapclasskey = "P0091000079";
GT.attribute = {wsType_Ground,wsType_SAM,wsType_Miss,
				"AA_missile",
				"SAM LL",
				};
GT.category = "Air Defence";
GT.Countries = {"France", "Italia", "Russia"}