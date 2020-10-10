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

local SA48N6 = {
	Name = SA48N6, --48N6
	display_name = _('48N6 (SA-20 Gargoyle)'),
	name = "SA48N6",
	Escort = 3, -- Escort(Requires tracking?): 0 - no, 1 - launch aircraft, 2 - another aircraft, 3 - from the ground
	Head_Type = 8, -- Seeker type code, in our case 6 is for Semi-active radar homing. 1 = Passive IR homing, 2 = Active Radar Homing
	sigma = {40, 40, 40}, -- maximum aiming error in meters, in target coordinates. x - longitudinal axis of the target, y - vertical axis of the target, z - transverse axis of the target
	M = 1800.0, -- Mass of the missile at launch
	H_max = 27000.0, -- Maximum target altitude
	H_min = 10.0, -- minimum target altitude
	Diam = 519.0, -- Missile diameter in mm
	Cx_pil = 8, -- "Cx like pendants" - Moment of inertia??
	D_max = 55000.0, -- Maximum range firing at low altitude, in meters
	D_min = 5000.0, -- minimum range in meters
	Head_Form = 1, -- determines shape of the missile head for drag modeling; 0 for hemispherical, 1 for conical
	Life_Time = 200.0, -- Battery life
	Nr_max = 25, -- Maximum g when turning
	v_min = 50.0, -- Minimum speed in m/s
	v_mid = 1000.0, -- average speed in m/s
	Mach_max = 7.5, -- maximum Mach of the missile. In DCS this seems to assume the missile is not subject to drag, so a little headroom is necessary
	t_b = 0.0, -- Motor start delay
	t_acc = 25.0, -- motor burn time
	t_marsh = 0.0, -- cruise time, 0.0 if not applicable
	Range_max = 150000.0, -- Max range in meters
	H_min_t = 10.0, -- minimum target height above the terrain, m.
	Fi_start = 3.14152, -- angle of tracking and sighting at launch, in radians
	Fi_rak = 3.14152, -- allowable angle of view of the target, in radians
	Fi_excort = 2.0, -- tracking angle (sighting) of the target by the missile.
	Fi_search = 99.9, -- limit angle of free search
	OmViz_max = 99.9, -- line-of-sight speed limit
	warhead = simple_aa_warhead(143.0),
	exhaust1 = {1, 1, 1, 1},
	X_back = -3.681,
	Y_back = 0.0,
	Z_back = 0.0,
	Reflection = 0.2,
	KillDistance = 25.0,
	category = CAT_MISSILES,
	ccm_k0       = 0.5, -- Countermeasures effectiveness
    PN_coeffs = {
        4,                 -- Number of Entries
        2000.0 ,1.0,       -- Less 2 km to target use lead pursuit
        10000.0, 0.5,      -- Between 10 and 2 km  to target, Pn smoothly changes from 0.5 to 1.0. 
        30000.0, 0.2,      -- Between 30 and 10 km  to target, Pn smoothly changes from 0.1 to 0.5. 
		50000.0, 0.0,
    }; -- Between 50 and 30 km  to target, Pn smoothly changes from 0 to 0.2. Longer then 50 km missile files pure pursuit.
	wsTypeOfWeapon  = {wsType_Weapon,wsType_Missile,wsType_SA_Missile,WSTYPE_PLACEHOLDER};
	shape_table_data = 
	{
		{
			name	 = "48H6E2";
			file  	 = "48H6E2";
			life  	 = 1;
			fire  	 = { 0, 1};
			username = "48N6";
			index = WSTYPE_PLACEHOLDER;
		},
	}
};
declare_weapon(SA48N6)

GT_t.WS_t.S_300PMU1 = {} -- S-300PMU1 (SA-20A Gargoyle)
GT_t.WS_t.S_300PMU1.moveable = false
GT_t.WS_t.S_300PMU1.angles = {
					{math.rad(180), math.rad(-180), math.rad(-90), math.rad(90)},
					};
GT_t.WS_t.S_300PMU1.reference_angle_Z = math.rad(90)
GT_t.WS_t.S_300PMU1.LN = {}
GT_t.WS_t.S_300PMU1.LN[1] = {}
GT_t.WS_t.S_300PMU1.LN[1].type = 4
GT_t.WS_t.S_300PMU1.LN[1].distanceMin = 5000
GT_t.WS_t.S_300PMU1.LN[1].distanceMax = 150000
GT_t.WS_t.S_300PMU1.LN[1].ECM_K = 0.4;
GT_t.WS_t.S_300PMU1.LN[1].reactionTime = 10
GT_t.WS_t.S_300PMU1.LN[1].launch_delay = 3;
GT_t.WS_t.S_300PMU1.LN[1].reflection_limit = 0.02;
GT_t.WS_t.S_300PMU1.LN[1].sensor = {}
set_recursive_metatable(GT_t.WS_t.S_300PMU1.LN[1].sensor, GT_t.WSN_t[0])
GT_t.WS_t.S_300PMU1.LN[1].beamWidth = math.rad(1);
GT_t.WS_t.S_300PMU1.LN[1].PL = {}
GT_t.WS_t.S_300PMU1.LN[1].PL[1] = {}
GT_t.WS_t.S_300PMU1.LN[1].PL[1].ammo_capacity = 4
GT_t.WS_t.S_300PMU1.LN[1].PL[1].type_ammunition = SA48N6.wsTypeOfWeapon;
GT_t.WS_t.S_300PMU1.LN[1].PL[1].reload_time = 1000000; -- never during the mission
GT_t.WS_t.S_300PMU1.LN[1].BR = { {pos = {0, 0, 0} } }