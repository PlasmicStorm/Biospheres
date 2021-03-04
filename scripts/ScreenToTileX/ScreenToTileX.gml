function ScreenToTileX(argument0, argument1) {
	var _screenX = argument0 -  (SCREEN_W * 0.5);
	var _screenY = argument1 - (SCREEN_H * 0.25);
	return floor( ( _screenX / ( TILE_W * 0.5 ) + _screenY / (TILE_H * 0.5) ) * 0.5);
}
