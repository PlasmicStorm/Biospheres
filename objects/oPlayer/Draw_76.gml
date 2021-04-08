///@desc Add to render queue

var renderData = {
		obj_type : OBJ_TYPE.SPRITE,
		xmin : x - sprite_width,
		xmax : x + sprite_width,
		ymin : y - sprite_height,
		ymax : y + sprite_width,
		zmin : zPos,
		zmax : zPos + sprite_height,
		data : id
	};
ds_list_add(global.renderQueue, renderData);
logEvent("Added to renderQueue id: " + string(id), SEVERITY.DEBUG);