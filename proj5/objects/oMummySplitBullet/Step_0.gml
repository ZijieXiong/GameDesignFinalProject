if (place_meeting(x, y, [obj_player])) {
	instance_destroy();
}


if (place_meeting(x, y, [obj_wall])) {
	if(image_xscale == 1) {
		split_self();	
	}
	instance_destroy();
}
