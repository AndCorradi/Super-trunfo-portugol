programa
{
	inclua biblioteca Util --> ut
	//carta para ser impressa
	cadeia maoJogadorUm[7]
	cadeia maoJogadorPc[7]
	
	//posiçao das cartas
	inteiro cartasJogador[6]
	inteiro cartasPc[6]
	
	//carta do topo
	inteiro cartaTopo
	
	//resposta da pergunta do atributo
	inteiro resposta
	
	//variavel para comparar os resultados
	real auxCompare

	//carta impressa
	cadeia cartaImpressa[9][2] = {{"======Sua carta======", ""},
							{"Nome: ", ""},
							{"Ranking: ", ""},
							{"Velocidade Maxima: ", ""},
							{"Aceleraçao: ", ""},
							{"Cavalos: ", ""},
							{"Cilindradas: ", ""},
							{"Peso: ", ""},
							{"=====================", ""}}

	//numero de cartas na mao
	inteiro cartasNaMaoJogadorUm=3
	inteiro cartasNaMaoJogadorPc=3

	//Vetor que auxilia as cartas a serem distribuidas
	inteiro cartasPossiveis[21] = {0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20} 

	//variaveis indices para os loops
	inteiro i, j
	//Define as cartas
	cadeia carros[21][7] = { 
										  //tipo/VelMax/0-100/cavalos/cilindradas/peso
			{"Mitsubishi Lancer 2014",             "A", "198", "10.7", "160", "1998", "1360"},
			{"Mitsubishi Pajero 2016",             "A", "117", "13.9", "180", "3200", "2070"},
			{"Honda CivicI 2015",                  "A", "231", "7.9",  "206", "2354", "1359"},
			{"Honda City 2015",                    "A", "175", "11.3", "116", "1497", "1126"},
			{"GM Vectra 2011",                     "A", "198", "10.2", "140", "1998", "1268"},
			{"VW Gol GTI 1994",                    "B", "185", "8.8",  "120", "1984", "1025"},
			{"Fiat Doblò 2009",                    "B", "175", "11.6", "132", "1747", "1338"},
			{"GM Celta 2008",                      "B", "157", "13.0", "70",  "999",  "890" },
			{"GM Monza 1996",                      "B", "172", "14.6", "110", "1998", "1105"},
			{"Fiat Idea 2008",                     "B", "182", "10.9", "114", "1796", "1305"},
            	{"VW Parati 1990",                     "C", "169", "10.3", "96",  "1781", "1035"},
            	{"Fiat Palio 2002",                    "C", "183", "11.0", "106", "1580", "1010"},
            	{"GM Corsa 1995",                      "C", "192", "9.8",  "108", "1598", "945" },
            	{"GM Kadett 1998",                     "C", "181", "11.9", "110", "1998", "1050"},
            	{"Ford Fiesta 1998",                   "C", "178", "11.4", "89",  "1388", "1009"},
            	{"VW fusca 1969",                      "D", "105", "45.0", "46",  "1288", "780" },
            	{"Fiat 147 1979",                      "D", "139", "18.6", "61",  "1297", "810" },
            	{"VW Kombi 1987",                      "D", "108", "57.8", "50",  "1588", "1305"},
            	{"Gurgel BR-800 1989",                 "D", "108", "43.5", "32",  "792",  "634" },
            	{"GM Chevette 1973",                   "D", "135", "19.1", "68",  "1398", "870" },
            	{"SUPER TRUNFO UNO C/ ESCADA NO TETO", "S", "400", "2.9",  "66",  "999",  "810" }}

	//Embaralha as cartas possiveis
	funcao embaralhar() { 
		para (i = 0; i < 1; i++) {
			inteiro r = ut.sorteia(0, 20)
			inteiro aux = cartasPossiveis[i]
			cartasPossiveis[i] = cartasPossiveis[r]
			cartasPossiveis[r] = aux
		}
	}

	//distribue as cartas para cada jogador
	funcao distribuir_cartas() {
		para (i = 0; i < 3; i++) {
			cartasJogador[i] = cartasPossiveis[i]
		}
		i = 0
		para (j = 17; j < 20; j++) {
			cartasPc[i] = cartasPossiveis[j]
			i++
		}
	}
	
	funcao vez_jogador() {
		cartaTopo = 0 //cartasJogador[0]
		
		cartaImpressa[1][1] = carros[cartaTopo][0]
		cartaImpressa[2][1] = carros[cartaTopo][1]
		cartaImpressa[3][1] = carros[cartaTopo][2]
		cartaImpressa[4][1] = carros[cartaTopo][3]
		cartaImpressa[5][1] = carros[cartaTopo][4]
		cartaImpressa[6][1] = carros[cartaTopo][5]
		cartaImpressa[7][1] = carros[cartaTopo][6]

		imprimir_carta()
	}

	funcao vez_pc() {
		cartaTopo = cartasJogador[0]
		
		cartaImpressa[1][1] = carros[cartaTopo][0]
		cartaImpressa[2][1] = carros[cartaTopo][1]
		cartaImpressa[3][1] = carros[cartaTopo][2]
		cartaImpressa[4][1] = carros[cartaTopo][3]
		cartaImpressa[5][1] = carros[cartaTopo][4]
		cartaImpressa[6][1] = carros[cartaTopo][5]
		cartaImpressa[7][1] = carros[cartaTopo][6]

		imprimir_carta()
	}

	//imprime a carta do jogador no console
	funcao imprimir_carta() {
		para (i = 0; i < 9; i++) {
			para (j = 0; j < 2; j++) {
				escreva(cartaImpressa[i][j])
			}
			escreva("\n")
		}
		escreva("Escolha o atributo:\n1 - Velocidade Maxima\n2 - Aceleraçao\n3 - Cavalos\n4 - Cilindros\n5 - Peso\n--------> ")
	}
	
	funcao inicio()
	{
		embaralhar()
		distribuir_cartas()
		vez_jogador()
		
		faca {
			
		} enquanto (cartasNaMaoJogadorUm < 6 e cartasNaMaoJogadorPc < 6) //Verifica se alguem venceu

		//Verifica o ganhador
		se (cartasNaMaoJogadorUm == 6) { 
			limpa()
			escreva("-------------------\nO Jogador Venceu :)\n-------------------\n")
		} senao {
			limpa()
			escreva("---------------------\nA Maquina venceu! :(\n---------------------\n")
		}
	}
}
/* $$$ Portugol Studio $$$ 
 * 
 * Esta seção do arquivo guarda informações do Portugol Studio.
 * Você pode apagá-la se estiver utilizando outro editor.
 * 
 * @POSICAO-CURSOR = 3486; 
 * @PONTOS-DE-PARADA = ;
 * @SIMBOLOS-INSPECIONADOS = {i, 40, 9, 1}-{j, 40, 12, 1};
 * @FILTRO-ARVORE-TIPOS-DE-DADO = inteiro, real, logico, cadeia, caracter, vazio;
 * @FILTRO-ARVORE-TIPOS-DE-SIMBOLO = variavel, vetor, matriz, funcao;
 */