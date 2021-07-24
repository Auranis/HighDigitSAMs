declare_plugin("HighDigitSAMs",
{
installed 	 	  = true,
displayName   = _("High Digit SAMs"),
shortName	  =   "HighDigitSAMs",
state		 	  = "installed",
developerName	  = "E. 'Wiki' Crouch",
version		 	  = "1.4.3",	
info		  =    _("Adds various modern and historical air defense units to DCS world."),	 
encyclopedia_path = current_mod_path .. '/Encyclopedia',
})

-- mount_vfs_liveries_path (current_mod_path ..  "/Liveries")
mount_vfs_model_path    (current_mod_path ..  "/Shapes")
mount_vfs_texture_path	(current_mod_path ..  "/Textures")


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
dofile(current_mod_path.."/Database/Sensors/sensors.lua")


-- Weapon files

weapon_file("/Database/Weapon/5V55RUD.lua")
weapon_file("/Database/Weapon/5V55R.lua")
weapon_file("/Database/Weapon/48N6.lua")
weapon_file("/Database/Weapon/48N6E2.lua")
weapon_file("/Database/Weapon/48N6DM.lua")
weapon_file("/Database/Weapon/9M317.lua")
weapon_file("/Database/Weapon/5V23.lua")
weapon_file("/Database/Weapon/5V27.lua")
weapon_file("/Database/Weapon/HQ2.lua")
weapon_file("/Database/Weapon/9M83M.lua")
weapon_file("/Database/Weapon/9M82M.lua")
weapon_file("/Database/Weapon/9M82.lua")
weapon_file("/Database/Weapon/9M83.lua")
weapon_file("/Database/Weapon/9M342.lua")
weapon_file("/Database/Weapon/9M36.lua")
weapon_file("/Database/Weapon/ammunition.lua")
weapon_file("/Database/Weapon/cannon.lua")
weapon_file("/Database/Weapon/Aster_30_Blk_1NT.lua")
weapon_file("/Database/Weapon/Aster_30_Blk_1.lua")

--KS-19

vehicle_file("/Database/Vehicle/radar/SON-9.lua")
vehicle_file("/Database/Vehicle/KS19.lua")

--S-300PS

vehicle_file("/Database/Vehicle/S-300PS Command 54K6.lua")
vehicle_file("/Database/Vehicle/5P85SE S-300PS LN.lua")
vehicle_file("/Database/Vehicle/5P85SU S-300PS LN.lua")
vehicle_file("/Database/Vehicle/5P85CE S-300PS LN.lua")
vehicle_file("/Database/Vehicle/5P85DE S-300PS LN.lua")
vehicle_file("/Database/Vehicle/radar/30H6 S-300PS TR Trailer.lua")
vehicle_file("/Database/Vehicle/radar/40B6M S-300PS TR Mast.lua")
vehicle_file("/Database/Vehicle/radar/40B6MD S-300PS SR Mast.lua")
vehicle_file("/Database/Vehicle/radar/64H6E S-300PS SR Trailer.lua")

--S-300PMU1

vehicle_file("/Database/Vehicle/S-300PMU1 CP 54K6.lua")
vehicle_file("/Database/Vehicle/radar/40B6M S-300PMU1 TR.lua")
vehicle_file("/Database/Vehicle/radar/30N6E S-300PMU1 TR.lua")
vehicle_file("/Database/Vehicle/radar/40B6MD S-300PMU1 SR.lua")
vehicle_file("/Database/Vehicle/radar/64H6E S-300PMU1 SR.lua")
vehicle_file("/Database/Vehicle/5P85CE S-300PMU1 LN.lua")
vehicle_file("/Database/Vehicle/5P85DE S-300PMU1 LN.lua")

--S-300PMU2

vehicle_file("/Database/Vehicle/S-300PMU2 CP 54K6E2.lua")
vehicle_file("/Database/Vehicle/radar/92H6E S-300PMU2 TR.lua")
vehicle_file("/Database/Vehicle/radar/64H6E2 S-300PMU2 SR.lua")
vehicle_file("/Database/Vehicle/5P85SE2 S-300PMU2 LN.lua")

--S-300V

vehicle_file("/Database/Vehicle/S-300V CP 9S457.lua")
vehicle_file("/Database/Vehicle/9A82 S-300V LN.lua")
vehicle_file("/Database/Vehicle/9A83 S-300V LN.lua")
vehicle_file("/Database/Vehicle/radar/9S15 S-300V SR.lua")
vehicle_file("/Database/Vehicle/radar/9S19 S-300V SR.lua")
vehicle_file("/Database/Vehicle/radar/9S32 S-300V TR.lua")

--S-300VM

vehicle_file("/Database/Vehicle/S-300VM CP 9S457ME.lua")
vehicle_file("/Database/Vehicle/radar/9S15M2 S-300VM SR.lua")
vehicle_file("/Database/Vehicle/radar/9S19M2 S-300VM SR.lua")
vehicle_file("/Database/Vehicle/radar/9S32ME S-300VM TR.lua")
vehicle_file("/Database/Vehicle/9A83ME S-300VM LN.lua")
vehicle_file("/Database/Vehicle/9A82ME S-300VM LN.lua")

--Buk

vehicle_file("/Database/Vehicle/9A310M1-2 BUK LN.lua")

--SA-2/HQ-2

vehicle_file("/Database/Vehicle/V759 Launcher.lua")
vehicle_file("/Database/Vehicle/HQ-2 Launcher.lua")
vehicle_file("/Database/Vehicle/5P73 V-601P LN.lua")

--Manpads

vehicle_file("/Database/Vehicle/iglaS.lua")
vehicle_file("/Database/Vehicle/Strela-3.lua")

-- Misc units

vehicle_file("/Database/Vehicle/Polyana-D4M1.lua")
vehicle_file("/Database/Vehicle/radar/34Ya6E Gazetchik E decoy.lua")


-- S-400

--[[vehicle_file("/Database/Vehicle/51P6A S-400 LN.lua")
vehicle_file("/Database/Vehicle/S-400 CP 55K6.lua")
vehicle_file("/Database/Vehicle/radar/96L6E S-400 SR.lua")]]

-- SAMp/T NG

--[[vehicle_file("/Database/Vehicle/radar/SAMPT NG MRI GF300.lua")
vehicle_file("/Database/Vehicle/radar/SAMPT MRI ARABEL.lua")
vehicle_file("/Database/Vehicle/SAMPT MGE.lua")
vehicle_file("/Database/Vehicle/SAMPT MC.lua")
vehicle_file("/Database/Vehicle/SAMPT ME.lua")
vehicle_file("/Database/Vehicle/SAMPT MLT.lua") --Aster 30 block 1
vehicle_file("/Database/Vehicle/SAMPT NG MLT.lua") --Aster 30 block 1NT]]

-- vehicle_file("/Database/Vehicle/radar/Fan Song.lua")
-- vehicle_file("/Database/Vehicle/radar/HQ-2 TR ZD-2.lua")

plugin_done()
