function TileToScreenY(argument0, argument1) {
	var _tX = argument0;
	var _tY = argument1;
	return ((_tX + _tY) * (TILE_H * 0.5)) + (SCREEN_H * 0.25);
}
