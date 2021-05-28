-- Aster 30 Block 1
-- Valeurs issues de la DB CMO v489

local function calcPiercingMass(warhead)
	warhead.piercing_mass  = warhead.mass;
	if (warhead.expl_mass/warhead.mass > 0.1) then
		warhead.piercing_mass  = warhead.mass/5.0;
	end
end

-- Simple AA warhead, replaced with a directional a2a warhead to compensate for the lack of HTK
--[[local function simple_aa_warhead(power, caliber) 
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
end--]]

local function directional_a2a_warhead(power, caliber)
    local res = {};

	res.caliber = caliber
    res.expl_mass = 3.5*power;
	res.mass = res.expl_mass;
    res.other_factors = {1, 1, 1};
    res.obj_factors = {1, 1};
    res.concrete_factors = {1, 1, 1};
    res.cumulative_factor = 0;
    res.concrete_obj_factor = 0.0;
    res.cumulative_thickness = 0.0;
    
	calcPiercingMass(res)
    return res;
end

local Aster30Blk1 = {
	Name = Aster30_Blk_1, --Aster 30 Block 1
	display_name = _('Aster 30 Block 1'),
	name = "Aster30Blk1",
	Escort = 3, -- Escort(Requires tracking?): 0 - no, 1 - launch aircraft, 2 - another aircraft, 3 - from the ground
	Head_Type = 8, -- Seeker type code, in our case 6 is for Semi-active radar homing. 1 = Passive IR homing, 2 = Active Radar Homing. Other types available in documentation
	sigma = {18, 18, 18}, -- maximum aiming error in meters, in target coordinates. x - longitudinal axis of the target, y - vertical axis of the target, z - transverse axis of the target
	M = 450.0, -- Mass of the missile at launch
	H_max = 24000.0, -- Maximum target altitude
	H_min = 10.0, -- minimum target altitude
	Diam = 180.0, -- Missile diameter in mm
	Cx_pil = 8, 
	D_max = 35000.0, -- Maximum range firing at low altitude, in meters
	D_min = 3000.0, -- minimum range in meters
	Head_Form = 1, -- determines shape of the missile head for drag modeling; 0 for hemispherical, 1 for conical
	Life_Time = 120.0, -- Battery life
	Nr_max = 30, -- Maximum g when turning
	v_min = 100.0, -- Minimum speed in m/s
	v_mid = 950.0, -- average speed in m/s
	Mach_max = 4.5, -- maximum Mach of the missile, needs headroom to account for G and drag
	t_b = 0.0, -- Motor start delay
	t_acc = 3.5, -- motor burn time
	t_marsh = 10.0, -- cruise time, 0.0 if not applicable
	Range_max = 120000.0, -- Max range in meters
	H_min_t = 10.0, -- minimum target height above the terrain, m.
	Fi_start = 3.14152, -- angle of tracking and sighting at launch, in radians
	Fi_rak = 3.14152, -- allowable angle of view of the target, in radians
	Fi_excort = 10.0, -- tracking angle (sighting) of the target by the missile.
	Fi_search = 99.9, -- limit angle of free search
	OmViz_max = 99.9, -- line-of-sight speed limit
	--warhead = simple_aa_warhead(15.0),
	warhead = directional_a2a_warhead(15.0),
	exhaust1 = { 1, 1, 1, 1 }, --R, G, B, Density
	X_back = -0.6,
	Y_back = 0.0,
	Z_back = 0.0,
	--exhaust2 = { 0.9, 0.9, 0.9, 0.05 },
	exhaust2 = { 1, 1, 1, 0.2 },
	X_back_acc = -3.0,
	Y_back_acc = 0.0,
	Z_back_acc = 0.0,
	Reflection = 0.2,
	KillDistance = 9.0,
	hoj = 1,
	category = CAT_MISSILES,
	ccm_k0       = 0.2, -- Countermeasures effectiveness
    
	active_radar_lock_dist	= 15000.0,
	go_active_by_default	= 1,
	
	wsTypeOfWeapon  = {wsType_Weapon,wsType_Missile,wsType_SA_Missile,WSTYPE_PLACEHOLDER};
	shape_table_data = 
	{
		{
			name	 = "Aster_30_Blk_1";
			file  	 = "Aster_30_Blk_1";
			life  	 = 1;
			fire  	 = { 0, 1};
			username = "Aster30Blk1";
			index = WSTYPE_PLACEHOLDER;
		},
	}
};
declare_weapon(Aster30Blk1)

GT_t.WS_t.SAMPT = {} -- SAMP/T Launcher using the Aster 30 Block 1
GT_t.WS_t.SAMPT.moveable = false
GT_t.WS_t.SAMPT.angles = {
					{math.rad(180), math.rad(-180), math.rad(-90), math.rad(90)},
					};
GT_t.WS_t.SAMPT.reference_angle_Z = math.rad(90)
GT_t.WS_t.SAMPT.LN = {}
GT_t.WS_t.SAMPT.LN[1] = {}
GT_t.WS_t.SAMPT.LN[1].type = 4
GT_t.WS_t.SAMPT.LN[1].distanceMin = 3000
GT_t.WS_t.SAMPT.LN[1].distanceMax = 120000
GT_t.WS_t.SAMPT.LN[1].ECM_K = 0.4;
GT_t.WS_t.SAMPT.LN[1].reactionTime = 2
GT_t.WS_t.SAMPT.LN[1].launch_delay = 2;
GT_t.WS_t.SAMPT.LN[1].reflection_limit = 0.029; --Same as 30N6E2 (S-300PMU1) & AN/MPQ-53 (Patriot PAC-1)
GT_t.WS_t.SAMPT.LN[1].sensor = {}
set_recursive_metatable(GT_t.WS_t.SAMPT.LN[1].sensor, GT_t.WSN_t[0])
GT_t.WS_t.SAMPT.LN[1].beamWidth = math.rad(1);
GT_t.WS_t.SAMPT.LN[1].PL = {}
GT_t.WS_t.SAMPT.LN[1].PL[1] = {}
GT_t.WS_t.SAMPT.LN[1].PL[1].ammo_capacity = 8
GT_t.WS_t.SAMPT.LN[1].PL[1].type_ammunition = Aster30Blk1.wsTypeOfWeapon;
GT_t.WS_t.SAMPT.LN[1].PL[1].reload_time = 1000000; -- never during the mission for the WS, reload handled in the relevant LN file.
GT_t.WS_t.SAMPT.LN[1].max_number_of_missiles_channels = 2;
GT_t.WS_t.SAMPT.LN[1].BR = { {pos = {0, 0, 0} } }