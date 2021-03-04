function getTileAtPos(_x, _y){
	_x = ceil(_x / TILE_W);
	_y = ceil(_y / (TILE_H * 2));
	show_debug_message("xy: " + string(_x) + ", " + string(_y))
	try {
		var _res = global.theMap[# _x, _y];
	}
	catch(_exception) {
		var _res = -1;
	}
	return _res;
}