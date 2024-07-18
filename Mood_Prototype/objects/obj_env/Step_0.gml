global.envHP -= hpDrain;


if	(stage > 0) && 
	(point_distance(x, y, obj_player.x, obj_player.y) < distInteract)
{
	if (keyboard_check(ord("E"))) hp += 2;
}

if (hp > hpStage) && (stage != 0)
{
	switch_stage(-1)	//minus heals
	hp = 0;
}

if (hp < 0) && (stage != stageMax)
{	
	switch_stage(1);	//plus damages
	hp = hpStage;
}