function GetHeightDiff(_x1, _y1, _x2, _y2){
	var _tile1 = getTileAtPos(_x1, _y1);
	var _tile2 = getTileAtPos(_x1 + _x2, _y1 + _y2);
	
	if(is_undefined(_tile1) or is_undefined(_tile2))
		return 999;
		
	return abs(abs(_tile1[TILE.Z]) - abs(_tile2[TILE.Z]));
}