//Check player input
xVel += keyboard_check(ord("D")) - keyboard_check(ord("A"));
yVel += (keyboard_check(ord("S")) - keyboard_check(ord("W")));

//Reduce speed
xVel *= 0.8;
yVel *= 0.8;

//New position
var _newX = x;
var _newY = y;

//Add movement
var _xAdd = (xVel + yVel) * 0.4;
var _yAdd = (yVel - xVel) * 0.4;

//Get height diff between current and new 
//X and y are added seperatly to allow sloped movement
var _heightdiff = GetHeightDiff(x, y, 0, _yAdd);

if(4 > _heightdiff){
	_newY += _yAdd;
}

var _heightdiff = GetHeightDiff(x, y, _xAdd, 0);

if(4 > _heightdiff){
	_newX += _xAdd;
}

x = _newX;
y = _newY;