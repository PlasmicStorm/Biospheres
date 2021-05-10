yVel = 0;
xVel = 0;
zVel = 0;
zPos = 0;
airborne = 0;
image_alpha=sprite_height/255;
show_debug_message("Height " + string(image_alpha));

//Attach Shadow
var _shadow = instance_create_depth(x, y, depth, oShadow);
_shadow.attached_instance = self;