/// @description Inserir descrição aqui
global.dialogo = false;
global.tecla = -1;

enum Infos {
	Texto,
	Lado,
	Nome,
}

npc_nome = "";
texto_grid = ds_grid_create(3, 0);
pagina = 0;

op[0] = "";
op_resposta[0] = "";
op_num = 0;
op_selec = 0;
op_draw = false;

inicializar = false;

falas = string(texto_grid[# Infos.Texto, pagina]);
caractere = 0;
alarm[0] = 1