draw_sprite_ext(sprite_index, image_index, CordToScreenX(x, y), CordToScreenY(x, y) - zPos, image_xscale, image_yscale, direction, c_white, 1);
draw_text(10, 25, "player x:" + string(floor(x / TILE_W)) + " y:" + string(floor(y / TILE_H * 0.5)));