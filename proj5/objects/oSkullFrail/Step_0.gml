/// @description Insert description here
// You can write your code in this editor

count++;

switch(current_state)
{
	case FRAIL_STATE.IDLE:
		frail_shadow.x = x;
		frail_shadow.y = y;
		break;
		
	case FRAIL_STATE.FIRST_WALK:
		
		var _t = count / first_walk_time;
		//_t = ease_in_out_cubic(_t);
		var _x = lerp(start_x, target_x, _t);
		var _y = lerp(start_y, target_y, _t);
		height = max_height * triangle_dist(max_ratio, _t);
		
		x = _x;
		y = _y - height;
		
		frail_shadow.x = _x;
		frail_shadow.y = _y;
		
		if(count >= first_walk_time)
		{
			screenshake(10, 3, 0.2);
			current_state = FRAIL_STATE.IDLE;
			activate_nearby_firepit();
			shoot(true);
			audio_play_sound(snd_boss_hit, 0, false);
			play_hit_part_effect(spr_toon_smoke_white,270,make_color_rgb(255,255,255),make_color_rgb(255,255,255),40,60,20);
			//play_hit_part_effect(spr_toon_smoke_white,270,make_color_rgb(255,255,255),make_color_rgb(255,255,255),50,90,20);
			//play_hit_part_effect(spr_toon_smoke_white,270,make_color_rgb(158,136,98),make_color_rgb(158,136,98),50,90,20);
			//hit_effect_par(spr_toon_smoke_white,270,make_color_rgb(158,136,98),make_color_rgb(158,136,98),50,90,20)
		}
		break;
		
	case FRAIL_STATE.SECOND_WALK:
		
		var _x = lerp(start_x, target_x, count / second_walk_time);
		var _y = lerp(start_y, target_y, count / second_walk_time);
		
		x = _x;
		y = _y;
		
		frail_shadow.x = _x;
		frail_shadow.y = _y;
		
		if(count >= second_walk_time)
		{
			screenshake(10, 3, 0.2);
			current_state = FRAIL_STATE.IDLE;
		}
		break;
	
	case FRAIL_STATE.BOUNCE:
		
		var _t = count / bounce_time;
		height = max_height * triangle_dist(max_ratio, _t);
		x = logic_x;
		y = logic_y - height; 
		
		if(count >= bounce_time)
		{
			screenshake(10, 5, 0.2);
			current_state = FRAIL_STATE.IDLE;
			activate_all_firepit();
			audio_play_sound(snd_boss_hit, 0, false);
			alarm[1] =fire_pit_erruption_delay_time;
			play_hit_part_effect(spr_toon_smoke_white,270,make_color_rgb(255,255,255),make_color_rgb(255,255,255),40,60,20);
		}
		
		break;
		
	case FRAIL_STATE.PREBOUNCES:
		
		x = logic_x;
		y = logic_y - height; 
		
		frail_shadow.x = logic_x;
		frail_shadow.y = logic_y;
		
		
		if(state_end_flag) {
			//bounce_time = _bounce_time;
			count = 0;
			current_state = FRAIL_STATE.BOUNCES;
			stop_bounce = false;	
			state_end_flag = false;
		}
		break;
		
	case FRAIL_STATE.BOUNCES:
		
		var _t = count / bounce_time;
		height = 0.5 * max_height * triangle_dist(max_ratio, _t);
		x = logic_x;
		y = logic_y - height; 
		
		frail_shadow.x = logic_x;
		frail_shadow.y = logic_y;
		
		if(count >= bounce_time)
		{
			screenshake(10, 5, 0.2);
			audio_play_sound(snd_boss_spin_hit, 0, false);
			activate_nearby_firepit();
			play_hit_part_effect(spr_toon_smoke_white,270,make_color_rgb(255,255,255),make_color_rgb(255,255,255),40,60,20);
			if(stop_bounce) {
				current_state = FRAIL_STATE.IDLE;
				stop_bounce = false;
			} else {
				count = 0;
			}
		}
		
		break;
}