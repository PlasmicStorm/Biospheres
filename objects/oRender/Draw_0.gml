/// @desc Render game
var tileData, screenX, screenY, tileIndex, tileZ;

for (var tX = 0; tX < MAP_W; tX++)
{
	for (var tY = 0; tY < MAP_H; tY++)
	{
		tileData = global.theMap[# tX, tY];
		screenX = TileToScreenX(tX, tY);
		screenY = TileToScreenY(tX, tY);
		
		tileIndex = tileData[TILE.SPRITE];
		tileZ = tileData[TILE.Z]// + random_range(-1, 1);
		
		if (ScreenToTileX(mouse_x,mouse_y) == tX) && ((ScreenToTileY(mouse_x,mouse_y) == tY) )
		{
			//tileIndex = 2;
			//tileZ -= 1;
		}

		if (tileIndex != 0)
			draw_sprite(sStatic, tileIndex-1, screenX, screenY+tileZ);
	}
}