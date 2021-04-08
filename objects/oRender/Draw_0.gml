/// @desc Render game

//Enable/Disable regular tile rendering for debug mode
if(global.debugrender) {
	layer_set_visible("Map", true);
}
else {
	layer_set_visible("Map", false);
}

//render all elements of renderQueue
for(var i = 0; i < ds_list_size(global.renderQueue); i++) {
	//Get current element
	var renderTarget = global.renderQueue[|i];
	var data		= renderTarget.data;
	if(renderTarget.obj_type = OBJ_TYPE.TILE) {
		var tileData	= data.tileData;
		var screenX		= data.x;
		var screenY		= data.y;
		var tileIndex	= tileData[TILE.SPRITE];
		var tileZ		= tileData[TILE.Z];
		
		if(!global.debugrender){
			if (tileIndex != 0)
				draw_sprite_ext(sStatic, tileIndex-1, screenX, screenY - tileZ, 1, 1, 0, c_white, 1);
		}
	}
	else {
		with (data) {
			event_perform(ev_draw, 0);
		}
	}
}

//Clear queue except for tiles
ds_list_clear(global.renderQueue);
ds_list_copy(global.renderQueue, renderTiles);