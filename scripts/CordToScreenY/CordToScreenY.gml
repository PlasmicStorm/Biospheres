function CordToScreenY(_x, _y){
	return ( (_x/TILE_W) + (_y/TILE_H*0.5) ) * (TILE_H * 0.5) + (SCREEN_H * 0.25);
}