// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function pointFree(_x, _y, _groundDistance, _step){
	//Check Height with character size in mind
	var _heightdiff = GetHeightDiff(x, y, _x, _y) + _groundDistance;
	//logEvent("Calculated height diff: " + string(_heightdiff), SEVERITY.DEBUG);
	if(_heightdiff > _step)
		return false;
	if(collision_line(x, y, x + _x, y + _y,  parCollision, false, false))
		return false;
	return true;
}