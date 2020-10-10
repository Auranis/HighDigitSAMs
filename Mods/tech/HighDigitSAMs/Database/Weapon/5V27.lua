-- Missile V-601P(5V27)
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

local SA2V601P = {
	category = CAT_MISSILES,
	Name = SAV601P, --5V27 S-125
	display_name = _('5V27 S-125 (V-601P'),
	name = "SAV601P",
	wsTypeOfWeapon  = {wsType_Weapon,wsType_Missile,wsType_SA_Missile,WSTYPE_PLACEHOLDER};
	Escort = 3,
	Head_Type = 6,
	sigma = {50, 50, 50},
	M = 952.0,
	H_max = 18000.0,
	H_min = 20,
	Diam = 400.0,
	Cx_pil = 4,
	D_max = 11000.0,
	D_min = 3500.0,
	Head_Form = 1,
	Life_Time = 80.0,
	Nr_max = 6,
	v_min = 170.0,
	v_mid = 430.0,
	Mach_max = 2.5,
	t_b = 0.0,
	t_acc = 4.0,
	t_marsh = 22.0,
	Range_max = 25000.0,
	H_min_t = 200.0,
	Fi_start = 3.14152,
	Fi_rak = 3.14152,
	Fi_excort = 1.0,
	Fi_search = 99.9,
	OmViz_max = 99.9,
	warhead = simple_aa_warhead(72.0),
	exhaust1 = { 1, 1, 1, 1 },
	exhaust2 = {0.9, 0.9, 0.9, 0.2 },
	X_back = -0.6,
	Y_back = 0.0,
	Z_back = 0.0,
	X_back_acc = -2.49,
	Reflection = 0.2,
	KillDistance = 14.0,
	ccm_k0 = 2.0,
	shape_table_data = 
	{
		{
			name	 = "V-601P";
			file  	 = "5v27";
			life  	 = 1;
			fire  	 = { 0, 1};
			username = "SAV601P";
			index = WSTYPE_PLACEHOLDER;
		},
	},
};
declare_weapon(SA2V601P)

GT_t.LN_t._S125HD = {}; -- V600, S125
GT_t.LN_t._S125HD.type = 4;
GT_t.LN_t._S125HD.distanceMin = 3500;
GT_t.LN_t._S125HD.distanceMax = 18000;
GT_t.LN_t._S125HD.maxShootingSpeed = 0;
GT_t.LN_t._S125HD.launch_delay = 10;
GT_t.LN_t._S125HD.reactionTime = 2;
GT_t.LN_t._S125HD.reflection_limit = 0.22;
GT_t.LN_t._S125HD.ECM_K = -1
GT_t.LN_t._S125HD.show_external_missile = true;
GT_t.LN_t._S125HD.sensor = {};
set_recursive_metatable(GT_t.LN_t._S125HD.sensor, GT_t.WSN_t[0]);
GT_t.LN_t._S125HD.barrels_reload_type = GT_t.BarrelsReloadTypes.SEQUENTIALY;
GT_t.LN_t._S125HD.PL = {};
GT_t.LN_t._S125HD.PL[1] = {};
GT_t.LN_t._S125HD.PL[1].ammo_capacity = 4;
GT_t.LN_t._S125HD.PL[1].automaticLoader = false;
GT_t.LN_t._S125HD.PL[1].type_ammunition = SA2V601P.wsTypeOfWeapon;
--GT_t.LN_t._S125HD.PL[1].name_ammunition="SA5B27";
GT_t.LN_t._S125HD.PL[1].portionAmmoCapacity = 2;
GT_t.LN_t._S125HD.PL[1].reload_time = 300*2; -- 5 min for each two barrels
GT_t.LN_t._S125HD.PL[1].shot_delay = 0.1;
GT_t.LN_t._S125HD.BR = {
                {connector_name = 'POINT_ROCKET_01'},
                {connector_name = 'POINT_ROCKET_02'},
                {connector_name = 'POINT_ROCKET_03'},
                {connector_name = 'POINT_ROCKET_04'},
            };