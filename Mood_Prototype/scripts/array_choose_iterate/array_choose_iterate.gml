function array_choose_iterate(array, iterator)									
{	
	var entrylength = 0;
	for (i = 0; i < array_length(iterator); i++)
	{
		entrylength += array_length(array[iterator[i]]);
	}
	var number = irandom(entrylength - 1);
	
	var result;
	for (i = 0; i < array_length(iterator); i++)
	{
		var arraynumbers;
		arraynumbers = array_length(array[iterator[i]]) - 1;
		if (number <= arraynumbers)
		{
			result = array[iterator[i]][number];
			break;
		}
		else number -= arraynumbers + 1;
	}
	
	return result;
}
	//#desc
	//array is array from which to choose. array must hold sub-arrays through which to iterate. iterator must be array
	//storing iteration numbers. function will iterate through the arrays sub-arrays indicated by the iterator and pick 
	//1 entry at random
