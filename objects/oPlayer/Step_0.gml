//Check player input
xVel += keyboard_check(ord("D")) - keyboard_check(ord("A"));
yVel += keyboard_check(ord("S")) - keyboard_check(ord("W"));

//Reduce speed
xVel *= 0.8;
yVel *= 0.8;

#region z axis
//Get ground position
var _groundTile = getTileAtPos(x, y);
if(_groundTile != undefined) 
	var _groundZ = _groundTile[TILE.Z];
else
	var _groundZ = -100;

//Adjust z position
var _gravity = -0.05;
if(zPos + _gravity < _groundZ){
	zPos = _groundZ;
	zVel = 0;
}
else{
	zVel += _gravity;
	zPos += zVel;
}

//Jumping
if(keyboard_check(vk_space) and zPos == _groundZ)
	zVel += 1;
	zPos += zVel;
#endregion

#region x,y axis
//New position
var _newX = x;
var _newY = y;

//Add movement
if(global.debugrender) {
	var _xAdd = xVel * 0.4;
	var _yAdd = yVel * 0.4;
}
else
{
	var _xAdd = (xVel + yVel) * 0.4;
	var _yAdd = (yVel - xVel) * 0.4;
}

//Get height diff between current and new 
//X and y are added seperatly to allow sloped movement
var _groundDistance = _groundZ - zPos;

var _characterSize = (sprite_width/2) * sign(_yAdd);
if(pointFree(0, _yAdd + _characterSize, _groundDistance, 4)){
	_newY += _yAdd;
}

var _characterSize = (sprite_width/2) * sign(_xAdd);
if(pointFree(_xAdd + _characterSize, 0, _groundDistance, 4)){
	_newX += _xAdd;
}

x = _newX;
y = _newY;
#endregion
