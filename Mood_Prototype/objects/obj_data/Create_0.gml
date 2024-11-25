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

unlock_weapon = function(_objectIndex)
{
	var _length = array_length(global.save.weaponsUnlocked.main);
	for (var i = 0; i < _length; i++)
	{
		var _dataWeapon = global.save.weaponsUnlocked.main[i];
		
		if (_dataWeapon[1] == _objectIndex) 
		{
			_dataWeapon[0] = true;
			return [spr_weaponMenuMain, i, _dataWeapon[2], _dataWeapon[3]];
		}
	}
	
	var _length = array_length(global.save.weaponsUnlocked.effect);
	for (var i = 0; i < _length; i++)
	{
		var _dataWeapon = global.save.weaponsUnlocked.effect[i];
		
		if (_dataWeapon[1] == _objectIndex) 
		{
			_dataWeapon[0] = true;
			return [spr_weaponMenuEffect, i, _dataWeapon[2], _dataWeapon[3]];
		}
	}
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

enum enumWeaponMain
{
	PISTOL,
	SHOTGUN,
	RIFLE,
}

enum enumWeaponEffect
{
	GLUELAUNCHER,
	BLACKHOLE,
	MINIYUM,
	GUMMYBEAR,
	STINKBOMB,
	CATCHMINE,
}

defaults = 
{
	version : global.version,
	
	fullscreen : false,
	volumeMusic : 0, //0.5
	volumeSFX : 0.25,
	
			
	//				//levels select
	//			completed : true,
	//			sprite : spr_bshesh,
	//			time : infinity,
	
	levels :
	[
		{
			room : room_shootingRange,
			name : "Shooting Range",
			unlocked : false,
		
			minigames :  [
				enumMinigame.TUCK,
				enumMinigame.TUCK,
				enumMinigame.TUCK,
			],
			
			loadoutPillows : 2,
			loadoutWeapons : 3,
			
			weaponUnlocks : [],
			
				//levels select
			completed : true,
			sprite : spr_bshesh,
			time : infinity,
			
		},
		{
			room : room_tutorialShooting,
			name : "TutorialShooting",
			unlocked : true,
			
			minigames :  [

			],
			
			loadoutPillows : 1,
			loadoutWeapons : 1,
			
			weaponUnlocks : [],
			
				//levels select
			completed : false,
			sprite : spr_bshesh,
			time : infinity,
		},
		{
			room : room_tutorialExecutie,
			name : "TutorialExecutie",
			unlocked : true,
			
			minigames :  [
				enumMinigame.TUCK,			//LUIZ Might want to think about different Minigames / random for first encounter
			],
			
			loadoutPillows : 0,
			loadoutWeapons : 0,
			
			weaponUnlocks : [],
			
				//levels select
			completed : false,
			sprite : spr_bshesh,
			time : infinity,
		},
		{
			room : room_tutorialEnvironment,
			name : "Tutorial Environment",
			unlocked : true,
			
			minigames :  [

			],
			
			loadoutPillows : 0,
			loadoutWeapons : 0,
			
			weaponUnlocks : [],
			
				//levels select
			completed : false,
			sprite : spr_bshesh,
			time : infinity,
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
			
			loadoutPillows : 1,
			loadoutWeapons : 0,
			
			weaponUnlocks : [],
			
				//levels select
			completed : false,
			sprite : spr_bshesh,
			time : infinity,
		},
		{
			room : room_01PillowFight,
			name : "Pillow Fight",
			unlocked : false,
		
			minigames :  [
				enumMinigame.BRUSH,
				enumMinigame.BRUSH,
				enumMinigame.BRUSH,
			],
			
			loadoutPillows : 1,
			loadoutWeapons : 0,
			
			weaponUnlocks : [obj_weaponMainPistol, obj_weaponMainShotgun, obj_weaponMainRifle],
			
				//levels select
			completed : false,
			sprite : spr_bshesh,
			time : infinity,
		},
		{
			room : room_02BabysFirstGun,
			name : "Baby's First Gun",		//Alt Title: Fun Gun Run
			unlocked : false,
		
			minigames :  [
				enumMinigame.STUFF,
				enumMinigame.STUFF,
				enumMinigame.STUFF,
				enumMinigame.HORSESHOE,
				enumMinigame.HORSESHOE,
			],
			
			loadoutPillows : 1,
			loadoutWeapons : 1,
			
			weaponUnlocks : [obj_weaponGluelauncher],
			
				//levels select
			completed : false,
			sprite : spr_bshesh,
			time : infinity,
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
			],
			
			loadoutPillows : 1,
			loadoutWeapons : 2,
			
			weaponUnlocks : [obj_weaponMiniyum],
			
				//levels select
			completed : false,
			sprite : spr_bshesh,
			time : infinity,
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
			
			weaponUnlocks : [obj_weaponBlackhole, obj_weaponGummybear],
			
				//levels select
			completed : false,
			sprite : spr_bshesh,
			time : infinity,
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
			
			weaponUnlocks : [obj_weaponStinkbomb],
			
				//levels select
			completed : false,
			sprite : spr_bshesh,
			time : infinity,
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
				enumMinigame.INPUTS,
			],
			
			loadoutPillows : 1,
			loadoutWeapons : 3,
			
			weaponUnlocks : [obj_weaponCatchmines],
			
				//levels select
			completed : false,
			sprite : spr_bshesh,
			time : infinity,
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
			
			weaponUnlocks : [],
			
				//levels select
			completed : false,
			sprite : spr_bshesh,
			time : infinity,
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
			
			weaponUnlocks : [],
			
				//levels select
			completed : false,
			sprite : spr_bshesh,
			time : infinity,
		},
	],
	
	weaponsUnlocked :
	{
		effect: 
		[
			[0, obj_weaponGluelauncher,	"GLUE GLOB LAUNCHER",		"Prim: Launches a sticky glue pad\nthat slows enemies\n\nAlt: Rocket Jump"		],
			[0, obj_weaponBlackhole,	"SINGULARITY V.2",			"Prim: Fires a slow moving black\nhole\n\nAlt: Create up to two linked portals"	],
			[0, obj_weaponMiniyum,		"THE MINIYUM",				"Prim: Fire volleys of slowing candy\ncanes\n\nAlt: Boost yourself to gain speed"		],
			[0, obj_weaponGummybear,	"GUMMY LURE-AND-BUMPER GUN","Prim: Deploy Gummy Lure\n\nAlt: Deploy Gummy Bumper"		],
			[0, obj_weaponStinkbomb,	"\"NOSE-FERATU 2\" OLFACTORY DISINCENTIVIZER",		"Prim: Throw disgusting stink bomb\nto scare away enemies\n\nAlt: Enter berserker melee rush"	],
			[0, obj_weaponCatchmines,	"CATCHMINE THROWER",		"Prim: Deploy Catchmine\n\nAlt: Grappling Hook"		],
		],
	
		main:
		[	
			[1, obj_weaponMainPistol,	"NITEQUIL BLASTER",		"Basic Weapon\n\nMidrange, Single Shot"		],
			[0, obj_weaponMainShotgun,	"NITEQUIL PEPPERGUN",	"Basic Weapon\n\nShort Range, Spread Shot"	],
			[0, obj_weaponMainRifle,	"NITEQUIL SHARPSHOT",	"Basic Weapon\n\nLong Range, Single Shot"	],
		],
	},			
}


//get save or set up fresh save
global.save = file_load(global.saveName);
global.save = false;

if (!global.save) || (global.save.version != global.version) create_save();

//unlock_all();
#endregion