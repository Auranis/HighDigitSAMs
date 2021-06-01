-- SAMP/T Module d'Engagement (Engagement Module)

GT = {};
set_recursive_metatable(GT, GT_t.generic_stationary)
set_recursive_metatable(GT.chassis, GT_t.CH_t.M818);

GT.visual.shape = "SAMPT_ME"
GT.visual.shape_dstr = "SAMPT_Standard_Destroyed"


GT.swing_on_run = false
GT.r_max = 0.46
GT.animation_arguments.alarm_state = -1.0;

--Burning after hit
GT.visual.fire_size = 0.8 --relative burning size
GT.visual.fire_pos[1] = -2.0 -- center of burn at long axis shift(meters)
GT.visual.fire_pos[2] = 0 -- center of burn shift at vertical shift(meters)
GT.visual.fire_pos[3] = 0 -- center of burn at transverse axis shift(meters)
GT.visual.fire_time = 1000 --burning time (seconds)

GT.Name = "SAMP/T ME"
GT.DisplayName = _("SAM SAMP/T ME")
GT.Rate = 20

GT.DetectionRange  = 0;
GT.ThreatRange = 0;
GT.mapclasskey = "P0091000046";
GT.attribute = {wsType_Ground,wsType_Tank,wsType_NoWeapon,
				"Trucks",
				"SAM CC",
				};
GT.category = "Air Defence";
GT.Countries = {"France", "Italia", "Russia"}