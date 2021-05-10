// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function getGroundZ(zPos){
	var layers = ["tiles_high", "tiles_mid", "tiles_low"];
	for(var i = 0; i < array_length(layers); i++) {
		var layer_id = layer_get_id(layers[i]);
		var tilemap = layer_tilemap_get_id(layer_id);
		var ldepth = layer_get_depth(layer_id);
		var data = tilemap_get_at_pixel(tilemap, x, y);
		if(data != 0 && ldepth + 8 > zPos) {
			return ldepth;
		}
	}
	return 99999;
}