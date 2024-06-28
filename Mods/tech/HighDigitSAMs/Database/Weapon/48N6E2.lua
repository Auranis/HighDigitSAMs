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

local SA48N6E2 = {
	Cx_pil = 8,
	D_max = 100000, -- Maximum range firing at low altitude, in meters
	D_min = 6000, -- minimum range in meters
	Damage = 357.5,
	Diam = 519, -- Missile diameter in mm
	Escort = 3, -- Escort(Requires tracking?): 0 - no, 1 - launch aircraft, 2 - another aircraft, 3 - from the ground
	Fi_excort = 2, -- tracking angle (sighting) of the target by the missile.
	Fi_rak = 3.14152, -- allowable angle of view of the target, in radians
	Fi_search = 99.9, -- limit angle of free search
	Fi_start = 3.14152, -- angle of tracking and sighting at launch, in radians
	H_max = 30000, -- Maximum target altitude
	H_min = 10, -- minimum target altitude
	H_min_t = 10, -- minimum target height above the terrain, m.
	Head_Form = 1, -- determines shape of the missile head for drag modeling; 0 for hemispherical, 1 for conical
	Head_Type = 8, -- Seeker type code, in our case 6 is for Semi-active radar homing. 1 = Passive IR homing, 2 = Active Radar Homing
	KillDistance = 25,
	Life_Time = 200, -- Battery life
	M = 1780, -- Mass of the missile at launch
	Mach_max = 8.6, -- maximum Mach of the missile. 
	ModelData = { 58, 2.1, 0.047, 0.092, 0.014, -0.015, 0.72, 1.13, 0.8, 0.01, 0.21, 0.3, 0.3, 0.9, 0, 11.2, 0, 0, 0, 1000000000, 0, 0, 93.75, 0, 0, 0, 0, 0, 0, 230000, 0, 0, 0, 0, 1000000000, 200, 0, 0.5, 1000000000, 1000000000, 0, 650, 25, 1.19, 1, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 },
	Name = SA48N6E2, --48N6
	Nr_max = 25, -- Maximum g when turning
	OmViz_max = 99.9, -- line-of-sight speed limit
	--PN_gain = 1,
	Range_max = 200000, -- Max range in meters
	Reflection = 0.2,
	X_back = -5.681,
	Y_back = 0,
	Z_back = 0,
	_unique_resource_name = "weapons.missiles.SA48H6E2",
	ccm_k0 = 0.2, -- Countermeasures effectiveness
	display_name = _('48N6E2 S-300PMU-2 (SA-20B Gargoyle)'),
	display_name_short = _('48N6E2 (SA-20B Gargoyle)'),
	exhaust = { 1, 1, 1, 1 },
	exhaust_effect_type = 1,
	name = "SA48N6E2",
	nozzle_exit_area = 0.148,
	sigma = { 50, 50, 50 },
	supersonic_A_coef_skew = 0.17,
	t_acc = 11.2, -- motor burn time
	t_b = 0.9, -- Motor start delay
	t_marsh = 0, -- cruise time, 0.0 if not applicable
	v_mid = 1000,
	v_min = 170,
	warhead = simple_aa_warhead(143.0),

    PN_coeffs = {
       4,                 -- Number of Entries
       2000.0 ,1.0,       -- Less 2 km to target use lead pursuit
       10000.0, 0.5,      -- Between 10 and 2 km  to target, Pn smoothly changes from 0.5 to 1.0. 
       30000.0, 0.2,      -- Between 30 and 10 km  to target, Pn smoothly changes from 0.1 to 0.5. 
    }; --Longer then 30 km missile files pure pursuit.
	wsTypeOfWeapon  = {wsType_Weapon,wsType_Missile,wsType_SA_Missile,WSTYPE_PLACEHOLDER};
	shape_table_data = 
	{
		{
			name	 = "48N6E2";
			file  	 = "48h6e2_hds";
			life  	 = 1;
			fire  	 = { 0, 1};
			username = "48N6E2";
			index = WSTYPE_PLACEHOLDER;
		},
	}
};
declare_weapon(SA48N6E2)

GT_t.WS_t.S_300PMU2 = {} -- S-300PMUB (SA-20B Gargoyle)
GT_t.WS_t.S_300PMU2.moveable = false
GT_t.WS_t.S_300PMU2.angles = {
					{math.rad(180), math.rad(-180), math.rad(-90), math.rad(90)},
					};
GT_t.WS_t.S_300PMU2.reference_angle_Z = math.rad(90)
GT_t.WS_t.S_300PMU2.LN = {}
GT_t.WS_t.S_300PMU2.LN[1] = {}
GT_t.WS_t.S_300PMU2.LN[1].type = 4
GT_t.WS_t.S_300PMU2.LN[1].distanceMin = 6000
GT_t.WS_t.S_300PMU2.LN[1].distanceMax = 200000
GT_t.WS_t.S_300PMU2.LN[1].ECM_K = 0.4;
GT_t.WS_t.S_300PMU2.LN[1].reactionTime = 10
GT_t.WS_t.S_300PMU2.LN[1].launch_delay = 3;
GT_t.WS_t.S_300PMU2.LN[1].reflection_limit = 0.02;
GT_t.WS_t.S_300PMU2.LN[1].sensor = {}
set_recursive_metatable(GT_t.WS_t.S_300PMU2.LN[1].sensor, GT_t.WSN_t[0])
GT_t.WS_t.S_300PMU2.LN[1].beamWidth = math.rad(1);
GT_t.WS_t.S_300PMU2.LN[1].PL = {}
GT_t.WS_t.S_300PMU2.LN[1].PL[1] = {}
GT_t.WS_t.S_300PMU2.LN[1].PL[1].ammo_capacity = 4
GT_t.WS_t.S_300PMU2.LN[1].PL[1].type_ammunition = SA48N6E2.wsTypeOfWeapon;
GT_t.WS_t.S_300PMU2.LN[1].PL[1].reload_time = 1000000; -- never during the mission
GT_t.WS_t.S_300PMU2.LN[1].BR = { {pos = {0, 0, 0} } }
