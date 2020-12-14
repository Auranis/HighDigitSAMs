-- SON-9 FIRE CAN Gun Laying RADAR
-- Version 1.0
-- Last updated: 13 December 2020
-- Authors: Hextopia, Auranis

GT = {};--Define new Ground Target
GT_t.ws = 0;
set_recursive_metatable(GT, GT_t.generic_track_vehicle);--Pull definitions/values for generic tracked vehicle because of Dog ear model, probably could use static definition
set_recursive_metatable(GT.chassis, GT_t.CH_t.MTLB);

GT.visual.shape = "Sborka"; --Dog Ear used as stand-in model
GT.visual.shape_dstr = "Sborka_P_1";

--Seems to be capable of targetting for up to 6 KS-19 guns at once
--chassis
--Sets radar antenna rotation properties
GT.swing_on_run = false;
GT.animation_arguments.locator_rotation = 11;
GT.radar_rotation_period = 3.0;
GT.snd.radarRotation = "RadarRotation";

--Defines new sensor for vehicle
GT.sensor = {};
GT.sensor.max_range_finding_target = 35000;
GT.sensor.min_range_finding_target = 100;
GT.sensor.max_alt_finding_target = 15000;
GT.sensor.height = 3.8;

--Burning after hit
GT.visual.fire_size = 0.6; --relative burning size
GT.visual.fire_pos[1] = 0; -- center of burn at long axis shift(meters)
GT.visual.fire_pos[2] = 0; -- center of burn shift at vertical shift(meters)
GT.visual.fire_pos[3] = 0; -- center of burn at transverse axis shift(meters)
GT.visual.fire_time = 900; --burning time (seconds)
GT.visual.dust_pos = {2.7, 0.0, -GT.chassis.Z_gear_1}
GT.visual.dirt_pos = {-2.8, 0.4, -GT.chassis.Z_gear_2}
GT.animation_arguments.crew_presence = 50;

-- weapon systems

--Defines new weapon system for vehicle, placeholder since it doesn't get any actual weapons.
GT.WS = {};
GT.WS.maxTargetDetectionRange = 35000;
GT.WS.radar_type = 104;
GT.WS.radar_rotation_type = 0;

local ws  = 0;

    ws = GT_t.inc_ws();
	GT.WS[ws] = {}
    GT.WS[ws].pos = {0,3,0}
	GT.WS[ws].angles = {
					{math.rad(180), math.rad(-180), 0, math.rad(89)}, --Sets volume that weapon system can target within
					};
    GT.WS[ws].omegaY = 1
    GT.WS[ws].omegaZ = 1

    GT.WS[ws].LN = {}
    GT.WS[ws].LN[1] = {}
    GT.WS[ws].LN[1].type = 101
    GT.WS[ws].LN[1].reactionTime = 12;
    GT.WS[ws].LN[1].distanceMin = GT.sensor.min_range_finding_target;
    GT.WS[ws].LN[1].distanceMax = GT.sensor.max_range_finding_target;
	GT.WS[ws].LN[1].ECM_K = 0.5;  --Jammer reduces SON-9 range by 50%, not sure if this works correctly 
	GT.WS[ws].LN[1].reflection_limit = 0.18;  --RCS minimum to see and engage target, set same as fan song
    GT.WS[ws].LN[1].min_trg_alt = 300
    GT.WS[ws].LN[1].max_trg_alt = GT.sensor.max_alt_finding_target;

GT.Name = "Fire Can radar";
GT.DisplayName = _("AAA SON-9 Fire Can");
GT.Rate = 15;

GT.Sensors = { OPTIC = {"generic tank daysight"}, RADAR = {"SON-9 Fire Can TR"}, };

GT.DetectionRange  = GT.sensor.max_range_finding_target;  --Sets detection ring (yellow) for editor and F-10 map, value pulled from max sensor range
GT.ThreatRange = 0;
GT.mapclasskey = "P0091000046";
GT.attribute = {wsType_Ground,wsType_SAM,wsType_Radar_Gun,Shilka_,
				"AA_flak",
                "Mobile AAA",
                "SAM SR",
                "RADAR_BAND1_FOR_ARM",
				};
GT.category = "Air Defence";
GT.Countries = {"Bulgaria", "Czech Republic", "Germany", "Hungary", "Poland", "Romania", "USSR", "China", "Vietnam", "Iran", "Pakistan", "Russia"}
