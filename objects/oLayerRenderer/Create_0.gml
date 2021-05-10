var layer_id = layer_get_id(layer_name);
tilemap = layer_tilemap_get_id(layer_id);
layer_set_visible(layer_id, false);
depth = layer_get_depth(layer_id);