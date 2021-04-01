/// @desc Render gaame
var tileData, screenX, screenY, tileIndex, tileZ;
if(global.debugrender) {
	layer_set_visible("Map", true);
}
else {
	layer_set_visible("Map", false);
}

var instanceIds = array_create(instance_number(parDepth));
for (i = 0; i < instance_number(parDepth); i += 1) {
   instanceIds[i] = instance_find(parDepth,i);
}

var objects = ds_list_create();

for(var i = 0; i < array_length(instanceIds); i++){
	var _sortIndex = floor(instanceIds[i].x / TILE_W) * MAP_H + (floor(instanceIds[i].y / TILE_H * 0.5));
	var _entry = [_sortIndex, instanceIds[i].id];
	//Insert at the right spot
	var _insert = 0;		
	while(ds_list_size(objects) > _insert){
		if(ds_list_find_value(objects, _insert)[0] > _entry[0])
			break;
		else
			_insert++;
	}
	ds_list_insert(objects, _insert, _entry);
}

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
		if(!global.debugrender){
			if (tileIndex != 0)
				draw_sprite_ext(sStatic, tileIndex-1, screenX, screenY - tileZ, 1, 1, 0, _color, 1);
		}
		
		//Set the sort Index to the current value
		var _sortIndex = tY + tX * MAP_H;
		
		//Render all Sprites standing on that tile
		while(_currInstance < array_length(instanceIds)){
			
			//Check if object should be rendered
			if(_sortIndex >= ds_list_find_value(objects, _currInstance)[0]){
				//Get Instance
				var _renderTarget = ds_list_find_value(objects, _currInstance)[1];
				//show_debug_message("Rendering instance " + string(_currInstance) + " Id " + string(_renderTarget) + " with local index " + string(ds_list_find_value(objects, _currInstance)[0]) + " global index " + string(_sortIndex));
				
				//Perform object specific draw event
				with(_renderTarget.id) {
					event_perform(ev_draw, 0);
				}
				
				//Next target
				_currInstance++;
			}
			else
				break;
		}
	}
}

ds_list_destroy(objects);
