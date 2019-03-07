
#region INPUT VARIABLES

input_left		= keyboard_check(vk_left);
input_right		= keyboard_check(vk_right);
input_up		= keyboard_check(vk_up);
input_down		= keyboard_check(vk_down);
input_walk		= keyboard_check(vk_control);
input_run		= keyboard_check(vk_shift);

#endregion

#region ALTER SPEED

if(input_walk or input_run){
	spd = abs((input_walk * w_spd) - (input_run * r_spd));
} else {
	
	spd = n_spd;
}

#endregion

#region RESET MOVE VARIABLES

moveX = 0;
moveY = 0;

#endregion

#region INTENDED MOVEMENT

moveX = (input_right - input_left) * spd;
if(moveX == 0){
	
	moveY = (input_down - input_up) * spd;
}

#endregion

#region COLLISION CHECK

//Horizontal
if(moveX != 0){
if(place_meeting(x + moveX, y, o_wall)){
	repeat(abs(moveX)){
		if(!place_meeting(x + sign(moveX), y, o_wall)){
	
			x += sign(moveX);
		} else {
			break;
		}
	}
	
	moveX = 0;
} 
}

//Vertical
if(moveY != 0){
if(place_meeting(x, y + moveY, o_wall)){
	repeat(abs(moveY)){
		if(!place_meeting(x, y + sign(moveY), o_wall)){
	
			y += sign(moveY);
		} else {
			break;
		}
	}
	
	moveY = 0;
} 
}

#endregion

//Apply Movement
x += moveX;
y += moveY;
