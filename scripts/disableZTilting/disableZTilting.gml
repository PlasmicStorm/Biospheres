// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function disableZTilting(){
	if event_number!=0 exit;
	shader_reset();
	shader_enable_corner_id(false);
	gpu_set_ztestenable(false);
	gpu_set_zwriteenable(false);
}