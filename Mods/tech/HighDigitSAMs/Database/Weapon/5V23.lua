-- Missile V759(5V23)
-- By Auranis
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

local SA2V759 = {
	category = CAT_MISSILES,
	name = "SA2V759",
	display_name = _("SA2V759"),
	wsTypeOfWeapon  = {wsType_Weapon,wsType_Missile,wsType_SA_Missile,WSTYPE_PLACEHOLDER};
	Escort = 3,
	Head_Type = 6,
	sigma = {250, 250, 250},
	M = 2406.0,
	H_max = 30000.0,
	H_min = 100,
	Diam = 500.0,
	Cx_pil = 1,
	D_max = 45000.0,
	D_min = 6000.0,
	Head_Form = 1,
	Life_Time = 90.0,
	Nr_max = 5,
	v_min = 170.0,
	v_mid = 338.0,
	Mach_max = 3.5,
	t_b = 0.0,
	t_acc = 5.0, --Is 3 seconds in reality, but 1st stage cutoff is at 550 m/s, so 5 seconds gives us a more realistic acceleration profile.
	t_marsh = 35.0,
	Range_max = 56000.0,
	H_min_t = 100.0,
	Fi_start = 3.14152,
	Fi_rak = 3.14152,
	Fi_excort = 0.75,
	Fi_search = 99.9,
	OmViz_max = 99.9,
	ccm_k0 = 2.0,
	
	-- Below I am attempting to roughly simulate the half-lead command guidance mode
	-- At launch the missile assumes a half-lead trajectory
	-- as the missile approaches the target, the missile point-of-aim also approaches the target
	-- ideally this would be simulated by a smooth transition of PN 0.5 to 1.0 from launch to impact,
	-- but there is a problem: I cannot set a variable coefficient range
	-- As a compromise, I am having the missile start transitioning at roughly twice its minimum range.
	-- For our simulation, the PN peaks at 1.0 at range 2000 meters, then drops off to 0.8 before impact.
	-- This helps simulate the latency in the guidance system, and how that makes out-maneuvering the missile possible IRL.
	PN_coeffs = {3,
					1000.0, 0.8, --
					2000.0 ,1.0,
					12000.0, 0.5},
	warhead 		= 
	{
		mass 					= 302; 
		expl_mass 				= 302; -- aa warhead, need to enhance for effect on F-14
		other_factors 			= {1, 1, 1};
		obj_factors 			= {1, 1};
		concrete_factors 		= {1, 1, 1};
		cumulative_factor 		= 0;
		concrete_obj_factor 	= 0.0;
		cumulative_thickness 	= 0.0;
		piercing_mass			= 40.0;
		caliber					= 500,
	},
	exhaust1 = { 1, 1, 1, 1 },
	X_back = -3.463,
	Y_back = 0.0,
	Z_back = 0.0,
	exhaust2 = {0.9, 0.9, 0.9, 0.05 },
	X_back_acc = -6.0,
	Y_back_acc = 0.0,
	Z_back_acc = 0.0,
	Reflection = 0.3967,
	KillDistance = 65.0,
	shape_table_data = 
	{
		{
			name	 = "S_75_Rocket_V759";
			file  	 = "S_75_Rocket";
			life  	 = 1;
			fire  	 = { 0, 1};
			username = "SA2V759";
			index = WSTYPE_PLACEHOLDER;
		},
	},
	
	fuze_proximity = {
		ignore_inp_armed	= 1,
		radius				= 65,
	},
};
declare_weapon(SA2V759)

GT_t.LN_t._S75 = {} -- S-75M Volkhov
GT_t.LN_t._S75.type = 4;
GT_t.LN_t._S75.xc = -3.26;
GT_t.LN_t._S75.distanceMin = 3000;
GT_t.LN_t._S75.distanceMax = 50000;
GT_t.LN_t._S75.reactionTime = 1;
GT_t.LN_t._S75.launch_delay = 2;
GT_t.LN_t._S75.maxShootingSpeed = 0;
GT_t.LN_t._S75.show_external_missile = true;
GT_t.LN_t._S75.sensor = {};
set_recursive_metatable(GT_t.LN_t._S75.sensor, GT_t.WSN_t[0]);
GT_t.LN_t._S75.reflection_limit = 0.02;
GT_t.LN_t._S75.ECM_K = -1
GT_t.LN_t._S75.barrels_reload_type = 3 -- BarrelsReloadTypes.SEQUENTIALY;
GT_t.LN_t._S75.PL = {};
GT_t.LN_t._S75.PL[1] = {};
GT_t.LN_t._S75.PL[1].ammo_capacity = 4;
GT_t.LN_t._S75.PL[1].type_ammunition = SA2V759.wsTypeOfWeapon;
GT_t.LN_t._S75.PL[1].reload_time = 13*60; -- 13 minutes
GT_t.LN_t._S75.PL[1].shot_delay = 0.1;
GT_t.LN_t._S75.BR = {
                    {pos = {-1.477, 0.459,-1.08}, drawArgument = 4},
                    {pos = {-1.477, 0.459,-0.38}, drawArgument = 5},
                    {pos = {-1.477, 0.459, 0.43}, drawArgument = 6},
                    {pos = {-1.477, 0.459, 1.15}, drawArgument = 7},
                };