xVel += keyboard_check(ord("D")) - keyboard_check(ord("A"));
yVel += (keyboard_check(ord("S")) - keyboard_check(ord("W")));

xVel *= 0.9;
yVel *= 0.9;

var _xAdd = (xVel + yVel) * 0.2;
var _yAdd = (yVel - xVel) * 0.2;

try {
	var _heightdiff = abs(getTileAtPos(x, y)[TILE.Z] - getTileAtPos(x + _xAdd, y + _yAdd)[TILE.Z])
}
catch (_exception) {
	var _heightdiff = 999;
}
//show_debug_message("tiles checked x1:" + string(x) + " y1:" + string(y) + " x2:" + string(x + _xAdd) + " y2:" + string(y + _yAdd) + " diff:" + string(_heightdiff));
//show_debug_message(string("xy" + string(x) + ", " + string(y) + " " + string(getTileAtPos(x, y))));

if(4 > _heightdiff){
	x += _xAdd;
	y += _yAdd;
}	
