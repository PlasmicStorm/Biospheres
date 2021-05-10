if(!instance_exists(attached_instance)) instance_destroy();
draw_sprite_ext(sprite_index,image_index,attached_instance.x,attached_instance.y + zPos,image_xscale * 0.3,image_yscale * 0.3,0,c_black,image_alpha);
