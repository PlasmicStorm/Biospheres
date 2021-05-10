//Check player state
var groundZ = getGroundZ(zPos);
airborne = (zPos < groundZ);

//Check player input
xVel += keyboard_check(ord("D")) - keyboard_check(ord("A"));
yVel += keyboard_check(ord("S")) - keyboard_check(ord("W"));

//Reduce speed
xVel *= 0.8;
yVel *= 0.8;

#region z axis
	if(airborne) {
		zVel += 0.1;
	}
	else {
		zPos = groundZ;
		zVel = 0;
		if(keyboard_check(vk_space))
			zVel = -3;
	}
#endregion



#region x,y axis
	//New position
	var _newX = x;
	var _newY = y;

	//Add movement
	var _xAdd = xVel * 0.4;
	var _yAdd = yVel * 0.4;

	if(check_collision(x, y + _yAdd, depth)){
		_newY += _yAdd;
	}

	if(check_collision(x + _xAdd, y, depth)){
		_newX += _xAdd;
	}

#endregion

x = _newX;
y = _newY;
zPos += zVel;
depth=floor(clamp(zPos,-100,99));