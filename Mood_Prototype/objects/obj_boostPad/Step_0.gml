if(place_meeting(x,y,obj_player))
{
	var _player = instance_place(x,y,obj_player);
	_player.boosted = true;
	_player.timerBoosted = 3 * room_speed;
	_player.boostMultiplier = 2;
}
