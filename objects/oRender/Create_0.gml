/// @desc Build the Map

layer_set_visible("Map", false);
layer_set_visible("Height", false);
layer_set_visible("Instances", false);

global.theMap = ds_grid_create(MAP_W, MAP_H);
global.debugrender = false;

var tileMap = layer_tilemap_get_id("Map");
var heightMap = layer_tilemap_get_id("Height");

for (var tX = 0; tX < MAP_W; tX++)
{
	for (var tY = 0; tY < MAP_H; tY++)
	{
		var tileMapData = tilemap_get(tileMap, tX, tY);
		//Format: [Sprite, Z];
		var thisTile = [-1, 0];
		thisTile[TILE.SPRITE] = tileMapData;
		thisTile[TILE.Z] = tilemap_get(heightMap, tX, tY) - 16;
		global.theMap[# tX, tY] = thisTile;
	}
}

global.renderQueue = ds_list_create();
renderTiles = ds_list_create();

//Figure out draw order
for (var tX = 0; tX < MAP_W; tX++)
{
	for (var tY = 0; tY < MAP_H; tY++)
	{
		//Get tile Data
		tileData = global.theMap[# tX, tY];
		tileZ = tileData[TILE.Z];
		
		var box1 = {
			obj_type : OBJ_TYPE.TILE,
			xmin : (tX + 1) * TILE_W,
			xmax : tX * TILE_W,
			ymin : (tY + 1) * TILE_H,
			ymax : tY * TILE_H,
			zmin : tileZ,
			zmax : tileZ - 30,
			data : {
					tileData : global.theMap[# tX, tY],
					x : TileToScreenX(tX, tY),
					y : TileToScreenY(tX, tY)
					}
		};
		//logEvent("tY: " + string(tY) + " tX: " + string(tX), SEVERITY.DEBUG);
		if(tY + 1 >= MAP_H) {
			tileData = global.theMap[# tX + 1, 0];
			tileZ = tileData[TILE.Z];
		}
		else if (tX + 1 == MAP_W) {
			ds_list_insert(renderTiles, sortIndex, box1);
			break;
		}
		else {
			tileData = global.theMap[# tX, tY + 1];
			tileZ = tileData[TILE.Z];
		}
		
		var sortIndex = 0;
		while(sortIndex < ds_list_size(renderTiles)) {
			var box2 = ds_list_find_value(renderTiles, sortIndex);
			
			if(isInFront(box1, box2)) {
				break;
			}
			sortIndex++;
		}
		
		ds_list_insert(renderTiles, sortIndex, box1);
	}
}