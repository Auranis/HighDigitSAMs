-- KS-19 100mm Flak Gun
-- Version 1.0
-- Last updated: 13 December 2020
-- Authors: Hextopia, Auranis
GT = {};  --Define new Ground Target
GT_t.ws = 0;
set_recursive_metatable(GT, GT_t.generic_stationary); --Pull definitions/values for generic stationary object
set_recursive_metatable(GT.chassis, GT_t.CH_t.STATIC);
GT.chassis.life = 1;

--Define model used for ground target
GT.visual.shape = "flak18"; --Flak 18 88mm gun used as stand-in for KS-19
GT.visual.shape_dstr = "flak18_p_1";
GT.animation_arguments.alarm_state = -1.0;

--Adds option to put shield on or off in mission editor
GT.AddPropVehicle = {
			{ id = "Shield" , control = 'checkbox', label = _('Shield'), boolean_inverted = false, defValue = false, arg=60} -- boolean_inverted = true by default: element present - argVal=0, absent - argVal=1
		}

--chassis
--Define new sensor for ground target
GT.sensor = {};
GT.sensor.max_range_finding_target = 35000;
GT.sensor.min_range_finding_target = 0;
GT.sensor.max_alt_finding_target = 15000;
GT.sensor.min_alt_finding_target = 0
GT.sensor.height = 2.0;

--Burning after hit
GT.visual.fire_size = 0.08; --relative burning size
GT.visual.fire_pos[1] = -1.9; -- center of burn at long axis shift(meters)
GT.visual.fire_pos[2] = 0.1; -- center of burn shift at vertical shift(meters)
GT.visual.fire_pos[3] = 0; -- center of burn at transverse axis shift(meters)
GT.visual.fire_time = 500; --burning time (seconds)

-- Define new weapon system for ground target
GT.WS = {};
GT.WS.maxTargetDetectionRange = 18000;


-- Radar Assisted tracker				
ws = GT_t.inc_ws();
GT.WS[ws] = {};
set_recursive_metatable(GT.WS[ws], GT_t.WS_t.KS19); --Pull values for KS-19 cannon from cannon.lua to define weapon system, launcher, and launcher sensor for KS-19
GT.WS[ws].center = "CENTER_POINT_01"					
GT.WS[ws].angles = {
                    {math.rad(180), math.rad(-180), math.rad(-3), math.rad(89)},
                    };

GT.WS[ws].LN[1].BR = { {connector_name = "POINT_GUN_01", recoilArgument = 23, recoliTime = 0.4} }

GT.Name = "KS19";
GT.DisplayName = _("AAA 100mm KS-19");
GT.DisplayNameShort = _("KS-19");
GT.Rate = 4;

GT.DetectionRange  = 0;  --Set detection ring range to 0 for mission editor and F-10 map
GT.ThreatRange = GT.WS[1].LN[1].distanceMax; --Pull threat ring range from max distance value for mission editor and F-10 map
GT.mapclasskey = "P0091000015";
GT.attribute = {wsType_Ground,wsType_SAM,wsType_Gun,ZU_23,
                "AA_flak",
                "Static AAA",
                };
GT.category = "Air Defence";
GT.tags = { "Air Defence", "AAA", };
GT.Countries = {"Bulgaria", "Czech Republic", "Germany", "Hungary", "Poland", "Romania", "USSR", "China", "Vietnam", "Iran", "Pakistan", "Russia"}
