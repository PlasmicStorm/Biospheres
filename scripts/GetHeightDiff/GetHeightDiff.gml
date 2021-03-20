function GetHeightDiff(_x1, _y1, _x2, _y2){
	var _tile1 = getTileAtPos(_x1, _y1);
	var _tile2 = getTileAtPos(_x1 + _x2, _y1 + _y2);
	
	if(is_undefined(_tile1) or is_undefined(_tile2))
		return 999;
	//Adding 100 to compensate for values around 0
	return  (_tile2[TILE.Z] + 100) - (_tile1[TILE.Z] + 100);
}