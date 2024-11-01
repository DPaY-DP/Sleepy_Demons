function setup_state_machine()
{	
	State = function() constructor
	{
		var _empty = function() {}
	
		start = _empty;
		run = _empty;
		draw = _empty;
		drawGUI = _empty;
		stop = _empty;
		
		name = argument[0];
	}

	stateNull = new State();
	state = stateNull;

	timerState = 0;

	switch_state = function(_toState)
	{
		state.stop();
		lastState = state;
	
		state = _toState;
		state.start();
		
		timerState = -1;
	}
	
	initialize_state = function(_state)
	{
		timerState = 0;
	
		state = _state;
		state.start();
	}
}