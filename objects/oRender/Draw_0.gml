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
		tileZ = tileData[TILE.Z];
		
		if (ScreenToTileX(mouse_x,mouse_y) == tX) && ((ScreenToTileY(mouse_x,mouse_y) == tY) )
		{
			tileIndex = 2;
			tileZ -= 1;
		}
		var _hue = 255 - (tX + tY) * 2;
		var _color = make_colour_hsv(_hue, _hue, _hue);
		if (tileIndex != 0)
			draw_sprite_ext(sStatic, tileIndex-1, screenX, screenY - tileZ, 1, 1, 0, _color, 1);
	}
}