/// @description Inserir descrição aqui
global.tecla = keyboard_check_pressed(ord("E"));
//Teclas de movimentação//
	#region Inputs
	var esquerda, direita, baixo, cima;

	esquerda = keyboard_check(ord("A"));
	direita = keyboard_check(ord("D"));
	baixo = keyboard_check(ord("S"));
	cima = keyboard_check(ord("W"));
	#endregion

	//Movimentação//
	#region Movimentation
	var tecla = direita - esquerda !=0 || baixo - cima != 0;

	dir = point_direction(0, 0, direita - esquerda, baixo - cima);

	hvel = lengthdir_x(vel * tecla, dir);
	vvel = lengthdir_y(vel * tecla, dir);
	#endregion

	//Colisão//
	#region Collision
	if place_meeting(x + hvel, y, obj_collision){
		while(!place_meeting(x + sign(hvel), y, obj_collision)){
			x += sign(hvel);
		}
		hvel = 0;
	}
	x += hvel;

	if place_meeting(x, y + vvel, obj_collision) {
		while(!place_meeting(x, y + sign(vvel), obj_collision)) {
			y += sign(vvel);
		}
		vvel = 0;
	}
	y += vvel;

	#endregion

	//Mudança de Sprites
	#region AnimationSprites
	if hvel != 0 {
		sprite_index = spr_player_run;
		image_xscale = sign(hvel);
	} else if vvel != 0 {
		sprite_index = spr_player_run;

	}else {
		sprite_index = spr_player_idle;
	}
	if hvel !=0 or vvel != 0  {
		if floor(image_index) == clamp(floor(image_index), 0, 3) && caminhando == false {
			audio_play_sound(snd_walk, 2, true);
			caminhando = true;
		} 
	} else {
		audio_stop_sound(snd_walk);
		caminhando = false;
	}
	#endregion

	#region Diálogo
		if distance_to_object(obj_par_npcs) <= 10 and global.dialogo == false{
			if global.tecla {
				var _npc = instance_nearest(x, y, obj_par_npcs);
				var _dialogo = instance_create_layer(x, y, "Dialogo", obj_dialogo);
				_dialogo.npc_nome = _npc.nome;
			}
		}

	#endregion
