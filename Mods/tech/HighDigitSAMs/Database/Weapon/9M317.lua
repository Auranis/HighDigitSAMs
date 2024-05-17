-- Missile
local function calcPiercingMass(warhead)
	warhead.piercing_mass  = warhead.mass;
	if (warhead.expl_mass/warhead.mass > 0.1) then
		warhead.piercing_mass  = warhead.mass/5.0;
	end
end

local function simple_aa_warhead(power, caliber) -- By Saint
    local res = {};

	res.caliber = caliber
	res.mass = power; --old explosion damage effect
    res.expl_mass = power;
    res.other_factors = {1, 1, 1};
    res.obj_factors = {1, 1};
    res.concrete_factors = {1, 1, 1};
    res.cumulative_factor = 0;
    res.concrete_obj_factor = 0.0;
    res.cumulative_thickness = 0.0;
    
	calcPiercingMass(res)
    return res;
end

local SA9M317 = {
	Name = SA9M317, --9M317 Buk-M1-2
	display_name = _('9M317 Buk-M2 (SA-17 Grizzly)'),
	display_name_short = _('9M317 Buk-M2 (SA-17 Grizzly)'),
	name = "SA9M317",
	Escort = 3,
	Head_Type = 6,
	sigma = {25, 25, 25},
	M = 715,
	H_max = 50000.0,
	H_min = 15.0,
	Diam = 400.0,
	Cx_pil = 4,
	D_max = 30000.0,
	D_min = 3000.0,
	Head_Form = 1,
	Life_Time = 80.0,
	Nr_max = 24,
	v_min = 200.0,
	v_mid = 900.0,
	Mach_max = 3.8,
	t_b = 0.0,
	t_acc = 7.0,
	t_marsh = 11.0,
	Range_max = 50000.0,
	H_min_t = 15.0,
	Fi_start = 3.14152,
	Fi_rak = 3.14152,
	Fi_excort = 1.05,
	Fi_search = 99.9,
	OmViz_max = 99.9,
	warhead = simple_aa_warhead(59.0),
	exhaust1 = { 1, 1, 1, 0.5 },
	exhaust2 = { 0.5, 0.5, 0.5, 0.5 },
	X_back = -2.85,
	Y_back = 0.0,
	Z_back = 0.0,
	Reflection = 0.0918,
	KillDistance = 13,
	ccm_k0       = 0.5,
    PN_coeffs = {
        3,                 -- Number of Entries
        7408.0 ,1.0,       -- Less 4 NM to target Pn = 1
        10000.0, 0.5,      -- Between 10 and 5 km  to target, Pn smoothly changes from 0.5 to 1.0. 
    	25000.0, 0.3
    }; -- Between 15 and 8 km  to target, Pn smoothly changes from 0.2 to 0.5. Longer then 15 km Pn = 0.2.
	category = CAT_MISSILES,
	wsTypeOfWeapon  = {wsType_Weapon,wsType_Missile,wsType_SA_Missile,WSTYPE_PLACEHOLDER};
	shape_table_data = 
	{
		{
			name	 = "9M38M1";
			file  	 = "9M38M1";
			life  	 = 1;
			fire  	 = { 0, 1};
			username = "9M317";
			index = WSTYPE_PLACEHOLDER;
		},
	}
};
declare_weapon(SA9M317)

GT_t.LN_t._9A310M12 = {} -- 9K317 Buk-M1-2 (SA-17 Grizzly)
GT_t.LN_t._9A310M12.type = 4;
GT_t.LN_t._9A310M12.xc = -3.26;
GT_t.LN_t._9A310M12.distanceMin = 3000;
GT_t.LN_t._9A310M12.distanceMax = 50000;
GT_t.LN_t._9A310M12.reactionTime = 1;
GT_t.LN_t._9A310M12.launch_delay = 2;
GT_t.LN_t._9A310M12.maxShootingSpeed = 0;
GT_t.LN_t._9A310M12.show_external_missile = true;
GT_t.LN_t._9A310M12.sensor = {};
set_recursive_metatable(GT_t.LN_t._9A310M12.sensor, GT_t.WSN_t[0]);
GT_t.LN_t._9A310M12.reflection_limit = 0.02;
GT_t.LN_t._9A310M12.ECM_K = -1
GT_t.LN_t._9A310M12.barrels_reload_type = 3 -- BarrelsReloadTypes.SEQUENTIALY;
GT_t.LN_t._9A310M12.PL = {};
GT_t.LN_t._9A310M12.PL[1] = {};
GT_t.LN_t._9A310M12.PL[1].ammo_capacity = 4;
GT_t.LN_t._9A310M12.PL[1].type_ammunition = SA9M317.wsTypeOfWeapon;
GT_t.LN_t._9A310M12.PL[1].reload_time = 13*60; -- 13 minutes
GT_t.LN_t._9A310M12.PL[1].shot_delay = 0.1;
GT_t.LN_t._9A310M12.BR = {
                    {pos = {-1.477, 0.459,-1.08}, drawArgument = 4},
                    {pos = {-1.477, 0.459,-0.38}, drawArgument = 5},
                    {pos = {-1.477, 0.459, 0.43}, drawArgument = 6},
                    {pos = {-1.477, 0.459, 1.15}, drawArgument = 7},
                };