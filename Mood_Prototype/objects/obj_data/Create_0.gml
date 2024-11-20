#region GAME SETUP
global.version = "V0.1.2";
randomize();
window_set_cursor(cr_none)
cursor_sprite = spr_cursor;
#endregion


#region DEBUGMODE
global.debugmode = false;
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
	file_save(global.saveName, global.save, true);
}

create_save = function()
{
	global.save = {};
	
	initialize_defaults();
	write_save();
}

unlock_all = function()
{
	var _length = array_length(global.save.levels);
	for (var i = 0; i < _length; i++)
	{
		global.save.levels[i].unlocked = true;
	}
	
	var _length = array_length(global.save.weaponsUnlocked.main);
	for (var i = 0; i < _length; i++)
	{
		global.save.weaponsUnlocked.main[i][0] = true;
	}
	
	var _length = array_length(global.save.weaponsUnlocked.effect);
	for (var i = 0; i < _length; i++)
	{
		global.save.weaponsUnlocked.effect[i][0] = true;
	}
	
	write_save();
}

pull_weapons = function()
{
	global.save.weaponsUnlocked.main =		obj_loadout.weaponsMain;
	global.save.weaponsUnlocked.effect =	obj_loadout.weaponsEffect;
	
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

enum enumMinigame
{
	TUCK,
	BRUSH,
	STUFF,
	
	CABLE,
	HORSESHOE,
	LIGHTSWITCH,
	
	TICKLE,
	INPUTS,
	SQUAREHOLE,
	FASTCLICK,
	
	//this gets used exclusively for env object repairs
	INPUTS_RAW,
}

defaults = 
{
	fullscreen : false,
	volume : 1,
	version : global.version,
	
	levels :
	[
		{
			room : room_shootingRange,
			name : "Shooting Range",
			unlocked : true,
		
			minigames :  [
				enumMinigame.TUCK,
				enumMinigame.TUCK,
				enumMinigame.TUCK,
			],
			
			loadoutPillows : 2,
			loadoutWeapons : 3,
		},
		{
			room : room_tutorialShooting,
			name : "TutorialShooting",
			unlocked : true,
			
			minigames :  [
				enumMinigame.TUCK,
				enumMinigame.TUCK,
				enumMinigame.TUCK,
			],
			
			loadoutPillows : 0,
			loadoutWeapons : 1,
		},
		{
			room : room_tutorialExecutie,
			name : "TutorialExecutie",
			unlocked : true,
			
			minigames :  [
				enumMinigame.TUCK,
				enumMinigame.TUCK,			//LUIZ Might want to think about different Minigames / random for first encounter
				enumMinigame.TUCK,
			],
			
			loadoutPillows : 0,
			loadoutWeapons : 0,
		},
		{
			room : room_00Executie,
			name : "Executie",
			unlocked : true,
		
			minigames :  [
				enumMinigame.TUCK,
				enumMinigame.TUCK,
				enumMinigame.TUCK,
			],
			
			loadoutPillows : 0,
			loadoutWeapons : 0,
		},
		{
			room : room_01PillowFight,
			name : "Pillow Fight",
			unlocked : false,
		
			minigames :  [
				enumMinigame.BRUSH,
				enumMinigame.BRUSH,
			],
			
			loadoutPillows : 1,
			loadoutWeapons : 0,
		},
		{
			room : room_02BabysFirstGun,
			name : "Baby's First Gun",		//Alt Title: Fun Gun Run
			unlocked : false,
		
			minigames :  [
				enumMinigame.STUFF,
				enumMinigame.STUFF,
				enumMinigame.STUFF,
			],
			
			loadoutPillows : 1,
			loadoutWeapons : 1,
		},
		{
			room : room_03PeakABear,
			name : "Peak-a-Bear",
			unlocked : false,
		
			minigames :  [
				enumMinigame.TUCK,
				enumMinigame.TUCK,
				enumMinigame.TUCK,
				enumMinigame.BRUSH,
				enumMinigame.BRUSH,
				enumMinigame.STUFF,
				enumMinigame.STUFF,
				enumMinigame.STUFF,
			],
			
			loadoutPillows : 1,
			loadoutWeapons : 3,
		},
		{
			room : room_04ExpandingHorizons,
			name : "Expanding Horizons",
			unlocked : false,
		
			minigames :  [
				enumMinigame.CABLE,
				enumMinigame.CABLE,
				enumMinigame.CABLE,
				enumMinigame.HORSESHOE,
				enumMinigame.HORSESHOE,
				enumMinigame.HORSESHOE,
				enumMinigame.LIGHTSWITCH,
				enumMinigame.LIGHTSWITCH,
				enumMinigame.LIGHTSWITCH,
			],
			
			loadoutPillows : 1,
			loadoutWeapons : 3,
		},
		{
			room : room_05UnderPressure,
			name : "Under Pressure",
			unlocked : false,
		
			minigames :  [
				enumMinigame.TUCK,
				enumMinigame.BRUSH,
				enumMinigame.STUFF,
				enumMinigame.HORSESHOE,
				enumMinigame.CABLE,
				enumMinigame.LIGHTSWITCH,
				enumMinigame.SQUAREHOLE,
				enumMinigame.TICKLE,
				enumMinigame.INPUTS,
			],
			
			loadoutPillows : 1,
			loadoutWeapons : 3,
		},
		{
			room : room_06TunnelVision,
			name : "Tunnel Vision",
			unlocked : false,
		
			minigames :  [
				enumMinigame.TUCK,
				enumMinigame.BRUSH,
				enumMinigame.STUFF,
				enumMinigame.HORSESHOE,
				enumMinigame.CABLE,
				enumMinigame.LIGHTSWITCH,
				enumMinigame.SQUAREHOLE,
				enumMinigame.TICKLE,
				enumMinigame.INPUTS,
				enumMinigame.FASTCLICK,
			],
			
			loadoutPillows : 1,
			loadoutWeapons : 3,
		},
		{
			room : room_07ChaosUnfolds,
			name : "Chaos Unfolds",
			unlocked : false,
		
			minigames :  [
				enumMinigame.SQUAREHOLE,
				enumMinigame.SQUAREHOLE,
				enumMinigame.INPUTS,
				enumMinigame.INPUTS,
				enumMinigame.CABLE,
				enumMinigame.CABLE,
				enumMinigame.FASTCLICK,
				enumMinigame.FASTCLICK,
				enumMinigame.FASTCLICK,
			],
			
			loadoutPillows : 1,
			loadoutWeapons : 3,
		},
		{
			room : room_08DeadEnds,
			name : "Dead Ends",
			unlocked : false,
		
			minigames :  [
				enumMinigame.HORSESHOE,
				enumMinigame.HORSESHOE,
				enumMinigame.BRUSH,
				enumMinigame.TUCK,
				enumMinigame.STUFF,
				enumMinigame.INPUTS,
				enumMinigame.INPUTS,
				enumMinigame.SQUAREHOLE,
				enumMinigame.SQUAREHOLE,
				enumMinigame.FASTCLICK,
				enumMinigame.CABLE,
				enumMinigame.CABLE,
				enumMinigame.TICKLE,
			],
			
			loadoutPillows : 1,
			loadoutWeapons : 3,
		},
	],
	
	weaponsUnlocked :
	{
		effect: 
		[
			[0, obj_weaponGluelauncher],
			[0, obj_weaponBlackhole],
			[0, obj_weaponMiniyum],
			[0, obj_weaponGummybear],
			[0, obj_weaponStinkbomb],
			[0, obj_weaponCatchmines],
		],
	
		main:
		[	
			[1, obj_weaponMainPistol],
			[0, obj_weaponMainShotgun],
			[0, obj_weaponMainRifle],
		],
	},			
}


//get save or set up fresh save
global.save = file_load(global.saveName);
global.save = false;

if (!global.save) || (global.save.version != global.version) create_save();

unlock_all();
#endregion