/// @description Inserir descrição aqui
if instance_exists(obj_dialogo) {
	global.dialogo = true;
}

global.tecla = keyboard_check_pressed(ord("E"));


if inicializar == false {
	scr_textos();
	inicializar = true
	alarm[0] = 1;
}


if caractere < string_length(falas) {
	if keyboard_check_pressed(ord("F")) {
		caractere = string_length((falas));
	}
} else{		
	if pagina < ds_grid_height(texto_grid) - 1 {
		if keyboard_check_pressed(ord("F")) {
			alarm[0] = 1;
			caractere = 0;
			pagina ++;
		}
	} else {
		if op_num !=0 {
			op_draw = true;
		} else{
			if keyboard_check_pressed(ord("F")) {
				instance_destroy();
				global.dialogo = false;
			}
		}
	}
}
