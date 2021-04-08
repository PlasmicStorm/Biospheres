// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function isInFront(box1, box2){
	// test for intersection x-axis
    // (lower x value is in front)
    if (box1.xmin >= box2.xmax) { return false; }
    else if (box2.xmin >= box1.xmax) { return true; }
    // test for intersection y-axis
    // (lower y value is in front)
    if (box1.ymin >= box2.ymax) { return false; }
    else if (box2.ymin >= box1.ymax) { return true; }

    // test for intersection z-axis
    // (higher z value is in front)
    if (box1.zmin >= box2.zmax) { return true; }
    else if (box2.zmin >= box1.zmax) { return false; }
}