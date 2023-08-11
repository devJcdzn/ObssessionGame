/// @description Inserir descrição aqui
global.pause = keyboard_check(vk_escape);
if global.pause {
	if (room != room_pause) {
		if (instance_exists(obj_player)) {
			obj_player.persistent = false;
			isPause = true;
			instance_activate_all();
		}
		room_previous(room);
		room_goto(room_pause);
	} else {
		room_goto_previous();
		instance_deactivate_all(true);
	}
}
