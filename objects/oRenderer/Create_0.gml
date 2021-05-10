var layer_id = layer_get_id("draw_tiles_low");
layer_script_begin(layer_id, trigger_render_tilt);
var layer_id = layer_get_id("controllers");
layer_script_begin(layer_id, trigger_render_tilt);

// === Shift Layers === // - Depth Values are important!
layer_depth(layer_get_id("bLayer"),100);
layer_depth(layer_get_id("tiles_low"),GCD);				// one tile width below the ground
layer_depth(layer_get_id("tiles_mid"),0);				// this is ground
layer_depth(layer_get_id("aLayer_mid"),-1);				// assets such as trees / grass ontop
layer_depth(layer_get_id("tiles_high"),-GCD);
layer_depth(layer_get_id("aLayer_high"),-GCD-1);
layer_depth(layer_get_id("controllers"),-1000);

renderstate = RENDERSTATE.set //default renderstate