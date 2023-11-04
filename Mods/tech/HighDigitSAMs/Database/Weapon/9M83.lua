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

local SA9M83 = {
	Name = SA9M83,
	display_name = _('SA9M83'),
	name = "SA9M83",
	Escort = 3, -- Escort(Requires tracking?): 0 - no, 1 - launch aircraft, 2 - another aircraft, 3 - from the ground
	Head_Type = 8, -- Seeker type code, in our case 6 is for Semi-active radar homing. 1 = Passive IR homing, 2 = Active Radar Homing
	sigma = {30, 30, 30}, -- maximum aiming error in meters, in target coordinates. x - longitudinal axis of the target, y - vertical axis of the target, z - transverse axis of the target
	M = 3500.0, -- Mass of the missile at launch
	H_max = 25000.0, -- Maximum target altitude
	H_min = 25.0, -- minimum target altitude
	Diam = 810.0, -- Missile diameter in cm
	Cx_pil = 8, -- "Cx like pendants" - Moment of inertia??
	D_max = 50000.0, -- Maximum range firing at low altitude, in meters
	D_min = 1000.0, -- minimum range in meters
	Head_Form = 1, -- determines shape of the missile head for drag modeling; 0 for hemispherical, 1 for conical
	Life_Time = 200.0, -- Battery life
	Nr_max = 20, -- Maximum g when turning
	v_min = 0.0, -- Minimum speed in m/s
	v_mid = 1200.0, -- average speed in m/s
	Mach_max = 4.75, -- maximum Mach of the missile
	t_b = 0.3, -- Motor start delay
	t_acc = 5.2, -- motor burn time
	t_marsh = 13.2, -- cruise time, 0.0 if not applicable
	Range_max = 75000.0, -- Max range in meters
	H_min_t = 10.0, -- minimum target height above the terrain, m.
	Fi_start = 3.14152, -- angle of tracking and sighting at launch, in radians
	Fi_rak = 3.14152, -- allowable angle of view of the target, in radians
	Fi_excort = 2.0, -- tracking angle (sighting) of the target by the missile.
	Fi_search = 99.9, -- limit angle of free search
	OmViz_max = 99.9, -- line-of-sight speed limit
	warhead 		= 
	{
		mass 					= 150; 
		expl_mass 				= 150; 
		other_factors 			= {1, 1, 1};
		obj_factors 			= {1, 1};
		concrete_factors 		= {1, 1, 1};
		cumulative_factor 		= 0;
		concrete_obj_factor 	= 0.0;
		cumulative_thickness 	= 0.0;
        piercing_mass			= 60.0;
		caliber					= 500,
	},
	exhaust1 = { 1, 1, 1, 1 },
	X_back = -1.9,
	Y_back = 0.0,
	Z_back = 0.0,
	exhaust2 = { 1, 1, 1, 1 },
	X_back_acc = -3.5,
	Y_back_acc = 0.0,
	Z_back_acc = 0.0,
	Reflection = 0.39,
	KillDistance = 15.0,
	category = CAT_MISSILES,
	ccm_k0       = 0.2,
	wsTypeOfWeapon  = {wsType_Weapon,wsType_Missile,wsType_SA_Missile,WSTYPE_PLACEHOLDER};
	shape_table_data = 
	{
		{
			name	 = "9m83_mod";
			file  	 = "9m83_hds";
			life  	 = 1;
			fire  	 = { 0, 1};
			username = "SA9M83";
			index = WSTYPE_PLACEHOLDER;
		},
	}
};
declare_weapon(SA9M83)

GT_t.WS_t.S300V_9M83 = {} -- S-300VM Antey-2500 (9M83M)
GT_t.WS_t.S300V_9M83.moveable = false
GT_t.WS_t.S300V_9M83.angles = {
					{math.rad(180), math.rad(-180), math.rad(-90), math.rad(90)},
					};
GT_t.WS_t.S300V_9M83.reference_angle_Z = math.rad(90)
GT_t.WS_t.S300V_9M83.LN = {}
GT_t.WS_t.S300V_9M83.LN[1] = {}
GT_t.WS_t.S300V_9M83.LN[1].type = 4
GT_t.WS_t.S300V_9M83.LN[1].distanceMin = 6000
GT_t.WS_t.S300V_9M83.LN[1].distanceMax = 75000
GT_t.WS_t.S300V_9M83.LN[1].ECM_K = 0.3;
GT_t.WS_t.S300V_9M83.LN[1].reactionTime = 2
GT_t.WS_t.S300V_9M83.LN[1].launch_delay = 1;
GT_t.WS_t.S300V_9M83.LN[1].reflection_limit = 0.019;
GT_t.WS_t.S300V_9M83.LN[1].sensor = {}
set_recursive_metatable(GT_t.WS_t.S300V_9M83.LN[1].sensor, GT_t.WSN_t[0])
GT_t.WS_t.S300V_9M83.LN[1].beamWidth = math.rad(1);
GT_t.WS_t.S300V_9M83.LN[1].PL = {}
GT_t.WS_t.S300V_9M83.LN[1].PL[1] = {}
GT_t.WS_t.S300V_9M83.LN[1].PL[1].ammo_capacity = 4
GT_t.WS_t.S300V_9M83.LN[1].PL[1].type_ammunition = SA9M83.wsTypeOfWeapon;
GT_t.WS_t.S300V_9M83.LN[1].PL[1].reload_time = 1000000; -- never during the mission
GT_t.WS_t.S300V_9M83.LN[1].BR = { {pos = {0, 0, 0} } }
