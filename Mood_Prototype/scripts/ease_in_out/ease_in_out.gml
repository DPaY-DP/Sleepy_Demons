function ease_in_out(timer, startVal, change, duration)
{
	timer /= duration / 2;
	
	if (timer < 1) return change / 2 * timer * timer + startVal;
	
	timer--;
	return -change / 2 * (timer * ( timer - 2 ) - 1) + startVal;
}

//timer =		timer, the "frame" of the current animation, all variables are checked against 
//				the timer value to determine their values
//startVal =	Value before the change
//change =		Value of the change over time (EndVal - StartVal)
//duration =	Length of the change in frames

//does NOT auto-terminate, will continue to run indefinitely, must be broken out of manually 
//(with an if statement for example)

//Preferred Notation:
//
//	//declared variables
//
//	//timerEase = 0;
//	//sizeStart = 1;
//	//sizeEnd = 1.8;
//	//resizeDuration = 45;
//
	//timer++;
	//if (timer < duration) displaySize = ease_in_out(timer, startVal, endVal - startVal, resizeDuration);
	//else
	//{
	//	var _endVal = startVal;
	//	startVal = endVal;
	//	endVal = _endVal;
	//	timer = 0;
	//}