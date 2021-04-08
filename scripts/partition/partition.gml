// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function partition(list, low, high){
	var pivot = list[|high];
	
	var i = (low - 1);
	
	for (var j = low; j <= high- 1; j++) {
        // If current element is smaller than the pivot
        if (isInFront(pivot, list[|j])) {
			// increment index of smaller element
			i++;
			
			//Swap Elements
			var temp = list[|i];
			list[|i] = list[|j];
			list[|j] = temp;
        }
    }
	//Swap Elements
	var temp = list[|i + 1];
	list[|i] = list[|high];
	list[|high] = temp;
    return (i + 1)
}