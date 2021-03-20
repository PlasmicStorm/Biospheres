camera = camera_create();
zoom_level = 1;
zoomSpeed = 0;
default_zoom_width = camera_get_view_width(view_camera[0]);
default_zoom_height = camera_get_view_height(view_camera[0]);

var vm = matrix_build_lookat(x, y, -10, x, y, 0, 0, 1, 0);
var pm = matrix_build_projection_ortho(1080, 720, 1, 10000);

camera_set_view_mat(camera, vm);
camera_set_proj_mat(camera, pm);

view_camera[0] = camera;

follow = oPlayer;
xTo = x;
yTo = y;