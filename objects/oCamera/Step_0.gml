x += (xTo -x)/25;
y += (yTo -y)/25;

#region zoom
//If player is moving slowly zoom out
if((abs(oPlayer.xVel) > 0.1) or (abs(oPlayer.yVel) > 0.1))
	zoomSpeed += 0.001;
else
	zoomSpeed -= 0.01;
zoomSpeed *= 0.99;

zoom_level = clamp(zoom_level + (zoomSpeed/100), 0.5, 1);

//Get current size
var view_w = camera_get_view_width(view_camera[0]);
var view_h = camera_get_view_height(view_camera[0]);

//Set the rate of interpolation
var rate = 0.2;

//Get new sizes by interpolating current and target zoomed size
var new_w = lerp(view_w, zoom_level * default_zoom_width, rate);
var new_h = lerp(view_h, zoom_level * default_zoom_height, rate);

//Apply the new size
camera_set_view_size(view_camera[0], new_w, new_h);
#endregion

if (follow != noone){
	xTo = CordToScreenX(follow.x, follow.y);
	yTo = CordToScreenY(follow.x, follow.y);
}

var vm = matrix_build_lookat(x, y, -10, x, y, 0, 0, 1, 0);
camera_set_view_mat(camera, vm);