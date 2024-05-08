//this function requires two dir input (MAIN and FOLLOW)
//MAIN sets the range for the current operation, FOLLOW... follows.
//The goal is to prevent harsh curoffs by skipping over the 360 - 0 limit, 
//instead replacing a value that would go over or under that value with the 
//same angle + / - 360 degrees

function dir_limit(dirMain, dirFollow)
{
	if (abs(dirMain - dirFollow) <= 180) return dirFollow;
	
	if (dirMain < dirFollow) return dirFollow - 360;
	else return dirFollow + 360
}