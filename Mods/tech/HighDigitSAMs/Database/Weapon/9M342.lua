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

local SA9M342 = {
	category		= CAT_MISSILES,
	name			= "Igla_S",
	user_name		= _("9M342 Igla-S"),
	scheme			= "self_homing_spin_missile2",
	class_name		= "wAmmunitionSelfHoming",
	model			= "9m39",
	mass			= 11.7,
	
	wsTypeOfWeapon  = {wsType_Weapon,wsType_Missile,wsType_SA_Missile,WSTYPE_PLACEHOLDER};
	
	Escort = 0,
	Head_Type = 1,
	sigma = {4, 4, 4},
	M = 11.7,
	H_max = 3500.0,
	H_min = 1.0,
	Diam = 72.0,
	Cx_pil = 1,
	D_max = 5500.0,
	D_min = 500.0,
	Head_Form = 1,
	Life_Time = 17.0,
	Nr_max = 16,
	v_min = 70.0,
	v_mid = 570.0,
	Mach_max = 2.2,
	t_b = 0.0,
	t_acc = 3.0,
	t_marsh = 4.0,
	Range_max = 5500.0,
	H_min_t = 10.0,
	Fi_start = math.rad(1),
	Fi_rak = 3.14152,
	Fi_excort = 0.7,
	Fi_search = 99.9,
	OmViz_max = 99.9,
	warhead = {
		mass					= 2.5,
		expl_mass				= 2.5,
		caliber					= 72,
		other_factors			= { 1.0, 1.0, 1.0 },
		obj_factors				= { 1.0, 1.0 },
		concrete_factors		= { 1.0, 1.0, 1.0 },
		cumulative_factor		= 0.0,
		concrete_obj_factor		= 0.0,    
		cumulative_thickness	= 0.0,
		piercing_mass 			= 2.5,
		time_self_destruct		= 17,
	},
	warhead_air = {
		mass					= 2.5,
		expl_mass				= 2.5,
		caliber					= 72,
		other_factors			= { 1.0, 1.0, 1.0 },
		obj_factors				= { 1.0, 1.0 },
		concrete_factors		= { 1.0, 1.0, 1.0 },
		cumulative_factor		= 0.0,
		concrete_obj_factor		= 0.0,    
		cumulative_thickness	= 0.0,
		piercing_mass 			= 2.5,
		time_self_destruct		= 17,
	},
	
	X_back = -0.781,
	Y_back = 0.0,
	Z_back = 0.0,
	Reflection = 0.01,
	KillDistance = 1.0,
	--seeker sensivity params
	SeekerSensivityDistance = 14000, -- The range of target with IR value = 1. In meters.
	ccm_k0 = 0.1,  -- Counter Countermeasures Probability Factor. Value = 0 - missile has absolutely resistance to countermeasures. Default = 1 (medium probability)
	shape_table_data = 
	{
		{
			name	 = "iglaS";
			file  	 = "9m39";
			life  	 = 1;
			fire  	 = { 0, 1};
			username = "SA9M342";
			index = WSTYPE_PLACEHOLDER;
		},
	},
	
	controller = {
		boost_start = 0.001,
		march_start = 0.40,
		march2_start = 2.0,
	},
	
	booster = {
		impulse								= 170,
		fuel_mass							= 0.22,
		work_time							= 0.048,
		boost_time							= 0,
		boost_factor						= 0,
		nozzle_position						= {{-0.8, 0.0, 0}},
		nozzle_orientationXYZ				= {{0.0, 0.0, 0.0}},
		tail_width							= 0.4,
		smoke_color							= {1.0, 1.0, 1.0},
		smoke_transparency					= 0.9,
		custom_smoke_dissipation_factor		= 0.3,				
	},
		
	march = {
		impulse								= 300,
		fuel_mass							= 2.5,
		work_time							= 2.4,
		boost_time							= 0,
		boost_factor						= 0,
		nozzle_position						= {{-0.8, 0.0, 0.0}},
		nozzle_orientationXYZ				= {{0.0, 0.0, 0.0}},
		tail_width							= 0.2,
		smoke_color							= {1.0, 1.0, 1.0},
		smoke_transparency					= 0.9,
		custom_smoke_dissipation_factor		= 0.3,	
	},
	
	march2 = {
		impulse								= 215,
		fuel_mass							= 2.0,
		work_time							= 6.0,
		boost_time							= 0,
		boost_factor						= 0,
		nozzle_position						= {{-0.8, 0.0, 0.0}},
		nozzle_orientationXYZ				= {{0.0, 0.0, 0.0}},
		tail_width							= 0.2,
		smoke_color							= {1.0, 1.0, 1.0},
		smoke_transparency					= 0.7,
		custom_smoke_dissipation_factor		= 0.3,	
	},

	fm = {
		mass        = 11.7,  
		caliber     = 0.072,  
		cx_coeff    = {1,1.15,0.6,0.4,1.5},
		L           = 1.68,
		I           = 1 / 12 * 10.6 * 1.68 * 1.68,
		Ma          = 0.6,
		Mw          = 1.2,
		Sw			= 0.2,
		dCydA		= {0.07, 0.036},
		A			= 0.6,
		maxAoa		= 0.3,
		finsTau		= 0.1,
		freq		= 20,
	},
	
	simple_IR_seeker = {
		sensitivity		= 12000,
		cooled			= true,
		delay			= 0.0,
		GimbLim			= math.rad(30),
		FOV				= math.rad(2);
		opTime			= 14.0,
		target_H_min	= 0.0,
		flag_dist		= 150.0,
		abs_err_val		= 3,
		ground_err_k	= 3,
		ccm_k0 			= 0.1,
	},
	
	simple_gyrostab_seeker = {
		omega_max	= math.rad(8)
	},
	
	fuze_proximity = {
		ignore_inp_armed	= 1,
		radius				= 3,
	},
	
	autopilot = {
		K				= 1.4,
		Kg				= 0.2,
		Ki				= 0.0,
		finsLimit		= 0.05,
		delay			= 0.5,
		fin2_coeff		= 0.5,
	},
};
declare_weapon(SA9M342)

