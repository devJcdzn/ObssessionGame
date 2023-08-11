function scr_textos(){
	switch npc_nome {
		case "Villager":
			ds_grid_add_text("Opa, bão? Nunca te vi por aqui...", 0, "Membro da vila");
			ds_grid_add_text("Como veio parar nesse fim de mundo?", 0, "Membro da vila");
				add_op("E-eu não sei", "1 - Como veio parar nesse fim de mundo");
				add_op("Que lugar é esse?", "2 - Como veio parar nesse fim de mundo");
		break;
			case "1 - Como veio parar nesse fim de mundo":
				ds_grid_add_text("De qualquer maneira, prazer, meu nome é Jake.", 0, "Jake");
				ds_grid_add_text("Se quiser alguma resposta, eu não sou o cara. Vá prcurar o Nick...", 0, "Jake");
				ds_grid_add_text("Tenho trabalho a fazer, então xispa.", 0, "Jake");
			break;
			case "2 - Como veio parar nesse fim de mundo":
				ds_grid_add_text("Uma ilha sem saída ou entrada, tudo que eu sei sobre este inferno...", 0, "Jake");
				ds_grid_add_text("Esse lugar é mar aos quatro lados, e não tem terra ou ilha há pelo menos uns 250km daqui...", 0, "Jake");
				ds_grid_add_text("O resto só o Nick sabe.", 0, "Jake");
					add_op("Nick?", "Sobre o Nick");
					add_op("Onde eu acho esse Nick?", "Onde está o Nick");
			break;
				case "Sobre o Nick":
					ds_grid_add_text("Ele foi o primeiro a chegar. É tudo que eu sei agora vai embora.", 0, "Jake");
				break;
				case "Onde está o Nick":
					ds_grid_add_text("É só seguir essas árvores que por algum motivo estão em uma linha perfeita e vai achar uma cabana, ele mora lá.", 0, "Jake");
					ds_grid_add_text("Espero ter ajudado por que é tudo que sei. Agora mete o pé que eu enho o que fazer", 0, "Jake");
				break;
	}	
}

function ds_grid_add_row() {
	///@arg ds_grid
	
	var _grid = argument[0];
	ds_grid_resize(_grid, ds_grid_width(_grid), ds_grid_height(_grid) + 1);
	return(ds_grid_height(_grid) - 1);
}

function ds_grid_add_text() {
	///@arg texto
	///@arg lado
	///@arg nome
	
	var _grid = texto_grid;
	var _y = ds_grid_add_row(_grid);
	
	_grid[# 0, _y] = argument[0];
	_grid[# 1, _y] = argument[1];
	_grid[# 2, _y] = argument[2];
}
	
function add_op(_texto, _resposta){
	op[op_num] = _texto;
	op_resposta[op_num] = _resposta;
	
	op_num++;
}