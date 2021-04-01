if(global.debugrender) {
	draw_self();
	return;
}

var _x = CordToScreenX(x, y);
var _y = CordToScreenY(x, y);

draw_sprite_ext(sprite_index, image_index, _x, _y - zPos, image_xscale, image_yscale, direction, c_white, 1);