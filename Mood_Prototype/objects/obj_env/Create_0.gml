if (!variable_global_exists("countEnv")) global.countEnv = 0;
numberEnv = global.countEnv++;

inRoom = instance_place(x, y, obj_room);

hpStage = 100;
hp = hpStage;
stageMax = 3;
stage = 0;

distInteract = 200;

beingSabotaged = false;
broken = false;
dead = false;

hpDrain = 0;


//methods

switch_stage = function(_change)
{
	stage += _change;
	image_index = stage;
	
	switch (stage)
	{
		case 0:		hpDrain = 0;
		break;
		
		case 1:		hpDrain = 0.1;
					inRoom.flood = false;
		break;
		
		case 2:		hpDrain = 0.2;
					inRoom.flood = true;
		break;
		
		case 3:		hpDrain = 0.3;
					broken = true;
		break;
	}
}