-- KS-19 100mm HE round
declare_weapon({
	category 				= CAT_SHELLS,
	name 					= "100mm_FLAK",
	user_name				= _("100mm_FLAK"),
	model_name				= "pula",
	v0						= 900.0,
	Dv0						= 0.0021,
	Da0						= 0.0003,
	Da1						= 0.0005,
	mass					= 11.0,
	round_mass				= 15.6,
	explosive				= 4.0,
	life_time				= 120,
	caliber					= 100,
	s						= 0.0,
	j         				= 0.0,
	l         				= 0.0,
	charTime      			= 0,
	cx        				= {0.0,0.56,0.79,0.19,1.99},
	k1        				= 1.37e-09,
	tracer_off				= 120,
	tracer_on				= 0.01,
	smoke_tail_life_time 	= 0.0,
	scale_tracer  			= 1,
	rotation_freq  			= 20,
	cartridge 				= 0,
	
	aiming_table			=
	{
		precalculateAirDefenceAimingTable = true, --I don't think this actually works correctly, shells tend to land low and behind targets, even with perfect aim.  Maybe not accounting for drag?
		precalculateAimingTable = true,
		[1] = { init_vel = 900.0 }
	}
})