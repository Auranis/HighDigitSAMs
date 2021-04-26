-- s-125 ln

GT = {};
GT_t.ws = 0;
set_recursive_metatable(GT, GT_t.generic_stationary);
set_recursive_metatable(GT.chassis, GT_t.CH_t.STATIC);

GT.visual.shape = "5P73_LAUNCH";
GT.visual.shape_dstr = "5P73_LAUNCH_P_1";

GT.sensor = {};
set_recursive_metatable(GT.sensor, GT_t.SN_visual);
GT.sensor.height = 2.707;

--Burning after hit
GT.visual.fire_size = 0.3; --relative burning size
GT.visual.fire_pos[1] = 0; -- center of burn at long axis shift(meters)
GT.visual.fire_pos[2] = 0; -- center of burn shift at vertical shift(meters)
GT.visual.fire_pos[3] = 0; -- center of burn at transverse axis shift(meters)
GT.visual.fire_time = 500; --burning time (seconds)

-- weapon systems

GT.WS = {};
GT.WS.maxTargetDetectionRange = 28000;

local ws = GT_t.inc_ws();
GT.WS[ws] = {};
GT.WS[ws].center = 'CENTER_TOWER';
GT.WS[ws].angles = {
					{math.rad(180), math.rad(-180), math.rad(0), math.rad(56)},
					};
GT.WS[ws].drawArgument1 = 0;
GT.WS[ws].drawArgument2 = 1;
GT.WS[ws].omegaY = 0.323599;
GT.WS[ws].omegaZ = 0.174533;
GT.WS[ws].reference_angle_Z = math.rad(25);
GT.WS[ws].pidY = { p = 5, i = 0, d = 2, inn = 1};
GT.WS[ws].pidZ = { p = 5, i = 0, d = 2, inn = 1};

__LN = add_launcher(GT.WS[ws], GT_t.LN_t._S125HD);
__LN.depends_on_unit = {{{"snr s-125 tr", 1},},};
__LN.min_launch_angle = math.rad(9);
__LN = nil;

GT.Name = "5p73 V-601P ln";
GT.DisplayName = _("SAM SA-3 (V-601P) S-125 LN");
GT.DisplayNameShort = _("SA-3 (HDS)");
GT.Rate = 5;

GT.DetectionRange  = 0;
GT.ThreatRange = GT.WS[ws].LN[1].distanceMax;
GT.mapclasskey = "P0091000082";
GT.attribute = {wsType_Ground,wsType_SAM,wsType_Miss,SA3_LN,
				"AA_missile",
				"MR SAM",
				"SAM LL",
				};
GT.tags  =
{
    "Air Defence",
	"Launcher",
};
GT.category = "Air Defence";