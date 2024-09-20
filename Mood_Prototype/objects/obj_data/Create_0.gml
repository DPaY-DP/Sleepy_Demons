#region GAME SETUP
global.version = "V0.1";
randomize();
#endregion


#region DEBUGMODE
global.debugmode = true;
#endregion


#region SAVING AND LOADING DATA
global.saveName = "ODDprototype.save";

//methods
initialize_defaults = function()
{
	var _listNames = struct_get_names(defaults);
	show_debug_message(defaults)
	show_debug_message(_listNames)
	var _lengthNames = array_length(_listNames);
		
	for (var i = 0; i < _lengthNames; i++)
	{
		var _name = _listNames[i];
		var _entry = defaults[$ _name];
		show_debug_message(_entry)
			
		global.save[$ _name] = ds_clone(defaults[$ _name]);
	}
	
	show_debug_message($"default init: {global.save}")
};
	
reset_to_default = function(_structname)
{
	var _targetStruct = global.save[$ _structname];
		
	var _listNames = struct_get_names(defaults[$ _structname]);
	var _lengthNames = array_length(_listNames);
	
	with (_targetStruct)
	{
		for (var i = 0; i < _lengthNames; i++)
		{
			var _name = _listNames[i];
				
			show_debug_message($"changing {_name} from {_targetStruct[$ _name]} to {defaults[$ _structname][$ _name]}")
			_targetStruct[$ _name] = ds_clone(defaults[$ _structname][$ _name]);
			
			show_debug_message($"result: {_targetStruct}")
		}
	}
};

write_save = function()
{
	show_debug_message($"write save: {global.save}")
	file_save(global.saveName, global.save, true);
}

create_save = function()
{
	global.save = {};
	
	initialize_defaults();
	write_save();
}


//default values for each save

enum KEYMAP 
{
	PRIMARY,
	MELEE,
	EXECUTE,
	SABOTAGE,
	REPAIR,
}

defaults = 
{
	fullscreen : true,
	volume : 1,
	version : global.version,
	
	levels :
	[
		{
			room : room_tutorial_executie,
			name : "Executie",
			unlocked : true,
		},
		{
			room : room_tutorial_melee,
			name : "Melee",
			unlocked : false,
		},
		{
			room : room_tutorial_gun,
			name : "Gun",
			unlocked : false,
		},
		{
			room : room_tutorial_gun_trigger,
			name : "Trigger",
			unlocked : false,
		},
		{
			room : room_tutorial_big_room,
			name : "Big Room",
			unlocked : false,
		},
		{
			room : room_tutorial_big_room_with_env,
			name : "Big Room + Env",
			unlocked : false,
		},
		{
			room : room_tutorial_tunnel,
			name : "Tunnel",
			unlocked : false,
		},
		{
			room : room_combined_easy,
			name : "[NONAME!!!!]",
			unlocked : false,
		},
		{
			room : room_combined_middle,
			name : "[NONAME!!!!]",
			unlocked : false,
		},
		{
			room : room_combined_hard,
			name : "[NONAME!!!!]",
			unlocked : false,
		},
	],
}


//get save or set up fresh save
global.save = file_load(global.saveName);
show_debug_message(global.save)
if (!global.save) create_save();
#endregion

//array_pop(global.save.levels);
//array_push(global.save.levels, 
//		{
//			room : room_combined_easy,
//			name : "[NONAME!!!!]",
//			unlocked : false,
//		},)

//array_push(global.save.levels, 
//		{
//			room : room_combined_middle,
//			name : "[NONAME!!!!]",
//			unlocked : false,
//		},)

//array_push(global.save.levels, 
//		{
//			room : room_combined_hard,
//			name : "[NONAME!!!!]",
//			unlocked : false,
//		},)
//		write_save();