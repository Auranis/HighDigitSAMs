--Cannon Launchers
-- Version 1.0
-- Last updated: 13 December 2020
-- Authors: Hextopia, Auranis

--Two trackers doesn't work as expected, best way to use this gun is setup as requiring external radar guidance to fire on targets currently
--Leaving this here in-case the upcoming flak guns being added adds this functionality
-- --Optical Tracker              
-- local ws = GT_t.inc_ws();
-- local base = ws;
-- GT.WS[ws] = {};
-- GT.WS[ws].pos = {0, 1.0, 0};
-- GT.WS[ws].omegaY = math.rad(20);
-- GT.WS[ws].omegaZ = math.rad(12);
-- GT.WS[ws].pidY = {p=100, i=0.05, d=12, inn = 50};
-- GT.WS[ws].pidZ = {p=100, i=0.05, d=12, inn = 50};
-- GT.WS[ws].angles = {
--                     {math.rad(180), math.rad(-180), math.rad(-3), math.rad(89)},
--                    };
-- GT.WS[ws].LN = {};
-- GT.WS[ws].LN[1] = {};
-- GT.WS[ws].LN[1].sensor = {}
-- -- GT.WS[ws].LN[1].sensor.deviation_error_azimuth = 0.001
-- -- GT.WS[ws].LN[1].sensor.deviation_error_elevation = 0.001
-- -- GT.WS[ws].LN[1].sensor.deviation_error_speed_sensor = 0.2
-- -- GT.WS[ws].LN[1].sensor.deviation_error_stability = 0.01
-- -- GT.WS[ws].LN[1].sensor.deviation_error_distance = 0.1
-- GT.WS[ws].LN[1].type = 103;
-- GT.WS[ws].LN[1].distanceMin = 10
-- GT.WS[ws].LN[1].distanceMax = 15000
-- GT.WS[ws].LN[1].max_trg_alt = 10600
-- GT.WS[ws].LN[1].reactionTime = 10

-- KS-19 100mm Flak Gun
GT_t.LN_t.KS19 = {} 
GT_t.LN_t.KS19.type = 11  -- heavy AA gun
GT_t.LN_t.KS19.distanceMin = 10
GT_t.LN_t.KS19.distanceMax = 15000
GT_t.LN_t.KS19.max_trg_alt = 12700
GT_t.LN_t.KS19.sensor = {}
-- GT_t.LN_t.KS19.sensor.deviation_error_azimuth = 0 --Test Values
-- GT_t.LN_t.KS19.sensor.deviation_error_elevation = 0
-- GT_t.LN_t.KS19.sensor.deviation_error_speed_sensor = 0
-- GT_t.LN_t.KS19.sensor.deviation_error_stability = 0
-- GT_t.LN_t.KS19.sensor.deviation_error_distance = 0

--Low deviation values used to help make KS-19's feel appropriately deadly
--Especially since we can't have different accuracy values unless we use separate launchers, which I haven't had success getting to work with two guns on one unit
--Hopefully this functionality is added when the new flak guns are added
GT_t.LN_t.KS19.sensor.deviation_error_azimuth = 0.00035
GT_t.LN_t.KS19.sensor.deviation_error_elevation = 0.00035
GT_t.LN_t.KS19.sensor.deviation_error_speed_sensor = 0.0025
GT_t.LN_t.KS19.sensor.deviation_error_stability = 0.02
GT_t.LN_t.KS19.sensor.deviation_error_distance = 0.01
GT_t.LN_t.KS19.reactionTime = 3
GT_t.LN_t.KS19.depends_on_unit = {{{"Fire Can radar", 1},},}; --Launcher will not target or shoot without Fire Can also seeing/targetting
GT_t.LN_t.KS19.PL = {}
GT_t.LN_t.KS19.PL[1] = {
							shell_name = {"100mm_FLAK"},
							automaticLoader = false,
							shot_delay = 60/20,
							ammo_capacity = 200,
							portionAmmoCapacity = 200
						}

--KS-19 100mm Flak Gun
GT_t.WS_t.KS19 = {}
GT_t.WS_t.KS19.pos = {0.0, 1.0, 0.0}
GT_t.WS_t.KS19.omegaY = math.rad(20);
GT_t.WS_t.KS19.omegaZ = math.rad(12);
GT_t.WS_t.KS19.angles = {
                    {math.rad(180), math.rad(-180), math.rad(-3), math.rad(89)},
                    };
GT_t.WS_t.KS19.drawArgument1 = 0
GT_t.WS_t.KS19.drawArgument2 = 1
GT_t.WS_t.KS19.reference_angle_Z = math.rad(5)
GT_t.WS_t.KS19.pidY = GT_t.AAA_PIDY
GT_t.WS_t.KS19.pidZ = GT_t.AAA_PIDZ
GT_t.WS_t.KS19.LN = {{}}
set_recursive_metatable(GT_t.WS_t.KS19.LN[1], GT_t.LN_t.KS19)
-- end of Launchers

