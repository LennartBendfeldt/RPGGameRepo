var anim_length		= 9;
var frame_size		= 64;
var anim_speed		= 12;

#region CHANGE MOVE SPRITE

if(moveX < 0){

	y_frame = 9;
} else if(moveX > 0){

	y_frame = 11;
} else if(moveY < 0){

	y_frame = 8;
} else if(moveY > 0){

	y_frame = 10;
} else {

	x_frame = 0;
}

var xx = x - x_offset;
var yy = y - y_offset;

#endregion

#region DRAW CHARACTER SPRITES

//Draw Character Base
draw_sprite_part(s_base, 0, (floor(x_frame) * frame_size), (floor(y_frame) * frame_size), frame_size, frame_size, xx, yy);

//Draw Character Feet
draw_sprite_part(s_feet, 0, (floor(x_frame) * frame_size), (floor(y_frame) * frame_size), frame_size, frame_size, xx, yy);

//Draw Character Legs
draw_sprite_part(s_legs, 0, (floor(x_frame) * frame_size), (floor(y_frame) * frame_size), frame_size, frame_size, xx, yy);

//Draw Character Shirt
draw_sprite_part(s_torso, 0, (floor(x_frame) * frame_size), (floor(y_frame) * frame_size), frame_size, frame_size, xx, yy);

//Draw Character Hair
draw_sprite_part(s_hair, 0, (floor(x_frame) * frame_size), (floor(y_frame) * frame_size), frame_size, frame_size, xx, yy);

#endregion

#region INCREMENT ANIMATION FRAME

if((x_frame + (anim_speed/60)) < anim_length){
	
	x_frame += (anim_speed/60);
} else {
	
	x_frame = 1;
}

#endregion

draw_rectangle_color(bbox_left, bbox_top, bbox_right, bbox_bottom, c_yellow, c_yellow, c_yellow, c_yellow, true);