-- HQ-2 Guideline

GT = {};
GT_t.ws = 0;
set_recursive_metatable(GT, GT_t.generic_stationary);
set_recursive_metatable(GT.chassis, GT_t.CH_t.STATIC);

GT.visual.shape = "S_75_Launcher";
GT.visual.shape_dstr = "S_75_Launcher_p_1";

GT.toggle_alarm_state_interval = 0.01;
GT.animation_arguments.alarm_state = -1;

GT.sensor = {};
set_recursive_metatable(GT.sensor, GT_t.SN_visual);
GT.sensor.height = 2.617;

--Burning after hit
GT.visual.fire_size = 0.8; --relative burning size
GT.visual.fire_pos[1] = 1.575; -- center of burn at long axis shift(meters)
GT.visual.fire_pos[2] = 0; -- center of burn shift at vertical shift(meters)
GT.visual.fire_pos[3] = 0; -- center of burn at transverse axis shift(meters)
GT.visual.fire_time = 500; --burning time (seconds)


-- weapon systems
GT.WS = {};
GT.WS.maxTargetDetectionRange = 65000;

local ws = GT_t.inc_ws();
GT.WS[ws] = {};
--GT.WS[ws].center = 'CENTER_TOWER';
GT.WS[ws].pos = {0.0, 1.7, 0.0}
GT.WS[ws].angles = {
					{math.rad(180), math.rad(-180), math.rad(0), math.rad(80.0)},
					};
GT.WS[ws].drawArgument1 = 0;
GT.WS[ws].drawArgument2 = 1;
GT.WS[ws].omegaY = 0.323599;
GT.WS[ws].omegaZ = 0.174533;
GT.WS[ws].reference_angle_Z = math.rad(30.6);
GT.WS[ws].reloadAngleY = 0.0;
GT.WS[ws].reloadAngleZ = 0.0;
GT.WS[ws].pidY = { p = 5, i = 0, d = 2, inn = 1};
GT.WS[ws].pidZ = { p = 5, i = 0, d = 2, inn = 1};

local __LN = add_launcher(GT.WS[ws], GT_t.LN_t._HQ2);
__LN.min_launch_angle = math.rad(9);
__LN.launch_delay = 5;
__LN.depends_on_unit = {{{"HQ_2_TR", 1},},{{"SNR_75V", 1},}};
__LN.BR = {
	{connector_name = 'POINT_ROCKET'},
		};
__LN = nil;
	
GT.Name = "HQ_2_Guideline_LN";
GT.DisplayName = _("SAM HQ-2 LN SM-90");
GT.Rate = 10;

GT.DetectionRange  = 0;
GT.ThreatRangeMin = GT.WS[1].LN[1].distanceMin;
GT.ThreatRange = GT.WS[1].LN[1].distanceMax;
GT.mapclasskey = "P0091000082";
GT.attribute = {wsType_Ground,wsType_SAM,wsType_Miss, SA3_LN,
				"AA_missile",
				"LR SAM",
				"SAM LL",
                };
GT.category = "Air Defence";
GT.tags  =
{
    "Air Defence",
	"Launcher",
};
GT.Countries = {"China", "Iran", "Pakistan"}
