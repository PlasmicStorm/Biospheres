if(global.debugrender) {
	draw_self();
	return;
}

var _x = CordToScreenX(x, y);
var _y = CordToScreenY(x, y);

var _xSize = (sprite_width/6);
var _ySize = (sprite_width/10);
var _groundTile = getTileAtPos(x, y)
if(_groundTile != undefined){
	var _groundZ = _groundTile[TILE.Z];
	draw_ellipse_color(_x - _xSize, _y - _ySize - _groundZ, _x + _xSize, _y + _ySize - _groundZ, c_black, c_black, false);
}


draw_sprite_ext(sprite_index, image_index, _x, _y - zPos, image_xscale, image_yscale, direction, c_white, 1);


draw_text(10, 25, "player x:" + string(floor(x / TILE_W)) + " y:" + string(floor(y / TILE_H * 0.5)) + " z:" + string(zPos));