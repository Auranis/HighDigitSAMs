-- aster 30 block 1 by zahnatom

local nameaster301 = "Aster 30 Blk 1"
SAMPT_ASTER_30_Blk_1 = {
    category        = CAT_MISSILES,
    name            = nameaster301,
    user_name       = _(nameaster301),
    model           = 'aster_30_blk_1',
    mass            = 450.0,
    wsTypeOfWeapon  =  {wsType_Weapon,wsType_Missile,wsType_SA_Missile,WSTYPE_PLACEHOLDER},

    Escort 			= 0,
    Head_Type 		= 2,
	sigma 			= {20, 20, 20},
    M 				= 450.0,
    H_max 			= 20000.0,
    H_min 			= 3.0,
    Diam 			= 180.0,
    Cx_pil 			= 1,
    D_max 			= 80000.0,
    D_min 			= 2000.0,
    Head_Form 		= 1,
    Life_Time 		= 360.0,
    Nr_max 			= 60,
    v_min 			= 50.0,
    v_mid 			= 1800.0,
    Mach_max 		= 5.0,
    t_b 			= 0.0,
    t_acc 			= 4.5,
    t_marsh 		= 15.0,
    Range_max 		= 120000.0,
    H_min_t 		= 3.0,
    Fi_start     	= 3.14152, -- angle of tracking at firing
    Fi_rak       	= 3.14152,
    Fi_excort    	= 2.0,
    Fi_search    	= 99.9, --search angle limit
    OmViz_max    	= 99.9, --search line speed limit
	exhaust1 	 	= { 1, 0.8, 0.2, 1},
    X_back       	= -0.55,
    Y_back       	= 0.0,
    Z_back       	= 0.0,	
	exhaust2 	 	= { 0.63, 0.67, 0.75, 0.2 },
	X_back_acc 	 	= -2.88,
    Y_back_acc 	 	= 0.0,
    Z_back_acc 	 	= 0.0,	
    Reflection 		= 0.1,
    KillDistance 	= 20.0,
	tail_scale 	 	= 1.4,		
	ccm_k0 			= 0.2,	
	
	active_radar_lock_dist	= 150000.0,
	go_active_by_default	= 0,	

	PN_coeffs = {3, 				-- Number of Entries
				5000.0 ,1.0,		-- Less 5 km to target Pn = 1
				100000.0, 0.5,		-- Between 10 and 5 km  to target, Pn smoothly changes from 0.5 to 1.0. 
				200000.0, 0.25};		-- Between 20 and 10 km  to target, Pn smoothly changes from 0.2 to 0.5. Longer then 30 km Pn = 0.2.

	warhead = enhanced_a2a_warhead(15.0); 

    shape_table_data = {
        {
            name     = nameaster301,
            file     = 'aster_30_blk_1',
            life     = 1,
            fire     = {0, 1},
            username = "Aster 30 Blk 1",
            index    = WSTYPE_PLACEHOLDER,
        },
    },

};

declare_weapon(SAMPT_ASTER_30_Blk_1)

GT_t.WS_t.Aster30_1 = {name = "Aster 30 Blk 1", display_name = _("Aster 30 Blk 1")};

GT_t.LN_t.Aster30_1 = {}; 
GT_t.LN_t.Aster30_1.type = 4;
GT_t.LN_t.Aster30_1.distanceMin = 1000;
GT_t.LN_t.Aster30_1.distanceMax = 120000;
GT_t.LN_t.Aster30_1.reactionTime = 1.0;
GT_t.LN_t.Aster30_1.launch_delay = 0.1;
GT_t.LN_t.Aster30_1.reflection_limit = 0.0001;
GT_t.LN_t.Aster30_1.ECM_K = 0
GT_t.LN_t.Aster30_1.max_number_of_missiles_channels = 1;
GT_t.LN_t.Aster30_1.sensor = {};

set_recursive_metatable(GT_t.LN_t.Aster30_1.sensor, GT_t.WSN_t[0]);

GT_t.LN_t.Aster30_1.external_tracking_awacs = false;
GT_t.LN_t.Aster30_1.show_external_missile = true
GT_t.LN_t.Aster30_1.PL = {};
GT_t.LN_t.Aster30_1.PL[1] = {};
GT_t.LN_t.Aster30_1.PL[1].switch_on_delay = 0.1;
GT_t.LN_t.Aster30_1.PL[1].shot_delay = 0.1;
GT_t.LN_t.Aster30_1.PL[1].ammo_capacity = 8;
GT_t.LN_t.Aster30_1.PL[1].type_ammunition = SAMPT_ASTER_30_Blk_1.wsTypeOfWeapon;
GT_t.LN_t.Aster30_1.PL[1].reload_time = 3600;
GT_t.LN_t.Aster30_1.BR = { {pos = {0,0,0}}};