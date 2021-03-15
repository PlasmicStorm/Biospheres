/// @desc Build the Map

layer_set_visible("Map", false);
layer_set_visible("Height", false);
layer_set_visible("Instances", false);

global.theMap = ds_grid_create(MAP_W, MAP_H);

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
