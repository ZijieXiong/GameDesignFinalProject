/// @description Insert description here
// You can write your code in this editor


var _collision_res = collision_rectangle(x + -alert_radius, y + -alert_radius, x + alert_radius, y + alert_radius, obj_player, true, 1);

is_jump = true;
sprite_index = spr_slime_jump;
image_index = 0;

if(_collision_res)
{
	target_x = obj_player.x;
	target_y = obj_player.y;
} else
{
		
	// Generate a random distance within the specified range
	var _distance = random_range(30, 60);

	// Generate a random direction (0 to 360 degrees)
	var _direction = random(360);

	// Calculate the new position
	target_x = x + lengthdir_x(_distance, _direction);
	target_y = y + lengthdir_y(_distance, _direction);
	
}

var _estimed_time = point_distance(x, y, target_x, target_y)/jump_speed;
// Assuming these values are known or calculated
var _jump_duration = 60*_estimed_time; // The total duration of the jump in steps
var _sprite_frame_count = sprite_get_number(spr_slime_jump); // Number of frames in the jump sprite

show_debug_message(_estimed_time);

// Calculate image_speed
//image_speed = _jump_duration/ _sprite_frame_count;
image_speed = 30/_estimed_time;