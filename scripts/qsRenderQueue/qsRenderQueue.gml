// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function qsRenderQueue(list, low, high){
	if (low < high) {
		//Set the Partitioning index renderQueue[partitionIndex]
		var partitionIndex = partition(list, low, high);
		
		qsRenderQueue(list, low, partitionIndex - 1);
		qsRenderQueue(list, partitionIndex + 1, high);
	}
}