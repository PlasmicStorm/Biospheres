function getTileAtPos(_x, _y){
	_x = ceil(_x / TILE_W);
	_y = ceil(_y / (TILE_H * 2));
	
	if(_x >= MAP_W or _x < 0)
		return undefined;
	if(_y >= MAP_H or _y < 0)
		return undefined;
		
	var _res = global.theMap[# _x, _y];

	return _res;
}