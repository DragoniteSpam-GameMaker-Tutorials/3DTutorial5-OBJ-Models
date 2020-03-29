/// @description Move around

// This is pretty much all movement code from 3D in older versions of Game Maker.

direction -= (display_mouse_get_x() - display_get_width() / 2) / 10;
pitch = clamp(pitch - (display_mouse_get_y() - display_get_height() / 2) / 10, -80, 80);

display_mouse_set(display_get_width() / 2, display_get_height() / 2);

if (keyboard_check(vk_escape)){
    game_end();
}

if (keyboard_check(ord("A"))){
	x -= dsin(direction) * 4;
	y -= dcos(direction) * 4;
}

if (keyboard_check(ord("S"))){
	x -= dcos(direction) * 4;
	y += dsin(direction) * 4;
}

if (keyboard_check(ord("D"))){
	x += dsin(direction) * 4;
	y += dcos(direction) * 4;
}

if (keyboard_check(ord("W"))){
	x += dcos(direction) * 4;
	y -= dsin(direction) * 4;
}