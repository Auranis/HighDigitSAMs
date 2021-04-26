-- Igla-S Russia Manpad

GT = {};
GT_t.ws = 0;
set_recursive_metatable(GT, GT_t.generic_human);
set_recursive_metatable(GT.chassis, GT_t.CH_t.HUMAN);
GT.animation = {};
set_recursive_metatable(GT.animation, GT_t.CH_t.HUMAN_ANIMATION);

GT.visual.shape = "soldier_ru_03";
GT.visual.shape_dstr = "soldier_ru_03_d";

GT.mobile = true;
				
GT.sensor = {};
set_recursive_metatable(GT.sensor, GT_t.SN_visual);

-- weapon systems

GT.WS = {};
GT.WS.maxTargetDetectionRange = 7500;
GT.WS.fire_on_march = false;

local ws = GT_t.inc_ws();
GT.WS[ws] = {};
set_recursive_metatable(GT.WS[ws], GT_t.WS_t.igla_s_manpad);
GT.WS[ws].cockpit = {"IglaSight/IglaSight", {0.0, 0.0, 0.0}}
GT.WS[ws].pointer = "camera";
local __LN = GT.WS[ws].LN[1]
__LN.BR[1].connector_name = "POINT_LAUNCHER";
__LN.sightMasterMode = 1;
__LN.sightIndicationMode = 1;

GT.Name = "SA-24 Igla-S manpad";
GT.DisplayName = _('MANPADS SA-24 Igla-S "Grinch"');
GT.DisplayNameShort = _('SA-24');
GT.Rate = 5;

GT.DetectionRange  = GT.sensor.max_range_finding_target;
GT.ThreatRange = GT.WS[1].LN[1].distanceMax;
GT.mapclasskey = "P0091000202";

GT.attribute = {wsType_Ground,wsType_SAM,wsType_Miss,IglaRUS_1,
				"MANPADS",
				"IR Guided SAM",
				"New infantry",
				};
				
GT.category = "Air Defence";
GT.tags = { "Air Defence", "MANPADS" };
GT.Transportable = {
	size = 100
}