GT_t.LN_t.igla_s = {}
GT_t.LN_t.igla_s.type = 4
GT_t.LN_t.igla_s.distanceMin = 500
GT_t.LN_t.igla_s.distanceMax = 6000
GT_t.LN_t.igla_s.reactionTime = 2;
GT_t.LN_t.igla_s.launch_delay = 1;
GT_t.LN_t.igla_s.maxShootingSpeed = 0
GT_t.LN_t.igla_s.reflection_limit = 0.22
GT_t.LN_t.igla_s.ECM_K = -1
GT_t.LN_t.igla_s.min_launch_angle = math.rad(-20);
GT_t.LN_t.igla_s.inclination_correction_upper_limit = math.rad(0);
GT_t.LN_t.igla_s.inclination_correction_bias = (0);
GT_t.LN_t.igla_s.sensor = {}
set_recursive_metatable(GT_t.LN_t.igla_s.sensor, GT_t.WSN_t[0])
GT_t.LN_t.igla_s.PL = {}
GT_t.LN_t.igla_s.PL[1] = {}
GT_t.LN_t.igla_s.PL[1].ammo_capacity = 3
GT_t.LN_t.igla_s.PL[1].shot_delay = 0.01
GT_t.LN_t.igla_s.PL[1].reload_time = 120
GT_t.LN_t.igla_s.PL[1].type_ammunition = SA9M342.wsTypeOfWeapon;
GT_t.LN_t.igla_s.PL[1].automaticLoader = false
GT_t.LN_t.igla_s.BR = { { pos = {1, 0, 0}, drawArgument = 4}, }

GT_t.WS_t.igla_s_manpad = {};
GT_t.WS_t.igla_s_manpad.pos = {-0.071, 1.623,0};
GT_t.WS_t.igla_s_manpad.angles = {
					{math.rad(180), math.rad(-180), math.rad(-45), math.rad(80)},
					};
GT_t.WS_t.igla_s_manpad.drawArgument1 = 0;
GT_t.WS_t.igla_s_manpad.drawArgument2 = 1;
GT_t.WS_t.igla_s_manpad.omegaY = 1.5;
GT_t.WS_t.igla_s_manpad.omegaZ = 1.5;
GT_t.WS_t.igla_s_manpad.pidY = {p=40,i=1.0,d=7, inn = 5};
GT_t.WS_t.igla_s_manpad.pidZ = {p=40,i=1.0,d=7, inn = 5};
GT_t.WS_t.igla_s_manpad.reloadAngleY = -100; -- not constrained
GT_t.WS_t.igla_s_manpad.LN = {};
GT_t.WS_t.igla_s_manpad.LN[1] = {};
set_recursive_metatable(GT_t.WS_t.igla_s_manpad.LN[1], GT_t.LN_t.igla_s);
GT_t.WS_t.igla_s_manpad.LN[1].PL[1].shot_delay = 13;