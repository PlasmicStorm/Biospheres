// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function check_collision(_x, _y, _z){
	var layers = ["tiles_high", "tiles_mid", "tiles_low"];
	//Check for normal collision
	if(!place_free(_x, _y)) return false;
	
	var _layer_depth = clamp(get_layer(_z), -1, 1);
	
	//Check if above top layer
	if( _layer_depth == -1) return true;
	
	//Get tile above player
	var _layer = layer_get_id(layers[_layer_depth]);
	var _tilemap = layer_tilemap_get_id(_layer);
	var _tile = tilemap_get_at_pixel(_tilemap, _x, _y);
	
	//Check if tile is empty
	if(_tile != 0) return false;
	
	return true;
}