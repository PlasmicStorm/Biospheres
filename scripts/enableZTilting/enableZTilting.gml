// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function enableZTilting(){
	if event_number!=0 exit;
	gpu_set_ztestenable(true);
	gpu_set_zwriteenable(true);
	shader_set(shd_zsort);
	shader_enable_corner_id(true);
}