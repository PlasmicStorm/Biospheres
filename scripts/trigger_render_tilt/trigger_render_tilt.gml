function trigger_render_tilt(){
	//Only trigger on the first instance of the draw event
	if(event_type != ev_draw || event_number != 0) {
		return;
	}
	
	with(oRenderer){
		switch(renderstate){
			
			case RENDERSTATE.set:
				gpu_set_ztestenable(true);			// ztest what we draw from here on out
				gpu_set_zwriteenable(true);			// fill in the zbuffer with the info of the things being drawn - not just testing
				//gpu_set_alphatestenable(true);	// Alpha testing - handled in the shader, required if we dont use a custom shader!
				//gpu_set_alphatestref(1);
				shader_set(shd_ztilt);
				shader_enable_corner_id(true);		// this is the magic ingredient! it allows us to distinguish which vertex is which in a shader!
				shader_set_uniform_f(shader_get_uniform(shd_ztilt,"atest"), true);	//This allows the shader to use alpha testing
				renderstate=RENDERSTATE.reset;
				break;
		
			case RENDERSTATE.reset:
				shader_reset();
				shader_enable_corner_id(false);
				gpu_set_ztestenable(false);
				gpu_set_zwriteenable(false);
				gpu_set_alphatestenable(false);
				renderstate=RENDERSTATE.set;

				#region Draw player silouette
					gpu_set_zfunc(cmpfunc_greater);		// check for occluded pixel instead of non-occluded (cmpfunc_lessequal);
					gpu_set_ztestenable(true);			// a silhouette needs to depth test
					gpu_set_zwriteenable(false);		// but it does NOT need to write onto the z-buffer, this also means we need no alpha testing in the fragment!
					shader_set(shd_ztilt_silhouette);
					shader_enable_corner_id(true);
					
					// draw player
					with(oPlayer){
						shader_set_uniform_f(shader_get_uniform(shd_ztilt_silhouette,"in_Zcorrection"),depth); // tiny depth offset so the silhouette of the does not apply to itself!
						event_perform(ev_draw,0);
					}
			
					// restore defaults!
					shader_reset();
					shader_enable_corner_id(false);
					gpu_set_ztestenable(false);
					gpu_set_zfunc(cmpfunc_lessequal); // default!
				#endregion
				
				break;
		}
	}
}