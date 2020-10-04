declare_plugin("HighDigitSAMs",
{
installed 	 	  = true,
displayName   = _("High Digit SAMs"),
shortName	  =   "HighDigitSAMs",
state		 	  = "installed",
developerName	  = "E. 'Wiki' Crouch",
version		 	  = __DCS_VERSION__,	
info		  =    _("Adds support for various modern SAMs to DCS world, including the S-300PMU1."),	 
encyclopedia_path = current_mod_path .. '/Encyclopedia',
})


local function vehicle_file(f)
	if dofile(current_mod_path..f) then
		error("can't load file "..f)
		return
	end
	if(GT) then
		GT.shape_table_data = 
		{
			{
				file  	    = GT.visual.shape;
				username    = GT.Name;
				desrt       = GT.visual.shape_dstr;
			    classname 	= "lLandVehicle";
				positioning = "BYNORMAL";
				life		= GT.life or 5;
			},
			{
				name  = GT.visual.shape_dstr;
				file  = GT.visual.shape_dstr;
			},
		}
		add_surface_unit(GT)
		GT = nil;
	else
		error("GT empty in file "..f)
	end;
end

local function weapon_file(f)
	if dofile(current_mod_path..f) then
		error("can't load file "..f)
		return
	end
end

--Russia
weapon_file("/Database/Weapon/5V55RUD.lua")
weapon_file("/Database/Weapon/48N6.lua")
weapon_file("/Database/Weapon/9M317.lua")
vehicle_file("/Database/Vehicle/radar/40B6M S-300PMU1 TR.lua")
vehicle_file("/Database/Vehicle/radar/40B6MD S-300PMU1 SR.lua")
vehicle_file("/Database/Vehicle/radar/64H6E S-300PMU1 SR.lua")
vehicle_file("/Database/Vehicle/5P85CE S-300PMU1 LN.lua")
vehicle_file("/Database/Vehicle/5P85DE S-300PMU1 LN.lua")
vehicle_file("/Database/Vehicle/5P85CE S-300PS LN.lua")
vehicle_file("/Database/Vehicle/5P85DE S-300PS LN.lua")
vehicle_file("/Database/Vehicle/9A310M1-2 BUK LN.lua")
vehicle_file("/Database/Vehicle/S-300PMU1 CP 54K6.lua")
---------------------------------------------------------
plugin_done()