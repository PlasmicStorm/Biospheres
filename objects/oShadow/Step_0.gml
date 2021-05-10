var layers = ["tiles_high", "tiles_mid", "tiles_low"];

for(var i = 0; i < 3; i++) {
	var _layer = layer_get_id(layers[i]);
	var _tilemap = layer_tilemap_get_id(_layer);
	var _tile = tilemap_get_at_pixel(_tilemap, attached_instance.x, attached_instance.y);
	if(_tile != 0) {
		depth = ((i - 1) * GCD) - 1;
		zPos = (i - 1) * GCD;
		break;
	}
}
