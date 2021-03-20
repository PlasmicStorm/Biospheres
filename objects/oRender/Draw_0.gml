/// @desc Render gaame
var tileData, screenX, screenY, tileIndex, tileZ;

var instanceIds = layer_get_all_elements(layer_get_id("Instances"));
var objects = ds_grid_create(array_length(instanceIds), 2);

for(var i = 0; i < array_length(instanceIds); i++){
	with (instanceIds[i]) {
		ds_grid_add(objects, i, 0, instanceIds[i]);
		var _sortIndex = floor(x / TILE_W) * MAP_H + (floor(y / TILE_H * 0.5));
		ds_grid_add(objects, i, 1, _sortIndex);
	}
}

ds_grid_sort(objects, 1, true);

var _currInstance = 0;
for (var tX = 0; tX < MAP_W; tX++)
{
	for (var tY = 0; tY < MAP_H; tY++)
	{
		//Get tile Data
		tileData = global.theMap[# tX, tY];
		screenX = TileToScreenX(tX, tY);
		screenY = TileToScreenY(tX, tY);
		tileIndex = tileData[TILE.SPRITE];
		tileZ = tileData[TILE.Z];
		
		//Debugging
		if (ScreenToTileX(mouse_x, mouse_y) == tX) && ((ScreenToTileY(mouse_x,mouse_y) == tY)){
			draw_text(10, 10, "x:" + string(ScreenToTileX(mouse_x, mouse_y)) + " y:" + string(ScreenToTileY(mouse_x, mouse_y)))
			tileIndex = 2;
			tileZ -= 1;
		}
		
		//Make hue
		var _hue = 255 - (tX + tY) * 2;
		var _color = make_colour_hsv(_hue, _hue, _hue);
		
		//Render Tile
		if (tileIndex != 0)
			draw_sprite_ext(sStatic, tileIndex-1, screenX, screenY - tileZ, 1, 1, 0, _color, 1);
			
		//Render all Sprites standing on that tile
		var _sortIndex = tY + tX * MAP_H;
		while(_currInstance < array_length(instanceIds)){
			if(_sortIndex >= ds_grid_get(objects, _currInstance, 1)){
				//Perform object specific draw event
				with (ds_grid_get(objects, _currInstance, 0)) {
					event_perform(ev_draw, 0);
				}
				//show_debug_message("Rendering instance " + string(_currInstance) + " Id " + string(ds_grid_get(objects, _currInstance, 0)) + " with local index " + string(ds_grid_get(objects, _currInstance, 1)) + " global index " + string(_sortIndex));
				_currInstance++;
			}
			else
				break;
		}
	}
}

ds_grid_destroy(objects);
