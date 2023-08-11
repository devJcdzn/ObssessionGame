/// @description Inserir descrição aqui
if inicializar == true {
	var _guil = display_get_gui_width();
	var _guia = display_get_gui_height();

	var _xx = 0;
	var _yy = _guia - 200;
	var _c = c_black;

	var _instruction = "F para continuar >>";
	var _stgw = string_width(_instruction);

	falas = string(texto_grid[# Infos.Texto, pagina]);
	var _texto = string_copy(falas, 0, caractere);

	draw_set_font(font_dialogo);

	draw_rectangle_color(_xx, _yy, _guil, _guia, _c, _c, _c, _c, false);
	draw_text(_xx + 16, _yy + 16, string(texto_grid[# Infos.Nome, pagina]));
	draw_text_ext(_xx + 32, _yy + 42, _texto, 32, _guil -64);
	draw_text(_guil - 16 - _stgw, _guia - 64, _instruction);
	
	if op_draw == true{
		var _opx = _xx + 32;
		var _opy = _yy - 48;
		var _opsep = 48;
		var _opborda = 6;
		
		op_selec += keyboard_check_pressed(ord("W")) - keyboard_check_pressed(ord("S"));
		op_selec = clamp(op_selec, 0, op_num - 1);
		
		for (var i =0; i < op_num; i++) {
			var _stringw = string_width(op[i]);
			draw_sprite_ext(spr_op_background, 0, _opx, _opy - (_opsep*i), (_stringw + _opborda * 2)/16, 1, 0, c_white, 1);
			draw_text(_opx + _opborda, _opy - (_opsep*i), op[i]);
			
			if op_selec == i {
				draw_sprite(spr_op_selector, 0, _xx + 8, _opy - (_opsep*i) + 8);
			}
		}
		
		if keyboard_check_pressed(ord("F")){
			var _dialogo = instance_create_layer(x, y, "Dialogo", obj_dialogo);
			_dialogo.npc_nome = op_resposta[op_selec];
			
			instance_destroy();
		}
	}
}
